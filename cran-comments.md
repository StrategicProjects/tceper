## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.


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
* Geo-restriction is documented in the README and in the help pages of
  the entry-point functions (`?tce_request`, `package?tceper`), so end
  users know what to expect.
* `R CMD check --as-cran` passes with 0 errors / 0 warnings and the
  single expected "new release" note, regardless of network reachability
  of the API host.

The target audience is Brazilian public-policy researchers, journalists,
civil servants, and academic users (the package was developed in
collaboration with TCE-PE personnel), who access the API from Brazilian
networks where geo-restriction does not apply.


## Note on text encoding

The TCE-PE API serves responses in ISO-8859-1 (Latin-1) rather than
UTF-8. The package handles this explicitly:

* Response bodies are decoded with `encoding = "ISO-8859-1"` and
  returned as UTF-8 R strings.
* Query parameter values are transcoded UTF-8 -> Latin-1 and
  percent-encoded byte-by-byte before being appended to the URL, so
  users can pass accented Portuguese strings (e.g. `municipio = "São
  José"`) and the server matches them correctly.

The package source contains no non-ASCII characters in R code or
NAMESPACE directives (`tools::showNonASCIIfile()` reports clean); all
Latin-1 handling happens at runtime against incoming/outgoing bytes.
