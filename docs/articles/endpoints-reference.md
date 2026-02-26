# API endpoints reference

This vignette provides a *generated* mapping between exported `tceper`
functions and their underlying TCE-PE API endpoints, based on the
package code and the built-in catalog.

The table below is generated locally (no API calls).

``` r

library(tceper)

# Catalog with endpoint metadata
catalog <- tce_catalog()

# Discover exported wrappers and extract the endpoint used internally.
# We look for calls of the form: tce_cached("Endpoint") or tce_request("Endpoint")
exports <- getNamespaceExports("tceper")

# Keep likely "wrapper" functions
skip <- c(
  "tce_request", "tce_catalog", "tce_endpoint", "tce_params", "tce_fields",
  "tce_cache_info", "tce_cache_clear"
)
wrappers <- setdiff(exports, skip)

extract_endpoint <- function(fn) {
  f <- get(fn, envir = asNamespace("tceper"))
  txt <- paste(deparse(body(f)), collapse = "\n")
  m <- regexpr('tce_(?:cached|request)\\("([^"]+)"', txt, perl = TRUE)
  if (m[1] == -1) return(NA_character_)
  hit <- regmatches(txt, m)
  sub('^tce_(?:cached|request)\\("([^"]+)".*$', "\\1", hit)
}

endpoint <- vapply(wrappers, extract_endpoint, character(1))

mappings <- tibble::tibble(
  r_function = paste0("`", wrappers, "()`"),
  endpoint   = endpoint
) |>
  dplyr::filter(!is.na(endpoint)) |>
  dplyr::left_join(
    catalog |> dplyr::select(endpoint, group, title),
    by = "endpoint"
  ) |>
  dplyr::arrange(group, endpoint, r_function)

mappings
#> # A tibble: 71 × 4
#>    r_function                       endpoint                         group title
#>    <chr>                            <chr>                            <chr> <chr>
#>  1 `tce_state_price_comparison()`   ComparativoPrecoEstado           Desp… Iten…
#>  2 `tce_state_expenditures()`       DespesasEstaduais                Desp… Rela…
#>  3 `tce_municipal_expenditures()`   DespesasMunicipais               Desp… Rela…
#>  4 `tce_commitment_liquidations()`  EmpenhoLiquidacao                Desp… Rela…
#>  5 `tce_commitment_payments()`      EmpenhoPagamento                 Desp… Rela…
#>  6 `tce_commitment_summary()`       EmpenhoResumo                    Desp… Rela…
#>  7 `tce_state_commitment_items()`   ItemEmpenhoEstadual              Desp… Rela…
#>  8 `tce_state_creditor_types()`     TipoCredorEstadual               Desp… List…
#>  9 `tce_municipal_creditor_types()` TipoCredorMunicipal              Desp… List…
#> 10 `tce_municipal_transfers()`      TransferenciasConcedidasMunicip… Desp… Rela…
#> # ℹ 61 more rows
```

## How to use this reference

- Use `tce_catalog(search = "...")` to locate an endpoint of interest.
- Use `tce_params("Endpoint")` to discover available query parameters.
- Use `tce_fields("Endpoint")` to see the output schema.
- Then call the corresponding wrapper function (as listed above) or call
  `tce_request("Endpoint", ...)` directly with API parameter names.

### Example: inspect and query `Contratos`

``` r

tce_params("Contratos")
tce_fields("Contratos")

tce_contracts(codigo_efisco_ug = "510101", ano_contrato = "2025")
```
