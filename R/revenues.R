# ---- Revenues ----------------------------------------------------------------

#' State revenues
#'
#' Retrieve state-level revenue data from the TCE-PE API.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CodigoEfiscoUG`, `AnoReferencia`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to
#'   `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @seealso [tce_params()] to discover available parameters,
#'   [tce_fields()] to see output columns.
#' @export
#' @family revenues
#'
#' @examples
#' \dontrun{
#' tce_state_revenues(id_unidade_gestora = "510101")
#' }
tce_state_revenues <- function(...,
                               verbose = getOption("tceper.verbose", FALSE),
                               cache = TRUE,
                               clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(
    tce_cache_key("ReceitasEstaduais", ..., call = .user_call),
    tce_request("ReceitasEstaduais", ..., clean_names = clean_names, verbose = verbose),
    use_cache = cache
  )
}

#' Municipal revenues
#'
#' Retrieve municipal-level revenue data.
#'
#' @inheritParams tce_state_revenues
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family revenues
#'
#' @examples
#' \dontrun{
#' tce_municipal_revenues(id_unidade_gestora = "384")
#' }
tce_municipal_revenues <- function(...,
                                   verbose = getOption("tceper.verbose", FALSE),
                                   cache = TRUE,
                                   clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(
    tce_cache_key("ReceitasMunicipais", ..., call = .user_call),
    tce_request("ReceitasMunicipais", ..., clean_names = clean_names, verbose = verbose),
    use_cache = cache
  )
}

#' Budgeted revenues (municipal)
#'
#' Retrieve budgeted (forecast) revenue data. Municipal entities only.
#'
#' @inheritParams tce_state_revenues
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family revenues
tce_budgeted_revenues <- function(...,
                                  verbose = getOption("tceper.verbose", FALSE),
                                  cache = TRUE,
                                  clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(
    tce_cache_key("ReceitasPrevistas", ..., call = .user_call),
    tce_request("ReceitasPrevistas", ..., clean_names = clean_names, verbose = verbose),
    use_cache = cache
  )
}
