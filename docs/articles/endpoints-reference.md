# API endpoints reference

This vignette provides a *generated* mapping between exported `tceper`
functions and their underlying TCE-PE API endpoints, based on the
package code and the built-in catalog.

The table below is generated locally **from the built-in catalog** — no
API call is made, so it builds anywhere regardless of network access.
The example block at the end of the vignette is shown but not executed
(the API is only reachable from Brazilian IP addresses).

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`tceper`](https://strategicprojects.github.io/tceper/)`)`\
\
`# Catalog with endpoint metadata`\
`catalog`` ``<-`` `[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``)`\
\
`# Discover exported wrappers and extract the endpoint used internally.`\
`# We look for calls of the form: tce_cached("Endpoint") or tce_request("Endpoint")`\
`exports`` ``<-`` `[`getNamespaceExports`](https://rdrr.io/r/base/ns-reflect.html)`(``"tceper"``)`\
\
`# Keep likely "wrapper" functions`\
`skip`` ``<-`` `[`c`](https://rdrr.io/r/base/c.html)`(`\
`  ``"tce_request"``, ``"tce_catalog"``, ``"tce_endpoint"``, ``"tce_params"``, ``"tce_fields"``,`\
`  ``"tce_cache_info"``, ``"tce_cache_clear"`\
`)`\
`wrappers`` ``<-`` `[`setdiff`](https://rdrr.io/r/base/sets.html)`(``exports``, ``skip``)`\
\
`extract_endpoint`` ``<-`` ``function``(``fn``)`` ``{`\
`  ``f`` ``<-`` `[`get`](https://rdrr.io/r/base/get.html)`(``fn``, envir ``=`` `[`asNamespace`](https://rdrr.io/r/base/ns-internal.html)`(``"tceper"``)``)`\
`  ``txt`` ``<-`` `[`paste`](https://rdrr.io/r/base/paste.html)`(`[`deparse`](https://rdrr.io/r/base/deparse.html)`(`[`body`](https://rdrr.io/r/base/body.html)`(``f``)``)``, collapse ``=`` ``"\n"``)`\
`  ``m`` ``<-`` `[`regexpr`](https://rdrr.io/r/base/grep.html)`(``'tce_(?:cached|request)\\("([^"]+)"'``, ``txt``, perl ``=`` ``TRUE``)`\
`  ``if`` ``(``m``[``1``]`` ``==`` ``-``1``)`` `[`return`](https://rdrr.io/r/base/function.html)`(``NA_character_``)`\
`  ``hit`` ``<-`` `[`regmatches`](https://rdrr.io/r/base/regmatches.html)`(``txt``, ``m``)`\
`  `[`sub`](https://rdrr.io/r/base/grep.html)`(``'^tce_(?:cached|request)\\("([^"]+)".*$'``, ``"\\1"``, ``hit``)`\
`}`\
\
`endpoint`` ``<-`` `[`vapply`](https://rdrr.io/r/base/lapply.html)`(``wrappers``, ``extract_endpoint``, `[`character`](https://rdrr.io/r/base/character.html)`(``1``)``)`\
\
`mappings`` ``<-`` ``tibble``::`[`tibble`](https://tibble.tidyverse.org/reference/tibble.html)`(`\
`  r_function ``=`` `[`paste0`](https://rdrr.io/r/base/paste.html)`(``` "`" ```, ``wrappers``, ``` "()`" ```)``,`\
`  endpoint   ``=`` ``endpoint`\
`)`` ``|>`\
`  ``dplyr``::`[`filter`](https://dplyr.tidyverse.org/reference/filter.html)`(``!`[`is.na`](https://rdrr.io/r/base/NA.html)`(``endpoint``)``)`` ``|>`\
`  ``dplyr``::`[`left_join`](https://dplyr.tidyverse.org/reference/mutate-joins.html)`(`\
`    ``catalog`` ``|>`` ``dplyr``::`[`select`](https://dplyr.tidyverse.org/reference/select.html)`(``endpoint``, ``group``, ``title``)``,`\
`    by ``=`` ``"endpoint"`\
`  ``)`` ``|>`\
`  ``dplyr``::`[`arrange`](https://dplyr.tidyverse.org/reference/arrange.html)`(``group``, ``endpoint``, ``r_function``)`\
\
`mappings`\
`#> ``# A tibble: 72 × 4`\
`#>    r_function                       endpoint                         group title`\
`#>    ``<chr>``                            ``<chr>``                            ``<chr>`` ``<chr>`\
`#> `` 1```  `tce_state_price_comparison()`   ComparativoPrecoEstado           Desp… Iten… ``\
`#> `` 2```  `tce_state_expenditures()`       DespesasEstaduais                Desp… Rela… ``\
`#> `` 3```  `tce_municipal_expenditures()`   DespesasMunicipais               Desp… Rela… ``\
`#> `` 4```  `tce_commitment_liquidations()`  EmpenhoLiquidacao                Desp… Rela… ``\
`#> `` 5```  `tce_commitment_payments()`      EmpenhoPagamento                 Desp… Rela… ``\
`#> `` 6```  `tce_commitment_summary()`       EmpenhoResumo                    Desp… Rela… ``\
`#> `` 7```  `tce_state_commitment_items()`   ItemEmpenhoEstadual              Desp… Rela… ``\
`#> `` 8```  `tce_state_creditor_types()`     TipoCredorEstadual               Desp… List… ``\
`#> `` 9```  `tce_municipal_creditor_types()` TipoCredorMunicipal              Desp… List… ``\
`#> ``10```  `tce_municipal_transfers()`      TransferenciasConcedidasMunicip… Desp… Rela… ``\
`#> ``# ℹ 62 more rows`

## How to use this reference

- Use `tce_catalog(search = "...")` to locate an endpoint of interest.
- Use `tce_params("Endpoint")` to discover available query parameters.
- Use `tce_fields("Endpoint")` to see the output schema.
- Then call the corresponding wrapper function (as listed above) or call
  `tce_request("Endpoint", ...)` directly with API parameter names.

### Example: inspect and query `Contratos`

\
[`tce_params`](https://strategicprojects.github.io/tceper/reference/tce_params.md)`(``"Contratos"``)`\
[`tce_fields`](https://strategicprojects.github.io/tceper/reference/tce_fields.md)`(``"Contratos"``)`\
\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``, ano_contrato ``=`` ``"2025"``)`
