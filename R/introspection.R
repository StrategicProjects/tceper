# ---- Endpoint introspection --------------------------------------------------

# NOTE: .tce_catalog() is defined in catalog.R (with in-memory caching).
# Do NOT redefine it here.

# Internal: return list of method objects, tolerant to different JSON shapes
.tce_methods <- function(cat) {
  if (is.null(cat$metodos)) return(list())
  met <- cat$metodos
  # Some serializers may turn it into a data.frame; normalize to list-of-lists
  if (is.data.frame(met)) {
    met <- lapply(seq_len(nrow(met)), function(i) as.list(met[i, , drop = FALSE]))
  }
  met
}

# Internal: normalize endpoint key for matching
.tce_norm_key <- function(x) {
  x <- tolower(as.character(x %||% ""))
  x <- gsub("[^a-z0-9]+", "", x)
  x
}


# Internal: derive an R-friendly parameter name from an API name
.tce_make_r_name <- function(api_name) {
  if (is.null(api_name) || is.na(api_name) || !nzchar(as.character(api_name))) {
    return(NA_character_)
  }
  # janitor is imported; this keeps behavior consistent with clean_names elsewhere
  janitor::make_clean_names(as.character(api_name))
}

#' Get the catalog entry for a given endpoint
#'
#' Returns the full metadata for a single endpoint, including its input
#' parameters (`entrada`) and output fields (`saida`). Useful for
#' programmatic access to endpoint metadata.
#'
#' @param endpoint Endpoint name (e.g., `"Municipios"`, `"LicitacaoUG"`,
#'   `"Contratos"`). Use [tce_catalog()] to see all available endpoints.
#' @return A list with endpoint metadata, including `entrada` (input
#'   parameters) and `saida` (output fields) when available.
#'
#' @seealso [tce_catalog()], [tce_params()], [tce_fields()]
#' @export
#'
#' @examples
#' \dontrun{
#' tce_endpoint("Contratos")
#' }
tce_endpoint <- function(endpoint) {
  cat <- .tce_catalog()
  met <- .tce_methods(cat)

  key <- .tce_norm_key(endpoint)
  idx <- which(vapply(met, function(m) .tce_norm_key(m$entidade), character(1)) == key)

  if (length(idx) == 0L) {
    # try partial matches for a friendlier error
    candidates <- vapply(met, function(m) m$entidade %||% "", character(1))
    stop(sprintf("Unknown endpoint '%s'. Use tce_catalog() to list available endpoints.", endpoint), call. = FALSE)
  }
  met[[idx[[1L]]]]
}

#' List available API endpoints
#'
#' Returns a tibble listing all 71 endpoints available in the TCE-PE Open
#' Data API, with their group, description and URL. Use `search` to filter
#' by keyword.
#'
#' @param search Optional character string to filter endpoints by name or
#'   description (case-insensitive). For example, `search = "licit"` returns
#'   all procurement-related endpoints.
#' @return A tibble with columns `endpoint`, `group`, `title`, and `url`.
#'
#' @seealso [tce_params()], [tce_fields()], [tce_endpoint()]
#' @export
#'
#' @examples
#' \dontrun{
#' tce_catalog()
#' tce_catalog(search = "contrat")
#' tce_catalog(search = "municipio")
#' }
tce_catalog <- function(search = NULL) {
  cat <- .tce_catalog()
  met <- .tce_methods(cat)
  df <- tibble::tibble(
    endpoint = vapply(met, function(m) m$entidade %||% NA_character_, character(1)),
    group    = vapply(met, function(m) m$grupo %||% NA_character_, character(1)),
    title    = vapply(met, function(m) m$descricao %||% NA_character_, character(1)),
    url      = vapply(met, function(m) m$url %||% NA_character_, character(1))
  )
  if (!is.null(search) && nzchar(search)) {
    s <- tolower(search)
    keep <- grepl(s, tolower(df$endpoint), fixed = TRUE) | grepl(s, tolower(df$title), fixed = TRUE)
    df <- df[keep, , drop = FALSE]
  }
  df
}

