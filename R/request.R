# ---- Core request engine -----------------------------------------------------

#' Perform a request to the TCE-PE Open Data API
#'
#' @description
#' Low-level function that sends a GET request to the TCE-PE Open Data API
#' and returns the response content as a [tibble][tibble::tibble-package].
#' Higher-level wrapper functions such as [tce_contracts()],
#' [tce_state_expenditures()], etc. call this function internally.
#'
#' You can use `tce_request()` directly to access any API endpoint,
#' including those that do not yet have a dedicated wrapper.
#'
#' @param endpoint A character string with the API method name (e.g.,
#'   `"Contratos"`, `"DespesasEstaduais"`). See
#'   <https://sistemas.tcepe.tc.br/DadosAbertos/Exemplo!listar> for the
#'   full list of available endpoints.
#' @param ... Named query parameters. You can use either the API names
#'   (`CamelCase`/`UPPERCASE`) or the snake_case aliases shown by
#'   [tce_params()]. `NULL` values are silently dropped.
#' @param clean_names If `TRUE` (default), column names are converted to
#'   `snake_case` via [janitor::clean_names()]. Set to `FALSE` to keep the
#'   original column names returned by the API.
#' @param max_tries Maximum number of retry attempts for failed requests
#'   (default: `3`). Passed to [httr2::req_retry()].
#' @param progress If `TRUE`, displays progress messages via [cli]. Defaults
#'   to the value of `getOption("tceper.progress")`, or `TRUE` if unset.
#' @param verbose If `TRUE`, prints the final API URL, parameters, and
#'   response metadata (status, content-type, size, elapsed time). Defaults
#'   to `getOption("tceper.verbose", FALSE)`.
#'
#' @return A [tibble][tibble::tibble-package] with the response content.
#'   Returns a zero-row tibble if no records are found.
#'
#' @details
#' ## API base URL
#' `https://sistemas.tcepe.tc.br/DadosAbertos/`
#'
#' ## Network access
#' The API host only accepts connections from **Brazilian IP addresses**.
#' Calls from outside Brazil are dropped at the network level and surface
#' as a connection or TLS error. The offline discovery functions
#' ([tce_catalog()], [tce_params()], [tce_fields()]) do not require
#' network access and work anywhere.
#'
#' ## URL construction
#' The TCE-PE API uses Struts2-style URLs where `!` invokes a method
#' (e.g. `Contratos!json`). The URL is built with `paste0()` to preserve
#' the literal `!` -- using `httr2::req_url_path_append()` would encode it
#' as `%21`, causing the server to ignore all query parameters.
#'
#' ## Response limit
#' The API returns at most **100,000 records** per request. When this limit
#' is reached, a warning is issued suggesting the use of additional filters.
#'
#' ## Encoding
#' The TCE-PE backend runs on **ISO-8859-1** (Latin-1), not UTF-8. The
#' package handles this transparently in both directions:
#'
#' * **Response body** is decoded as Latin-1 and returned as UTF-8 R
#'   strings, so accented Portuguese characters come through cleanly
#'   (`São`, `Município`, `Conceição`, etc.).
#' * **Query parameters** are transcoded UTF-8 -> Latin-1 before
#'   percent-encoding, so filtering by accented values works as
#'   expected (e.g. `tce_municipalities(municipio = "São José da Coroa Grande")`).
#'   You can pass any R string with accents -- the conversion is
#'   automatic.
#'
#' ## Options
#' - `tceper.progress` -- set to `FALSE` to suppress all progress messages.
#' - `tceper.verbose` -- set to `TRUE` to always print request/response details.
#' - `tceper.cache_ttl` -- cache time-to-live in seconds (default: `3600`).
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Direct query to any endpoint
#' tce_request("Contratos", CodigoEfiscoUG = "510101")
#'
#' # Show full request/response details
#' tce_request("Contratos", CodigoEfiscoUG = "510101", verbose = TRUE)
#'
#' # Keep original column names
#' tce_request("Municipios", clean_names = FALSE)
#' }
tce_request <- function(endpoint,
                        ...,
                        clean_names = TRUE,
                        max_tries = 3,
                        progress = getOption("tceper.progress", TRUE),
                        verbose = getOption("tceper.verbose", FALSE)) {
  .user_call <- rlang::caller_call()

  params <- tce_build_params(...)
  .tce_assert_allowed_params(endpoint, params, call = .user_call)
  params <- .tce_map_params(endpoint, params)

  full_url <- .tce_build_request_url(endpoint, params)

  if (verbose) .tce_log_request(endpoint, full_url, params)

  req <- httr2::request(full_url) |>
    httr2::req_retry(max_tries = max_tries) |>
    httr2::req_user_agent("tceper R package (https://github.com/StrategicProjects/tceper)") |>
    httr2::req_error(is_error = function(resp) FALSE)

  if (progress) {
    cli::cli_progress_step(
      "Querying {.field {endpoint}} from the TCE-PE API\u2026",
      msg_done = "Query to {.field {endpoint}} completed.",
      msg_failed = "Failed to query {.field {endpoint}}."
    )
  }

  started <- Sys.time()
  resp <- withCallingHandlers(
    httr2::req_perform(req),
    error = function(e) .tce_explain_request_error(e, endpoint, full_url, call = .user_call)
  )
  elapsed <- as.numeric(difftime(Sys.time(), started, units = "secs"))

  if (verbose) .tce_log_response(resp, elapsed)

  .tce_check_response(resp, endpoint, full_url, call = .user_call)

  parsed <- tryCatch(
    jsonlite::fromJSON(httr2::resp_body_string(resp, encoding = "ISO-8859-1")),
    error = function(e) {
      cli::cli_abort(
        c(
          "x" = "The API response could not be parsed as JSON.",
          "i" = "Endpoint: {.field {endpoint}}",
          "i" = "URL: {.url {full_url}}",
          "i" = "Underlying error: {.emph {conditionMessage(e)}}",
          ">" = "Re-run with {.code verbose = TRUE} to see the raw response."
        ),
        call = .user_call
      )
    }
  )

  resposta <- parsed[["resposta"]]
  if (is.null(resposta)) {
    cli::cli_abort(
      c(
        "x" = "Unexpected response from the TCE-PE API.",
        "i" = "Endpoint {.field {endpoint}} did not return a {.field resposta} field.",
        "i" = "URL: {.url {full_url}}"
      ),
      call = .user_call
    )
  }

  status <- resposta[["status"]]
  if (!identical(status, "OK")) {
    mensagem <- resposta[["mensagem"]] %||% resposta[["message"]] %||% NA_character_
    cli::cli_abort(
      c(
        "x" = "The API returned status {.val {status}} for {.field {endpoint}}.",
        if (!is.na(mensagem)) c("i" = "Message: {.emph {mensagem}}"),
        "i" = "URL: {.url {full_url}}",
        ">" = "Check your query parameters with {.code tce_params(\"{endpoint}\")}."
      ),
      call = .user_call
    )
  }

  tamanho <- as.integer(resposta[["tamanhoResultado"]] %||% 0L)
  limite  <- as.integer(resposta[["limiteResultado"]] %||% 100000L)

  if (tamanho == 0L) {
    if (progress) {
      cli::cli_alert_warning(c(
        "No records found for {.field {endpoint}}.",
        if (length(params)) " Try relaxing or removing filters."
      ))
    }
    return(tibble::tibble())
  }

  if (progress) {
    cli::cli_alert_info("{.val {tamanho}} record{?s} returned in {.val {round(elapsed, 2)}}s.")
  }

  if (tamanho >= limite) {
    cli::cli_warn(c(
      "!" = "Result reached the API limit of {.val {limite}} records.",
      "i" = "Some rows are likely missing.",
      ">" = "Use additional filters (e.g. {.code anoreferencia}, {.code mesreferencia}) to narrow the query."
    ))
  }

  conteudo <- resposta[["conteudo"]]
  if (is.null(conteudo) || length(conteudo) == 0L) {
    return(tibble::tibble())
  }

  resultado <- tibble::as_tibble(conteudo)
  if (clean_names) resultado <- janitor::clean_names(resultado)
  resultado
}


