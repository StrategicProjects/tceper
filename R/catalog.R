# ---- Endpoint catalog & parameter mapping ------------------------------------

`%||%` <- function(x, y) if (is.null(x)) y else x

.tce_catalog_env <- new.env(parent = emptyenv())

.tce_catalog <- function() {
  if (exists("data", envir = .tce_catalog_env, inherits = FALSE)) {
    return(get("data", envir = .tce_catalog_env, inherits = FALSE))
  }

  path <- system.file("extdata", "tcepe_dados_abertos_catalogo.json", package = "tceper")
  if (!nzchar(path) || !file.exists(path)) {
    assign("data", NULL, envir = .tce_catalog_env)
    return(NULL)
  }

  # Keep nested structures as lists
  cat <- jsonlite::fromJSON(path, simplifyVector = FALSE)

  # Defensive: ensure expected shape
  if (is.null(cat$metodos)) {
    assign("data", NULL, envir = .tce_catalog_env)
    return(NULL)
  }

  assign("data", cat, envir = .tce_catalog_env)
  cat
}

.tce_find_method <- function(endpoint, catalog = .tce_catalog()) {
  if (is.null(catalog)) return(NULL)
  methods <- catalog$metodos
  if (!is.list(methods)) return(NULL)

  ep_norm <- tolower(endpoint)

  # metodos is a list of methods (simplifyVector=FALSE)
  for (m in methods) {
    ent <- m$entidade %||% m$endpoint %||% ""
    if (tolower(ent) == ep_norm) return(m)
  }

  # Fallback: try removing underscores/spaces and comparing
  ep_key <- gsub("[^a-z0-9]+", "", ep_norm)
  for (m in methods) {
    ent <- m$entidade %||% m$endpoint %||% ""
    ent_key <- gsub("[^a-z0-9]+", "", tolower(ent))
    if (ent_key == ep_key) return(m)
  }

  NULL
}

.tce_param_key <- function(x) {
  gsub("[^a-z0-9]+", "", tolower(x %||% ""))
}

.tce_build_param_lookup <- function(method) {
  entrada <- method$entrada
  if (is.null(entrada) || length(entrada) == 0) return(list())

  # entrada is expected as list of param objects
  lookup <- list()
  for (p in entrada) {
    api_name <- p$api_name %||% p$nome %||% p$param %||% NULL
    if (is.null(api_name)) next

    # Match against API name and common variants
    keys <- unique(c(
      .tce_param_key(api_name),
      .tce_param_key(gsub("_", "", api_name)),
      .tce_param_key(tolower(api_name))
    ))

    # Also accept snake_case user inputs for CamelCase api names
    snake <- janitor::make_clean_names(api_name)
    keys <- unique(c(keys, .tce_param_key(snake)))

    for (k in keys) {
      lookup[[k]] <- api_name
    }
  }

  lookup
}

# Map user-provided parameter names to the API's official api_name
.tce_map_params <- function(endpoint, params) {
  if (length(params) == 0L) return(params)

  method <- .tce_find_method(endpoint)
  if (is.null(method)) return(params)

  lookup <- .tce_build_param_lookup(method)
  if (length(lookup) == 0L) return(params)

  new_names <- names(params)
  for (i in seq_along(new_names)) {
    nm <- new_names[[i]]
    key <- .tce_param_key(nm)
    api <- lookup[[key]]
    if (!is.null(api) && nzchar(api)) {
      new_names[[i]] <- api
    }
  }
  names(params) <- new_names
  params
}


# Validate that user-provided query parameters exist for the given endpoint.
# If unknown parameters are found, abort with a helpful cli list of allowed
# parameters. The list displays the R-friendly `r_name` as {.field ...} and the
# exact API parameter name (`api_name`) in plain text.
.tce_allowed_params_tbl <- function(method) {
  entrada <- method$entrada %||% list()
  if (is.null(entrada) || length(entrada) == 0L) {
    return(tibble::tibble(r_name = character(), api_name = character()))
  }

  api <- vapply(
    entrada,
    function(p) p$api_name %||% p$nome %||% p$param %||% p$parametro %||% NA_character_,
    character(1)
  )
  api <- api[!is.na(api) & nzchar(api)]
  if (length(api) == 0L) {
    return(tibble::tibble(r_name = character(), api_name = character()))
  }

  tibble::tibble(
    r_name   = janitor::make_clean_names(api),
    api_name = api
  )
}

.tce_abort_unknown_params <- function(endpoint, unknown, allowed_tbl, call = rlang::caller_env()) {
  unknown_str <- paste(unknown, collapse = ", ")

  if (!requireNamespace("cli", quietly = TRUE)) {
    allowed_str <- paste(sprintf("%s (%s)", allowed_tbl$r_name, allowed_tbl$api_name), collapse = ", ")
    stop(
      sprintf(
        "Unknown query parameter(s) for endpoint %s: %s. Allowed parameters: %s",
        endpoint, unknown_str, allowed_str
      ),
      call. = FALSE
    )
  }

  cli::cli_alert_danger("Unknown query parameter(s) for endpoint {.field {endpoint}}: {unknown_str}")
  cli::cli_alert_info("Allowed parameters:")
  cli::cli_ul()
  for (i in seq_len(nrow(allowed_tbl))) {
    invisible(cli::cli_li("{.field {allowed_tbl$r_name[i]}} ({allowed_tbl$api_name[i]})"))
  }
  cli::cli_abort("Invalid query parameter(s).", call = call)
}

.tce_assert_allowed_params <- function(endpoint, params, call = rlang::caller_env()) {
  if (length(params) == 0L) return(invisible(TRUE))

  method <- .tce_find_method(endpoint)
  if (is.null(method)) return(invisible(TRUE))

  lookup <- .tce_build_param_lookup(method)
  if (length(lookup) == 0L) return(invisible(TRUE))

  nm <- names(params)
  if (is.null(nm) || !length(nm)) return(invisible(TRUE))

  unknown <- nm[!vapply(nm, function(x) !is.null(lookup[[.tce_param_key(x)]]), logical(1))]
  if (length(unknown)) {
    allowed_tbl <- .tce_allowed_params_tbl(method)
    # Sort for stable display
    if (nrow(allowed_tbl)) {
      allowed_tbl <- allowed_tbl[order(allowed_tbl$r_name, allowed_tbl$api_name), , drop = FALSE]
    }
    .tce_abort_unknown_params(endpoint, unknown, allowed_tbl, call = call)
  }

  invisible(TRUE)
}
