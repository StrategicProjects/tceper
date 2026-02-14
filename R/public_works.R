# ---- Public works ------------------------------------------------------------

#' Public works
#'
#' Retrieve engineering works and services overseen by the Court of Accounts.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CodigoEfiscoUG`, `CodigoMunicipio`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family public_works
tce_public_works <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Obras", ..., call = .user_call), tce_request("Obras", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Public works contractor data
#'
#' Retrieve data on companies contracted for public works.
#'
#' @inheritParams tce_public_works
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family public_works
tce_public_works_contractors <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ObrasDadosContratacao", ..., call = .user_call), tce_request("ObrasDadosContratacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Public works audit data
#'
#' Retrieve audit data on public works.
#'
#' @inheritParams tce_public_works
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family public_works
tce_public_works_audits <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("DadosObrasAuditoria", ..., call = .user_call), tce_request("DadosObrasAuditoria", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' School transport
#'
#' Retrieve school transport services overseen by the Court of Accounts.
#'
#' @inheritParams tce_public_works
#' @return A [tibble][tibble::tibble-package].
#' @export
tce_school_transport <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TransporteEscolar", ..., call = .user_call), tce_request("TransporteEscolar", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
