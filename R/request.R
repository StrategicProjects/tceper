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
#'   <https://sistemas.tce.pe.gov.br/DadosAbertos/Exemplo!listar> for the
#'   full list of available endpoints.
#' @param ... Named query parameters passed to the API **exactly as the
#'   API expects them** (typically `CamelCase`). `NULL` values are silently
#'   dropped. See the API documentation for parameter names.
#' @param clean_names If `TRUE` (default), column names are converted to
#'   `snake_case` via [janitor::clean_names()]. Set to `FALSE` to keep the
#'   original column names returned by the API.
#' @param max_tries Maximum number of retry attempts for failed requests
#'   (default: `3`). Passed to [httr2::req_retry()].
#' @param progress If `TRUE`, displays progress messages via [cli]. Defaults
#'   to the value of `getOption("tceper.progress")`, or `TRUE` if unset.
#' @param verbose If `TRUE`, prints the final API URL to the console before
#'   performing the request. Useful for debugging and testing. Defaults to
#'   `getOption("tceper.verbose", FALSE)`.
#'
#' @return A [tibble][tibble::tibble-package] with the response content.
#'   Returns a zero-row tibble if no records are found.
#'
#' @details
#' ## API base URL
#' `https://sistemas.tce.pe.gov.br/DadosAbertos/`
#'
#' ## URL construction
#' The TCE-PE API uses Struts2-style URLs where `!` invokes a method
#' (e.g. `Contratos!json`). The URL is built with `paste0()` to preserve
#' the literal `!` — using `httr2::req_url_path_append()` would encode it
#' as `%21`, causing the server to ignore all query parameters.
#'
#' ## Response limit
#' The API returns at most **100,000 records** per request. When this limit
#' is reached, a warning is issued suggesting the use of additional filters.
#'
#' ## Encoding
#' The API responds in ISO-8859-1 encoding, which is converted to UTF-8
#' internally.
#'
#' ## Options
#' - `tceper.progress` — set to `FALSE` to suppress all progress messages.
#' - `tceper.verbose` — set to `TRUE` to always print the final API URL.
#' - `tceper.cache_ttl` — cache time-to-live in seconds (default: `3600`).
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Direct query to any endpoint
#' tce_request("Contratos", CodigoEfiscoUG = "510101")
#'
#' # Show the final URL for debugging
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

  # Validate provided parameters against the endpoint catalog (when available)
  .tce_assert_allowed_params(endpoint, params, call = .user_call)

  # Map user-friendly names to the API's official parameter names
  params <- .tce_map_params(endpoint, params)

  # Show clean URL with literal '!' if verbose
  if (verbose) {
    cli::cli_alert_info("API URL: {.url { tce_build_url(endpoint, ...) }}")
    .tce_verbose_help(endpoint)
  }

  # Build the full URL directly to preserve the '!' separator.
  full_url <- paste0(
    "https://sistemas.tce.pe.gov.br/DadosAbertos/",
    endpoint,
    "!json"
  )

  req <- httr2::request(full_url)
  if (length(params) > 0L) {
    req <- do.call(httr2::req_url_query, c(list(req), params))
  }
  req <- req |>
    httr2::req_retry(max_tries = max_tries) |>
    httr2::req_user_agent("tceper R package (https://github.com/StrategicProjects/tceper)") |>
    httr2::req_error(is_error = function(resp) FALSE)

  if (progress) {
    cli::cli_progress_step(
      "Querying {.field {endpoint}} from the TCE-PE API...",
      msg_done = "Query to {.field {endpoint}} completed.",
      msg_failed = "Failed to query {.field {endpoint}}."
    )
  }

  resp <- httr2::req_perform(req)

  tce_check_response(resp, endpoint)

  parsed <- resp |>
    httr2::resp_body_string(encoding = "ISO-8859-1") |>
    jsonlite::fromJSON()

  resposta <- parsed[["resposta"]]

  if (is.null(resposta)) {
    cli::cli_abort(c(
      "x" = "Unexpected response from the TCE-PE API.",
      "i" = "Endpoint {.field {endpoint}} did not return a {.field resposta} field."
    ))
  }

  status <- resposta[["status"]]
  if (!identical(status, "OK")) {
    cli::cli_abort(c(
      "x" = "The API returned status {.val {status}} for {.field {endpoint}}.",
      "i" = "Check your query parameters."
    ))
  }

  tamanho <- as.integer(resposta[["tamanhoResultado"]] %||% 0L)
  limite <- as.integer(resposta[["limiteResultado"]] %||% 100000L)

  if (tamanho == 0L) {
    if (progress) {
      cli::cli_alert_warning("No records found for {.field {endpoint}}.")
    }
    return(tibble::tibble())
  }

  if (progress) {
    cli::cli_alert_info("{.val {tamanho}} record{?s} returned.")
  }

  if (tamanho >= limite) {
    cli::cli_warn(c(
      "!" = "Result reached the limit of {.val {limite}} records.",
      "i" = "Use additional filters to narrow down the query."
    ))
  }

  conteudo <- resposta[["conteudo"]]

  if (is.null(conteudo) || length(conteudo) == 0) {
    return(tibble::tibble())
  }

  resultado <- tibble::as_tibble(conteudo)

  if (clean_names) {
    resultado <- janitor::clean_names(resultado)
  }

  resultado
}


