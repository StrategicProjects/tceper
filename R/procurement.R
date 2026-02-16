# ---- Contracts ---------------------------------------------------------------

#' Contracts
#'
#' Retrieve state and municipal contracts.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CodigoEfiscoUG`, `AnoReferencia`, `CodigoMunicipio`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to
#'   `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @seealso [tce_params()] to discover available parameters,
#'   [tce_fields()] to see output columns.
#' @export
#' @family procurement
#'
#' @examples
#' \dontrun{
#' tce_contracts(codigo_efisco_ug = "510101", verbose = TRUE)
#' }
tce_contracts <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(
    tce_cache_key("Contratos", ..., call = .user_call),
    tce_request("Contratos", ..., clean_names = clean_names, verbose = verbose),
    use_cache = cache)
}

#' Contract documents
#'
#' Retrieve documents associated with contracts.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_contract_documents <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ContratoDocumentos", ..., call = .user_call), tce_request("ContratoDocumentos", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Contract line items
#'
#' Retrieve the individual items that compose a contract.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_contract_items <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ContratoItemObjeto", ..., call = .user_call), tce_request("ContratoItemObjeto", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Contract amendments
#'
#' Retrieve addenda / amendments (*termos aditivos*) to contracts.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_contract_amendments <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TermoAditivo", ..., call = .user_call), tce_request("TermoAditivo", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Agreements (Convenios)
#'
#' Retrieve state and municipal agreements (*convênios*).
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_agreements <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Convenios", ..., call = .user_call), tce_request("Convenios", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- Bids (Licitações) ------------------------------------------------------

#' Bids
#'
#' Retrieve public procurement bids (*licitações*).
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bids <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("LicitacaoUG", ..., call = .user_call), tce_request("LicitacaoUG", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Bid details with bidders
#'
#' Retrieve bids with their respective bidders (*licitantes*).
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bid_details <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("LicitacoesDetalhes", ..., call = .user_call), tce_request("LicitacoesDetalhes", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Bid documents
#'
#' Retrieve documents associated with bids.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bid_documents <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("LicitacoesDocumentos", ..., call = .user_call), tce_request("LicitacoesDocumentos", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- Procurement lookup tables -----------------------------------------------

#' Bid stages
#'
#' Lookup table of bid process stages.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bid_stages <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("EstagioLicitacao", ..., call = .user_call), tce_request("EstagioLicitacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Bid modalities
#'
#' Lookup table of bid modality types.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bid_modalities <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ModalidadeLicitacao", ..., call = .user_call), tce_request("ModalidadeLicitacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Bid statuses
#'
#' Lookup table of bid status types.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bid_statuses <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("SituacaoLicitacao", ..., call = .user_call), tce_request("SituacaoLicitacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Object characteristics
#'
#' Lookup table of procurement object characteristic types.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_object_characteristics <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("CaracteristicaObjeto", ..., call = .user_call), tce_request("CaracteristicaObjeto", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Object classifications
#'
#' Lookup table of procurement object classification types.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_object_classifications <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ClassificacaoObjeto", ..., call = .user_call), tce_request("ClassificacaoObjeto", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Bid legal basis
#'
#' Lookup table of legal basis types for bids.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_bid_legal_basis <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("FundamentacaoLegalLicitacao", ..., call = .user_call), tce_request("FundamentacaoLegalLicitacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Object nature types
#'
#' Lookup table of procurement object nature types.
#'
#' @inheritParams tce_contracts
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family procurement
tce_object_nature <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("NaturezaObjeto", ..., call = .user_call), tce_request("NaturezaObjeto", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