#' List input parameters for an endpoint
#'
#' Returns a tibble describing the query parameters accepted by a given
#' endpoint. The `api_name` column shows the exact name expected by the
#' API; the `r_name` column shows the `snake_case` equivalent that you
#' can pass to wrapper functions.
#'
#' @param endpoint Endpoint name (e.g., `"Municipios"`, `"Contratos"`).
#'   Use [tce_catalog()] to see all available endpoints.
#' @return A tibble with columns `api_name`, `r_name`, `required`, `type`,
#'   and `description`. Has a custom print method that summarises the
#'   parameter names at the top.
#'
#' @seealso [tce_fields()], [tce_catalog()], [tce_endpoint()]
#' @export
#'
#' @examples
#' \dontrun{
#' tce_params("Contratos")
#' tce_params("Municipios")
#' tce_params("LicitacaoUG")
#' }
tce_params <- function(endpoint) {
  e <- tce_endpoint(endpoint)
  ent <- e$entrada %||% list()

  # Normalize entrada to a list-of-lists
  if (is.data.frame(ent)) {
    ent <- lapply(seq_len(nrow(ent)), function(i) as.list(ent[i, , drop = FALSE]))
  } else if (is.list(ent) && !is.null(names(ent)) && !is.list(ent[[1L]])) {
    # single object -> wrap
    ent <- list(ent)
  }


df <- tibble::tibble(
  api_name     = vapply(ent, function(x) x$api_name %||% x$nome %||% x$parametro %||% NA_character_, character(1)),
  r_name       = NA_character_,
  required     = vapply(ent, function(x) isTRUE(x$required %||% x$obrigatorio %||% FALSE), logical(1)),
  type         = vapply(ent, function(x) x$type %||% x$tipo %||% NA_character_, character(1)),
  description  = vapply(ent, function(x) x$description %||% x$descricao %||% NA_character_, character(1))
)
# Derive r_name when not provided by catalog
df$r_name <- vapply(df$api_name, .tce_make_r_name, character(1))
# Simple default type
df$type[is.na(df$type) | !nzchar(df$type)] <- "character"

df <- structure(df, class = c("tce_params_tbl", class(df)))
attr(df, "endpoint") <- e$entidade %||% endpoint
df
}

#' List output fields for an endpoint
#'
#' Returns a tibble describing the columns returned by a given endpoint.
#' When `clean_names = TRUE` (the default), column names are converted
#' from the API's original names to `snake_case`.
#'
#' @param endpoint Endpoint name (e.g., `"Municipios"`, `"Contratos"`).
#'   Use [tce_catalog()] to see all available endpoints.
#' @return A tibble with columns `name`, `type`, and `description`. Has a
#'   custom print method that summarises the field names at the top.
#'
#' @seealso [tce_params()], [tce_catalog()], [tce_endpoint()]
#' @export
#'
#' @examples
#' \dontrun{
#' tce_fields("Contratos")
#' tce_fields("Municipios")
#' }
tce_fields <- function(endpoint) {
  e <- tce_endpoint(endpoint)
  out <- e$saida %||% list()

  if (is.data.frame(out)) {
    out <- lapply(seq_len(nrow(out)), function(i) as.list(out[i, , drop = FALSE]))
  } else if (is.list(out) && !is.null(names(out)) && !is.list(out[[1L]])) {
    out <- list(out)
  }


df <- tibble::tibble(
  name        = vapply(out, function(x) x$name %||% x$campo %||% x$nome %||% NA_character_, character(1)),
  type        = vapply(out, function(x) x$type %||% x$tipo %||% NA_character_, character(1)),
  description = vapply(out, function(x) x$description %||% x$descricao %||% NA_character_, character(1))
)
df$type[is.na(df$type) | !nzchar(df$type)] <- "character"

df <- structure(df, class = c("tce_fields_tbl", class(df)))
attr(df, "endpoint") <- e$entidade %||% endpoint
df
}