# ---- Internal helpers --------------------------------------------------------

#' Build a parameter list, dropping NULLs
#' @noRd
tce_build_params <- function(...) {
  params <- list(...)
  purrr::compact(params)
}

#' Build a human-readable URL string (with literal '!')
#' @noRd
tce_build_url <- function(endpoint, ..., call = rlang::caller_call()) {
  params <- tce_build_params(...)

  # Validate provided parameters against the endpoint catalog (when available)
  .tce_assert_allowed_params(endpoint, params, call = call)

  # Map user-friendly names to the API's official parameter names
  params <- .tce_map_params(endpoint, params)
  url <- paste0(
    "https://sistemas.tce.pe.gov.br/DadosAbertos/",
    endpoint,
    "!json"
  )
  if (length(params) > 0) {
    query <- paste(names(params), params, sep = "=", collapse = "&")
    url <- paste0(url, "?", query)
  }
  url
}

#' Build a cache key from endpoint and parameters
#' @noRd
tce_cache_key <- function(endpoint, ..., call = rlang::caller_call()) {
  params <- tce_build_params(...)

  # Validate provided parameters against the endpoint catalog (when available)
  .tce_assert_allowed_params(endpoint, params, call = call)

  # Map user-friendly names to the API's official parameter names
  params <- .tce_map_params(endpoint, params)
  params <- .tce_map_params(endpoint, params)

  if (length(params) == 0L) {
    return(endpoint)
  }
  params <- params[order(names(params))]
  param_str <- paste(names(params), params, sep = "=", collapse = "&")
  paste0(endpoint, "?", param_str)
}

#' Check that an HTTP response is valid JSON
#' @noRd
tce_check_response <- function(resp, endpoint) {

  if (httr2::resp_is_error(resp)) {
    status <- httr2::resp_status(resp)
    cli::cli_abort(c(
      "x" = "HTTP request failed with status {.val {status}}.",
      "i" = "Endpoint: {.field {endpoint}}",
      "i" = "URL: {.url { resp$url }}"
    ))
  }

  content_type <- httr2::resp_content_type(resp)
  if (!grepl("json|javascript", content_type, ignore.case = TRUE)) {
    cli::cli_abort(c(
      "x" = "The API did not return JSON.",
      "i" = "Content-Type received: {.val {content_type}}",
      "i" = "Check that the endpoint {.field {endpoint}} is correct."
    ))
  }
}