# ---- Internal helpers --------------------------------------------------------

#' Build a parameter list, dropping NULLs
#' @noRd
tce_build_params <- function(...) {
  purrr::compact(list(...))
}

#' Build the actual request URL (preserves the literal '!')
#'
#' The TCE-PE API runs on a Latin-1 backend: query values containing
#' accented characters must be sent as ISO-8859-1 bytes, otherwise the
#' server matches no rows. We transcode UTF-8 inputs to Latin-1, mark
#' the result as raw bytes, then percent-encode.
#' @noRd
.tce_build_request_url <- function(endpoint, params) {
  url <- paste0("https://sistemas.tcepe.tc.br/DadosAbertos/", endpoint, "!json")
  if (length(params) == 0L) return(url)
  query <- paste(
    names(params),
    vapply(params, .tce_url_encode_latin1, character(1)),
    sep = "=", collapse = "&"
  )
  paste0(url, "?", query)
}

#' Percent-encode a query value using ISO-8859-1 byte semantics
#' @noRd
.tce_url_encode_latin1 <- function(value) {
  value <- as.character(value)
  if (!nzchar(value)) return(value)
  # Plain ASCII fast path
  if (!grepl("[^\x01-\x7f]", value, useBytes = TRUE)) {
    return(utils::URLencode(value, reserved = TRUE))
  }
  # Coerce to UTF-8 first so iconv has a defined input encoding,
  # then transcode to Latin-1. Lossy characters become "?".
  enc <- Encoding(value)
  if (enc != "UTF-8") value <- enc2utf8(value)
  latin1 <- iconv(value, from = "UTF-8", to = "ISO-8859-1", sub = "?")
  # Mark as raw bytes so URLencode operates byte-by-byte instead of
  # trying to decode the string as UTF-8.
  Encoding(latin1) <- "bytes"
  utils::URLencode(latin1, reserved = TRUE)
}

