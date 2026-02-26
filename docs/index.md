# tceper

`tceper` is an R client for the [TCE-PE](https://www.tce.pe.gov.br/)
(Tribunal de Contas do Estado de Pernambuco) Open Data API.

The package wraps **71 API endpoints** into user-friendly functions that
accept `snake_case` parameter names and return tibbles. A built-in
catalog lets you discover endpoints, inspect their input parameters and
output fields — all without leaving R.

[TABLE]

[TABLE]

## Installation

``` r

# install.packages("remotes")
remotes::install_github("StrategicProjects/tceper")
```

## Quick start

``` r

library(tceper)

# 1. Discover endpoints
tce_catalog()
tce_catalog(search = "contrat")

# 2. Inspect parameters and output fields
tce_params("Contratos")
tce_fields("Contratos")

# 3. Query (use snake_case or the original API names)
tce_contracts(codigo_efisco_ug = "510101")
```

## Explore the API

Before querying any endpoint, you can explore the built-in catalog
directly from R.

### 1. Browse the catalog

``` r

tce_catalog()
#> # A tibble: 71 × 4
#>    endpoint               group          title                         url
#>    <chr>                  <chr>          <chr>                         <chr>
#>  1 ReceitasEstaduais      Receitas       Receitas Estaduais            …
#>  2 ReceitasMunicipais     Receitas       Receitas Municipais           …
#>  …

tce_catalog(search = "licit")
```

### 2. Inspect input parameters

``` r

tce_params("Contratos")
#> ── Contratos has 23 parameters: ──────────────────────────────
#> ℹ unidade_gestora, unidade_orcamentaria, esfera, …
#> ── Dictionary ────────────────────────────────────────────────
#> # A tibble: 23 × 5
#>    api_name      r_name          required type      description
#>    <chr>         <chr>           <lgl>    <chr>     <chr>
#>  1 UnidadeGesto… unidade_gestor… FALSE    character Unidade Gestora
#>  …
```

### 3. Inspect output fields

``` r

tce_fields("Contratos")
```

### 4. Query

Use `snake_case` names (from `r_name`) or the original API names — both
work:

``` r

# These are equivalent:
tce_contracts(codigo_efisco_ug = "510101")
tce_contracts(CodigoEfiscoUG = "510101")

# Add more filters
tce_contracts(codigo_efisco_ug = "510101", ano_contrato = "2025")
```

## Verbose mode

When `verbose = TRUE`, the package prints the final API URL and helper
commands for inspecting the endpoint:

``` r

tce_contracts(codigo_efisco_ug = "510101", verbose = TRUE)
#> ℹ API URL: https://sistemas.tce.pe.gov.br/DadosAbertos/Contratos!json?CodigoEfiscoUG=510101
#> ℹ To inspect this endpoint:
#>     - Input parameters: tce_params("Contratos")
#>     - Output fields: tce_fields("Contratos")
```

Enable globally:

``` r

options(tceper.verbose = TRUE)
```

## Cache

All 71 wrapper functions cache results in memory, keyed by endpoint +
parameters. Default TTL is 1 hour.

``` r

tce_contracts(codigo_efisco_ug = "510101")       # hits the API
tce_contracts(codigo_efisco_ug = "510101")       # cache hit (instant)
tce_contracts(codigo_efisco_ug = "510102")       # different key → hits the API

tce_contracts(codigo_efisco_ug = "510101", cache = FALSE)  # force fresh

tce_cache_info()    # inspect cached entries
tce_cache_clear()   # clear all
```

## Parameter validation

The package validates query parameters against the catalog. If you pass
a parameter that doesn’t exist for that endpoint, it aborts with a
helpful error listing the allowed parameters:

``` r

tce_contracts(xyz = "foo")
#> ✖ Unknown query parameter(s) for endpoint Contratos: xyz
#> ℹ Allowed parameters:
#>   • unidade_gestora (UnidadeGestora)
#>   • codigo_efisco_ug (CodigoEfiscoUG)
#>   …
```

## Options

| Option             | Default | Description                       |
|--------------------|---------|-----------------------------------|
| `tceper.verbose`   | `FALSE` | Print final API URL on every call |
| `tceper.progress`  | `TRUE`  | Show progress messages            |
| `tceper.cache_ttl` | `3600`  | Cache time-to-live in seconds     |

``` r

options(
  tceper.verbose  = TRUE,
  tceper.progress = FALSE,
  tceper.cache_ttl = 7200
)
```

## API limits

The API returns at most **100,000 records** per request. When this limit
is reached, the package issues a warning. Use filters to narrow your
query:

``` r

tce_municipal_expenditures(
  codigo_municipio = "P113",
  ano_referencia   = "2025"
)
```

## Direct access

If you prefer to pass API parameter names directly, use
[`tce_request()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_request.md):

``` r

tce_request("Contratos", CodigoEfiscoUG = "510101", AnoContrato = "2025")
```
