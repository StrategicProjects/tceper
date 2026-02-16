# ---- Expenditures ------------------------------------------------------------

#' State expenditures
#'
#' Retrieve state-level expenditure data.
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
#' @family expenditures
#'
#' @examples
#' \dontrun{
#' tce_state_expenditures(id_unidade_gestora = "510101")
#' }
tce_state_expenditures <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("DespesasEstaduais", ..., call = .user_call), tce_request("DespesasEstaduais", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Municipal expenditures
#'
#' Retrieve municipal-level expenditure data.
#'
#' @inheritParams tce_state_expenditures
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family expenditures
tce_municipal_expenditures <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("DespesasMunicipais", ..., call = .user_call), tce_request("DespesasMunicipais", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Municipal granted transfers
#'
#' Retrieve inter-unit transfers granted within the same municipality.
#'
#' @inheritParams tce_state_expenditures
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family expenditures
tce_municipal_transfers <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TransferenciasConcedidasMunicipais", ..., call = .user_call), tce_request("TransferenciasConcedidasMunicipais", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Municipal creditor types
#'
#' Lookup table of municipal creditor types.
#'
#' @inheritParams tce_state_expenditures
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family expenditures
tce_municipal_creditor_types <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoCredorMunicipal", ..., call = .user_call), tce_request("TipoCredorMunicipal", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' State creditor types
#'
#' Lookup table of state creditor types.
#'
#' @inheritParams tce_state_expenditures
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family expenditures
tce_state_creditor_types <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoCredorEstadual", ..., call = .user_call), tce_request("TipoCredorEstadual", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- Commitments (Empenhos) --------------------------------------------------

#' Commitment summary
#'
#' Retrieve original values, reinforcements and cancellations for budget
#' commitments (*empenhos*), for both municipal and state entities.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CodigoEfiscoUG`, `NumeroEmpenho`, `AnoReferencia`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to
#'   `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family commitments
tce_commitment_summary <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("EmpenhoResumo", ..., call = .user_call), tce_request("EmpenhoResumo", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Commitment liquidations
#'
#' Retrieve liquidation records for budget commitments.
#'
#' @inheritParams tce_commitment_summary
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family commitments
tce_commitment_liquidations <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("EmpenhoLiquidacao", ..., call = .user_call), tce_request("EmpenhoLiquidacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Commitment payments
#'
#' Retrieve payment records for budget commitments (municipal only).
#'
#' @inheritParams tce_commitment_summary
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family commitments
tce_commitment_payments <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("EmpenhoPagamento", ..., call = .user_call), tce_request("EmpenhoPagamento", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' State commitment line items
#'
#' Retrieve individual line items of state-level commitments.
#'
#' @inheritParams tce_commitment_summary
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family commitments
tce_state_commitment_items <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ItemEmpenhoEstadual", ..., call = .user_call), tce_request("ItemEmpenhoEstadual", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' State price comparison
#'
#' Retrieve state commitment items with values for price comparison.
#'
#' @inheritParams tce_commitment_summary
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family commitments
tce_state_price_comparison <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ComparativoPrecoEstado", ..., call = .user_call), tce_request("ComparativoPrecoEstado", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