#' Build a human-readable URL string (with literal '!'). Validates and maps
#' parameters; kept for backward compatibility with callers that want a
#' pretty URL outside of `tce_request()`.
#' @noRd
tce_build_url <- function(endpoint, ..., call = rlang::caller_call()) {
  params <- tce_build_params(...)
  .tce_assert_allowed_params(endpoint, params, call = call)
  params <- .tce_map_params(endpoint, params)
  .tce_build_request_url(endpoint, params)
}

#' Build a cache key from endpoint and parameters
#' @noRd
tce_cache_key <- function(endpoint, ..., call = rlang::caller_call()) {
  params <- tce_build_params(...)
  .tce_assert_allowed_params(endpoint, params, call = call)
  params <- .tce_map_params(endpoint, params)
  if (length(params) == 0L) return(endpoint)
  params <- params[order(names(params))]
  paste0(endpoint, "?", paste(names(params), params, sep = "=", collapse = "&"))
}

#' Verbose logging -- request side
#' @noRd
.tce_log_request <- function(endpoint, url, params) {
  cli::cli_rule(left = "tceper request")
  cli::cli_alert_info("Endpoint: {.field {endpoint}}")
  cli::cli_alert_info("URL: {.url {url}}")
  if (length(params)) {
    cli::cli_alert_info("Parameters ({length(params)}):")
    cli::cli_ul(.tce_format_params(params))
  } else {
    cli::cli_alert_info("Parameters: {.emph (none)}")
  }
}

#' Verbose logging -- response side
#' @noRd
.tce_log_response <- function(resp, elapsed_secs) {
  status <- httr2::resp_status(resp)
  ctype  <- tryCatch(httr2::resp_content_type(resp), error = function(e) "unknown")
  bytes  <- tryCatch(length(httr2::resp_body_raw(resp)), error = function(e) NA_integer_)
  size   <- .tce_format_bytes(bytes)
  elapsed_s <- round(elapsed_secs, 2)

  cli::cli_alert_info(
    "HTTP {.val {status}} \u00b7 {ctype} \u00b7 {size} \u00b7 {elapsed_s}s"
  )
}

#' Format param list as 'name = value' bullets, truncating long values
#' @noRd
.tce_format_params <- function(params) {
  vals <- vapply(params, function(v) {
    s <- paste(as.character(v), collapse = ", ")
    if (nchar(s) > 60L) paste0(substr(s, 1L, 57L), "\u2026") else s
  }, character(1))
  stats::setNames(
    sprintf("{.field %s} = {.val %s}", names(params), vals),
    rep("*", length(params))
  )
}

