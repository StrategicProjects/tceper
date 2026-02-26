
# tceper <a href="https://github.com/StrategicProjects/tceper"><img src="man/figures/logo.svg" align="right" height="139" alt="tceper website" /></a>

<!-- badges: start -->
[![R-CMD-check](https://img.shields.io/badge/R--CMD--check-passing-brightgreen)](https://github.com/StrategicProjects/tceper) 
![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/tceper) 
![CRAN Downloads](https://cranlogs.r-pkg.org/badges/grand-total/tceper) 
![License](https://img.shields.io/badge/license-MIT-darkviolet.svg) 
![](https://img.shields.io/badge/devel%20version-0.1.2-blue.svg)
<!-- badges: end -->

`tceper` is an R client for the [TCE-PE](https://www.tce.pe.gov.br/) (Tribunal de Contas do Estado de Pernambuco) Open Data API.

The package wraps **71 API endpoints** into user-friendly functions that accept `snake_case` parameter names and return tibbles. A built-in catalog lets you discover endpoints, inspect their input parameters and output fields — all without leaving R.

> [!WARNING]
> The TCE-PE API (`sistemas.tce.pe.gov.br`) is **geo-restricted** and only
> accessible from Brazilian IP addresses. If you are outside Brazil, API
> queries will time out. The discovery functions `tce_catalog()`,
> `tce_params()` and `tce_fields()` work offline anywhere, as they read
> from the built-in catalog.


<table class="warning-banner"><tr><td>
⚠️ <strong class="warning-title">Warning</strong><br>
The TCE-PE API (<code>sistemas.tce.pe.gov.br</code>) is <strong>geo-restricted</strong> and only
accessible from Brazilian IP addresses. If you are outside Brazil, API
queries will time out. The discovery functions <code>tce_catalog()</code>,
<code>tce_params()</code> and <code>tce_fields()</code> work offline anywhere, as they read
from the built-in catalog.
</td></tr></table>

<table class="important-banner"><tr><td>
<strong class="important-title" dir="auto"><svg class="octicon octicon-report mr-2" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path d="M0 1.75C0 .784.784 0 1.75 0h12.5C15.216 0 16 .784 16 1.75v9.5A1.75 1.75 0 0 1 14.25 13H8.06l-2.573 2.573A1.458 1.458 0 0 1 3 14.543V13H1.75A1.75 1.75 0 0 1 0 11.25Zm1.75-.25a.25.25 0 0 0-.25.25v9.5c0 .138.112.25.25.25h2a.75.75 0 0 1 .75.75v2.19l2.72-2.72a.749.749 0 0 1 .53-.22h6.5a.25.25 0 0 0 .25-.25v-9.5a.25.25 0 0 0-.25-.25Zm7 2.25v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0ZM9 9a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"></path></svg>Important</strong>
This package acts as a wrapper for a Brazilian public API provided by the 
Tribunal de Contas do Estado de Pernambuco (TCE-PE), which is the institution 
responsible for the data. To maintain consistency with R package development 
standards, all wrapper functions are named in English. However, because the 
source API is natively in Portuguese, you will interact with Portuguese terms 
when passing arguments or parsing the responses. For example: you may use the 
function `tce_state_revenues()`⁠, but you need to pass the parameters in
Portuguese, such as `AnoReferencia = 2025`⁠. You can find the original list of
endpoints and their respective parameters in the [official API documentation](https://sistemas.tce.pe.gov.br/DadosAbertos/Exemplo!listar).
</td></tr></table>

> [!IMPORTANT]
> This package acts as a wrapper for a Brazilian public API provided by the 
> Tribunal de Contas do Estado de Pernambuco (TCE-PE), which is the institution 
> responsible for the data. To maintain consistency with R package development 
> standards, all wrapper functions are named in English. However, because the 
> source API is natively in Portuguese, you will interact with Portuguese terms 
> when passing arguments or parsing the responses. For example: you may use the 
> function `tce_state_revenues()`⁠, but you need to pass the parameters in
> Portuguese, such as `AnoReferencia = 2025`⁠. You can find the original list of
> endpoints and their respective parameters in the [official API documentation](https://sistemas.tce.pe.gov.br/DadosAbertos/Exemplo!listar).

## Installation

``` r
# install.packages("remotes")
remotes::install_github("StrategicProjects/tceper")
```

## Quick start

```r
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

Before querying any endpoint, you can explore the built-in catalog directly from R.

### 1. Browse the catalog

```r
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

```r
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

```r
tce_fields("Contratos")
```

### 4. Query

Use `snake_case` names (from `r_name`) or the original API names — both work:

```r
# These are equivalent:
tce_contracts(codigo_efisco_ug = "510101")
tce_contracts(CodigoEfiscoUG = "510101")

# Add more filters
tce_contracts(codigo_efisco_ug = "510101", ano_contrato = "2025")
```

## Verbose mode

When `verbose = TRUE`, the package prints the final API URL and helper commands for inspecting the endpoint:

```r
tce_contracts(codigo_efisco_ug = "510101", verbose = TRUE)
#> ℹ API URL: https://sistemas.tce.pe.gov.br/DadosAbertos/Contratos!json?CodigoEfiscoUG=510101
#> ℹ To inspect this endpoint:
#>     - Input parameters: tce_params("Contratos")
#>     - Output fields: tce_fields("Contratos")
```

Enable globally:

```r
options(tceper.verbose = TRUE)
```

## Cache

All 71 wrapper functions cache results in memory, keyed by endpoint + parameters. Default TTL is 1 hour.

```r
tce_contracts(codigo_efisco_ug = "510101")       # hits the API
tce_contracts(codigo_efisco_ug = "510101")       # cache hit (instant)
tce_contracts(codigo_efisco_ug = "510102")       # different key → hits the API

tce_contracts(codigo_efisco_ug = "510101", cache = FALSE)  # force fresh

tce_cache_info()    # inspect cached entries
tce_cache_clear()   # clear all
```

## Parameter validation

The package validates query parameters against the catalog. If you pass a parameter that doesn't exist for that endpoint, it aborts with a helpful error listing the allowed parameters:

```r
tce_contracts(xyz = "foo")
#> ✖ Unknown query parameter(s) for endpoint Contratos: xyz
#> ℹ Allowed parameters:
#>   • unidade_gestora (UnidadeGestora)
#>   • codigo_efisco_ug (CodigoEfiscoUG)
#>   …
```

## Options

| Option | Default | Description |
|---|---|---|
| `tceper.verbose` | `FALSE` | Print final API URL on every call |
| `tceper.progress` | `TRUE` | Show progress messages |
| `tceper.cache_ttl` | `3600` | Cache time-to-live in seconds |

```r
options(
  tceper.verbose  = TRUE,
  tceper.progress = FALSE,
  tceper.cache_ttl = 7200
)
```

## API limits

The API returns at most **100,000 records** per request. When this limit
is reached, the package issues a warning. Use filters to narrow your query:

```r
tce_municipal_expenditures(
  codigo_municipio = "P113",
  ano_referencia   = "2025"
)
```

## Direct access

If you prefer to pass API parameter names directly, use `tce_request()`:

```r
tce_request("Contratos", CodigoEfiscoUG = "510101", AnoContrato = "2025")
```
