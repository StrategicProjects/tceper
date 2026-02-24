## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.


## Note to CRAN reviewers

This package wraps the Open Data API of the Tribunal de Contas do Estado
de Pernambuco (TCE-PE), a Brazilian government transparency portal.

The API domain (`sistemas.tce.pe.gov.br`) is **geo-restricted** and only
accessible from Brazilian IP addresses. Requests from outside Brazil
receive a connection timeout or are blocked at the network level.

We would like to ask: **does this geo-restriction make the package
ineligible for CRAN?**

We have taken the following measures to ensure the package is fully
functional for reviewers and automated checks regardless of location:

- All examples are wrapped in `\dontrun{}`.
- All vignette code chunks use `eval = FALSE`.
- The built-in endpoint catalog (`inst/extdata/tcepe_dados_abertos_catalogo.json`)
  allows `tce_catalog()`, `tce_params()`, and `tce_fields()` to work
  entirely offline, with no network access required.
- `R CMD check` passes cleanly with no errors, warnings or notes, even
  when the API is unreachable.

The package is intended for Brazilian public policy researchers,
journalists, and civil servants who access TCE-PE data as part of their
work. 

We appreciate any guidance on whether this is acceptable or if additional
steps are needed.
