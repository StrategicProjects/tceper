# ---- Suppliers ---------------------------------------------------------------

#' Suppliers
#'
#' Retrieve registered suppliers. Partial matching is supported.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CpfCnpj`, `Nome`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family suppliers
tce_suppliers <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Fornecedores", ..., call = .user_call), tce_request("Fornecedores", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Person creditor types
#'
#' Lookup table of person creditor types.
#'
#' @inheritParams tce_suppliers
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family suppliers
tce_person_creditor_types <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoCredorPessoa", ..., call = .user_call), tce_request("TipoCredorPessoa", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Sanctions
#'
#' Retrieve sanctions applied to suppliers.
#'
#' @inheritParams tce_suppliers
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family suppliers
tce_sanctions <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Sancoes", ..., call = .user_call), tce_request("Sancoes", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
