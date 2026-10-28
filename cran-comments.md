## Update release (0.1.4 -> 0.1.5)

This release tracks an upstream change in the TCE-PE Open Data API and
fixes two bugs in the offline introspection helpers:

* New wrapper `tce_legal_instrument_terms()` for the endpoint
  `Remessa_InstrumentoJuridicoTermos`, added by TCE-PE after 0.1.4 was
  published.
* The built-in endpoint catalog was refreshed against the live API
  (now 72 endpoints; one new input parameter on
  `UnidadesJurisdicionadas`; corrected type metadata).
* `tce_params()` now reports mandatory parameters correctly and both
  `tce_params()` and `tce_fields()` show the actual API types.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Note on network access (CRAN policy 1.1)

`tceper` is a thin client for the Open Data API of the Tribunal de Contas
do Estado de Pernambuco (TCE-PE), a Brazilian state-level transparency
portal. The API host (`sistemas.tcepe.tc.br`) **only accepts
connections from Brazilian IP addresses**; requests from outside Brazil
(including CRAN check machines) are dropped at the network level.

The package is designed so that this restriction does **not** affect
CRAN checks, examples, or vignette builds:

* All examples that perform network requests are wrapped in
  `\dontrun{}`. No example calls the API at check time.
* All vignette code chunks that issue requests are evaluated with
  `eval = FALSE`. Vignettes are shipped as pre-rendered HTML.
* The package's discovery layer (`tce_catalog()`, `tce_endpoint()`,
  `tce_params()`, `tce_fields()`) reads from a built-in JSON catalog at
  `inst/extdata/tcepe_dados_abertos_catalogo.json` and is fully usable
  offline. These are the functions exercised by examples in the
  reference manual.

## Note on text encoding

The TCE-PE API serves responses in ISO-8859-1 (Latin-1) rather than
UTF-8. The package decodes response bodies explicitly and transcodes
query parameters UTF-8 -> Latin-1 before percent-encoding. The package
source contains no non-ASCII characters in R code or NAMESPACE
directives (`tools::showNonASCIIfile()` reports clean).
