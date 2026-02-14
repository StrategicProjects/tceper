# ---- Personnel ---------------------------------------------------------------

#' Public servants
#'
#' Retrieve municipal and state public servants (SAGRES Personnel).
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CodigoEfiscoUG`, `Nome`, `Cpf`, `CodigoMunicipio`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family personnel
tce_servants <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ListaServidores", ..., call = .user_call), tce_request("ListaServidores", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

# ---- Reference tables --------------------------------------------------------

#' Municipalities
#'
#' Retrieve the list of municipalities in Pernambuco.
#'
#' @param ... Named query parameters passed directly to the API.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_municipalities <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Municipios", ..., call = .user_call), tce_request("Municipios", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Managed entities (all)
#'
#' Retrieve all managed entities (*unidades jurisdicionadas*), state
#' and municipal.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `Esfera` (`"E"` state, `"M"` municipal), `Natureza`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_entities <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("UnidadesJurisdicionadas", ..., call = .user_call), tce_request("UnidadesJurisdicionadas", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' State managed entities
#'
#' Retrieve state-level managed entities.
#'
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_state_entities <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("UnidadesJurisdicionadasEstaduais", ..., call = .user_call), tce_request("UnidadesJurisdicionadasEstaduais", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Municipal managed entities
#'
#' Retrieve municipal-level managed entities.
#'
#' @param ... Named query parameters. Common: `CodigoMunicipio`.
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_municipal_entities <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("UnidadesJurisdicionadasMunicipais", ..., call = .user_call), tce_request("UnidadesJurisdicionadasMunicipais", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Sub-units of managed entities
#'
#' Retrieve sub-units belonging to managed entities.
#'
#' @param ... Named query parameters. Common: `CodigoEfiscoUG`.
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_sub_units <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("SubunidadesUnidadesJurisdicionadas", ..., call = .user_call), tce_request("SubunidadesUnidadesJurisdicionadas", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Creditor types
#'
#' Lookup table of supplier/creditor types.
#'
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_creditor_types <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoCredor", ..., call = .user_call), tce_request("TipoCredor", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Payroll types
#'
#' Lookup table of payroll (*folha*) types.
#'
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_payroll_types <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoFolha", ..., call = .user_call), tce_request("TipoFolha", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Funding source types
#'
#' Lookup table of funding source types.
#'
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_funding_sources <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoFonteRecurso", ..., call = .user_call), tce_request("TipoFonteRecurso", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Inactivation reason types
#'
#' Lookup table of inactivation reason types.
#'
#' @inheritParams tce_municipalities
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family reference
tce_inactivation_reasons <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("TipoMotivoInativacao", ..., call = .user_call), tce_request("TipoMotivoInativacao", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
