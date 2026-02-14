# ---- Endpoint introspection --------------------------------------------------
# All documentation strings are in English (per package guidelines)

#' Load the built-in endpoint catalog
#'
#' This catalog is used to discover available endpoints, their input parameters,
#' and output fields.
#'
#' @keywords internal
#' @noRd
.tce_catalog <- function() {
  path <- system.file("extdata", "tcepe_dados_abertos_catalogo.json", package = "tceper")
  if (identical(path, "")) {
    stop("Catalog file not found inside the package. Please reinstall tceper.", call. = FALSE)
  }
  jsonlite::fromJSON(path, simplifyVector = FALSE)
}

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
#' @param endpoint Endpoint name (e.g., "Municipios", "LicitacaoUG").
#' @return A list with endpoint metadata, including `entrada` and `saida` when available.
#' @export
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

#' List available endpoints
#'
#' @param search Optional text to filter by endpoint name/description.
#' @return A tibble with endpoint names and basic metadata.
#' @export
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
#' @param endpoint Endpoint name (e.g., "Municipios", "LicitacaoUG").
#' @return A tibble with parameter metadata. Column `api_name` is the exact query
#'   name expected by the API.
#' @export
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
#' @param endpoint Endpoint name (e.g., "Municipios", "LicitacaoUG").
#' @return A tibble with output field metadata.
#' @export
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