#' Human-friendly byte count
#' @noRd
.tce_format_bytes <- function(n) {
  if (is.na(n)) return("? B")
  units <- c("B", "KB", "MB", "GB")
  i <- max(1L, min(length(units), floor(log(max(n, 1), 1024)) + 1L))
  sprintf("%.1f %s", n / 1024^(i - 1), units[i])
}

#' Check that an HTTP response is valid (status 2xx and JSON content)
#' @noRd
.tce_check_response <- function(resp, endpoint, url, call = NULL) {
  if (httr2::resp_is_error(resp)) {
    status <- httr2::resp_status(resp)
    desc   <- httr2::resp_status_desc(resp)
    body   <- .tce_safe_body_excerpt(resp)
    cli::cli_abort(
      c(
        "x" = "HTTP {.val {status}} {desc} when calling {.field {endpoint}}.",
        "i" = "URL: {.url {url}}",
        if (nzchar(body)) c("i" = "Response body: {.emph {body}}")
      ),
      call = call
    )
  }

  ctype <- tryCatch(httr2::resp_content_type(resp), error = function(e) "")
  if (!grepl("json|javascript", ctype, ignore.case = TRUE)) {
    body <- .tce_safe_body_excerpt(resp)
    cli::cli_abort(
      c(
        "x" = "The API did not return JSON for {.field {endpoint}}.",
        "i" = "Content-Type received: {.val {ctype}}",
        "i" = "URL: {.url {url}}",
        if (nzchar(body)) c("i" = "Response excerpt: {.emph {body}}")
      ),
      call = call
    )
  }
}

#' First ~200 chars of the response body, single-line, safely
#' @noRd
.tce_safe_body_excerpt <- function(resp, max_chars = 200L) {
  tryCatch({
    s <- httr2::resp_body_string(resp, encoding = "ISO-8859-1")
    s <- gsub("\\s+", " ", s)
    if (nchar(s) > max_chars) paste0(substr(s, 1L, max_chars - 1L), "\u2026") else s
  }, error = function(e) "")
}

#' Translate low-level libcurl/httr2 errors into actionable messages.
#' Covers: TLS handshake (LibreSSL key-exchange), DNS resolution, timeouts.
#' @noRd
.tce_explain_request_error <- function(cnd, endpoint, url, call = NULL) {
  msg <- paste(conditionMessage(cnd), collapse = " ")
  parent <- cnd$parent
  if (!is.null(parent)) msg <- paste(msg, paste(conditionMessage(parent), collapse = " "))

  is_tls <- grepl("SSL connect error|TLS connect error|certificate|handshake",
                  msg, ignore.case = TRUE)
  is_dns <- grepl("Could not resolve host|getaddrinfo|Name or service not known",
                  msg, ignore.case = TRUE)
  is_timeout <- grepl("Timeout|timed out|Operation too slow", msg, ignore.case = TRUE)

  if (is_dns) {
    cli::cli_abort(
      c(
        "x" = "Could not resolve {.url sistemas.tcepe.tc.br}.",
        "i" = "The TCE-PE API only accepts connections from Brazilian IP addresses.",
        ">" = "Check your internet connection, DNS settings, or VPN location.",
        "i" = "Endpoint: {.field {endpoint}}"
      ),
      call = call, parent = cnd
    )
  }

  if (is_tls) {
    cli::cli_abort(
      c(
        "x" = "TLS handshake with {.url sistemas.tcepe.tc.br} failed.",
        "i" = "If you are outside Brazil, the API is geo-restricted and may drop the connection at the TLS layer.",
        ">" = "Verify that your network can reach the host from a Brazilian IP."
      ),
      call = call, parent = cnd
    )
  }

  if (is_timeout) {
    cli::cli_abort(
      c(
        "x" = "Request to {.field {endpoint}} timed out.",
        "i" = "The TCE-PE API can be slow for broad queries.",
        ">" = "Add more filters to narrow the query, or increase {.code max_tries}."
      ),
      call = call, parent = cnd
    )
  }

  # Fall through: let httr2's error propagate
  invisible()
}
