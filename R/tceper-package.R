#' tceper: Access the Open Data API of TCE-PE
#'
#' An R interface to the Open Data API of the Tribunal de Contas do Estado
#' de Pernambuco (TCE-PE), the Court of Accounts of the State of Pernambuco,
#' Brazil. Provides tidy, ready-to-use functions to query public data on
#' revenues, expenditures, commitments, procurement, contracts, agreements,
#' public works, legal processes, personnel and reference tables for all
#' state and municipal government entities in Pernambuco.
#'
#' @section Recommended workflow:
#'
#' 1. **Discover** endpoints with [tce_catalog()] (filter with `search =`).
#' 2. **Inspect** input parameters with [tce_params()] and output fields
#'    with [tce_fields()].
#' 3. **Query** using a wrapper function (e.g. [tce_contracts()]) or the
#'    low-level [tce_request()].
#'
#' @section Parameter names:
#'
#' All query parameters are passed through `...` using the names shown
#' by [tce_params()]. You can use either the original API name (e.g.
#' `CodigoEfiscoUG`) or its `snake_case` equivalent (e.g.
#' `codigo_efisco_ug`); the package maps them automatically.
#'
#' @section Options:
#'
#' \describe{
#'   \item{`tceper.verbose`}{If `TRUE`, all functions print the final API
#'     URL. Default: `FALSE`.}
#'   \item{`tceper.progress`}{If `FALSE`, suppresses progress messages.
#'     Default: `TRUE`.}
#'   \item{`tceper.cache_ttl`}{Cache time-to-live in seconds.
#'     Default: `3600` (1 hour).}
#' }
#'
#' @seealso
#' - [tce_catalog()], [tce_params()], [tce_fields()] — endpoint discovery
#' - [tce_request()] — low-level query function
#' - [tce_cache_info()], [tce_cache_clear()] — cache management
#'
#' @keywords internal
#' @aliases tceper-package
"_PACKAGE"

#' @importFrom rlang .data .env %||%
NULL
