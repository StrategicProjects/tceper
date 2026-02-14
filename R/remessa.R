# ---- RemessaTCEPE lookup tables ----------------------------------------------

#' Benefit types (Remessa)
#'
#' Lookup table of benefit types (RemessaTCEPE system).
#'
#' @param ... Named query parameters passed directly to the API.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_benefit_types <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoBeneficio", ..., call = .user_call), tce_request("TipoBeneficio", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Reference sources (Remessa)
#'
#' Lookup table of reference sources for cost-estimate imports.
#'
#' @inheritParams tce_benefit_types
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_reference_sources <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("FonteReferencia", ..., call = .user_call), tce_request("FonteReferencia", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Reference dates (Remessa)
#'
#' Available dates for reference sources in cost-estimate imports.
#'
#' @inheritParams tce_benefit_types
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_reference_dates <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("DataReferencia", ..., call = .user_call), tce_request("DataReferencia", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Reference codes (Remessa)
#'
#' Reference codes for cost-estimate item imports.
#'
#' @inheritParams tce_benefit_types
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_reference_codes <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("CodigoReferencia", ..., call = .user_call), tce_request("CodigoReferencia", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Price update indices (Remessa)
#'
#' Indices for updating prices in cost-estimate spreadsheets.
#'
#' @inheritParams tce_benefit_types
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_update_indices <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("IndiceAtualizacao", ..., call = .user_call), tce_request("IndiceAtualizacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Budget item statuses (Remessa)
#'
#' Possible statuses for cost-estimate items/lots.
#'
#' @inheritParams tce_benefit_types
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_budget_statuses <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("OrcamentoSituacao", ..., call = .user_call), tce_request("OrcamentoSituacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- RemessaTCEPE: Legal instruments -----------------------------------------

#' Legal instruments (Remessa)
#'
#' Retrieve legal instruments from RemessaTCEPE.
#'
#' @param ... Named query parameters. Common: `CodigoEfiscoUG`.
#' @inheritParams tce_benefit_types
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_legal_instruments <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_InstrumentoJuridico", ..., call = .user_call), tce_request("Remessa_InstrumentoJuridico", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Legal instrument documents (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_legal_instrument_documents <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_InstrumentoJuridicoDocumento", ..., call = .user_call), tce_request("Remessa_InstrumentoJuridicoDocumento", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Legal instrument items (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_legal_instrument_items <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_InstrumentoJuridicoItens", ..., call = .user_call), tce_request("Remessa_InstrumentoJuridicoItens", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Legal instrument participants (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_legal_instrument_participants <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_InstrumentoJuridicoParticipantes", ..., call = .user_call), tce_request("Remessa_InstrumentoJuridicoParticipantes", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- RemessaTCEPE: Procurement processes -------------------------------------

#' Procurement processes (Remessa)
#'
#' Retrieve procurement processes from RemessaTCEPE.
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_procurement_processes <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_ProcessoContratacao", ..., call = .user_call), tce_request("Remessa_ProcessoContratacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Procurement process documents (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_procurement_process_documents <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_ProcessoContratacaoDocumento", ..., call = .user_call), tce_request("Remessa_ProcessoContratacaoDocumento", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Procurement process budget (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_procurement_process_budget <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_ProcessoContratacaoOrcamento", ..., call = .user_call), tce_request("Remessa_ProcessoContratacaoOrcamento", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Procurement process participants (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_procurement_process_participants <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_ProcessoContratacaoParticipantes", ..., call = .user_call), tce_request("Remessa_ProcessoContratacaoParticipantes", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- RemessaTCEPE: Public works ----------------------------------------------

#' Public works details (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_remessa_works <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_Obra", ..., call = .user_call), tce_request("Remessa_Obra", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Public works execution (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_remessa_works_execution <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_ObraExecucao", ..., call = .user_call), tce_request("Remessa_ObraExecucao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Public works geometry (Remessa)
#'
#' @inheritParams tce_legal_instruments
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family remessa
tce_remessa_works_geometry <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Remessa_ObraGeometria", ..., call = .user_call), tce_request("Remessa_ObraGeometria", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
