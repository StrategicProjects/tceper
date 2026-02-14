# ---- Legal processes ---------------------------------------------------------

#' Legal processes
#'
#' Retrieve the list of formalized physical and electronic processes.
#'
#' @param ... Named query parameters passed directly to the API.
#'   Common filters: `CodigoEfiscoUG`, `AnoReferencia`, `CodigoMunicipio`.
#' @param verbose If `TRUE`, prints the final API URL.
#' @param cache If `TRUE` (default), returns cached results when available.
#' @param clean_names If `TRUE` (default), converts column names to
#'   `snake_case`.
#'
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_processes <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Processos", ..., call = .user_call), tce_request("Processos", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Determinations
#'
#' Retrieve determinations from adjudicated electronic processes.
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_determinations <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Determinacoes", ..., call = .user_call), tce_request("Determinacoes", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Consideranda
#'
#' Retrieve *considerandos* (findings/grounds) from adjudicated processes.
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_consideranda <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Considerandos", ..., call = .user_call), tce_request("Considerandos", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Recommendations
#'
#' Retrieve recommendations from adjudicated electronic processes.
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_recommendations <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Recomendacoes", ..., call = .user_call), tce_request("Recomendacoes", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Process outcomes
#'
#' Retrieve outcomes of adjudicated electronic processes.
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_outcomes <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("Resultados", ..., call = .user_call), tce_request("Resultados", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Retirement, pension and reform outcomes
#'
#' Retrieve outcomes from processes related to retirement, pension and
#' reform (*Aposentadoria, Pensão e Reforma*).
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_retirement_outcomes <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ResultadosAPR", ..., call = .user_call), tce_request("ResultadosAPR", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Special accountability outcomes
#'
#' Retrieve outcomes from special accountability processes
#' (*Tomada de Conta Especial*).
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_special_accountability <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("ResultadosTomadaContaEspecial", ..., call = .user_call), tce_request("ResultadosTomadaContaEspecial", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Debts and fines
#'
#' Retrieve debts and fines imposed.
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_debts_fines <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("DebitosMultas", ..., call = .user_call), tce_request("DebitosMultas", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}

#' Spending limits
#'
#' Retrieve spending-limit data from government account processes.
#'
#' @inheritParams tce_processes
#' @return A [tibble][tibble::tibble-package].
#' @export
#' @family processes
tce_spending_limits <- function(..., verbose = getOption("tceper.verbose", FALSE), cache = TRUE, clean_names = TRUE) {
  .user_call <- rlang::caller_call()
  tce_cached(tce_cache_key("DadosLimiteGastos", ..., call = .user_call), tce_request("DadosLimiteGastos", ..., clean_names = clean_names, verbose = verbose), use_cache = cache)
}
