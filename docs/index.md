# tceper

`tceper` is an R client for the [TCE-PE](https://www.tce.pe.gov.br/)
(Tribunal de Contas do Estado de Pernambuco) Open Data API.

The package wraps **72 API endpoints** into user-friendly functions that
accept `snake_case` parameter names and return tibbles. A built-in
catalog lets you discover endpoints, inspect their input parameters and
output fields — all without leaving R.

[TABLE]

[TABLE]

## Installation

Install the released version from CRAN:

\
[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"tceper"``)`

Or the development version from GitHub:

\
`# install.packages("remotes")`\
`remotes``::`[`install_github`](https://remotes.r-lib.org/reference/install_github.html)`(``"StrategicProjects/tceper"``)`

## Quick start

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`tceper`](https://strategicprojects.github.io/tceper/)`)`\
\
`# 1. Discover endpoints`\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``)`\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``search ``=`` ``"contrat"``)`\
\
`# 2. Inspect parameters and output fields`\
[`tce_params`](https://strategicprojects.github.io/tceper/reference/tce_params.md)`(``"Contratos"``)`\
[`tce_fields`](https://strategicprojects.github.io/tceper/reference/tce_fields.md)`(``"Contratos"``)`\
\
`# 3. Query (use snake_case or the original API names)`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)`

## Explore the API

Before querying any endpoint, you can explore the built-in catalog
directly from R.

### 1. Browse the catalog

\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``)`\
`#> # A tibble: 72 × 4`\
`#>    endpoint               group          title                         url`\
`#>    <chr>                  <chr>          <chr>                         <chr>`\
`#>  1 ReceitasEstaduais      Receitas       Receitas Estaduais            …`\
`#>  2 ReceitasMunicipais     Receitas       Receitas Municipais           …`\
`#>  …`\
\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``search ``=`` ``"licit"``)`

### 2. Inspect input parameters

\
[`tce_params`](https://strategicprojects.github.io/tceper/reference/tce_params.md)`(``"Contratos"``)`\
`#> ── Contratos has 24 parameters: ──────────────────────────────`\
`#> ℹ unidade_gestora, unidade_orcamentaria, esfera, …`\
`#> ── Dictionary ────────────────────────────────────────────────`\
`#> # A tibble: 24 × 5`\
`#>    api_name      r_name          required type   description`\
`#>    <chr>         <chr>           <lgl>    <chr>  <chr>`\
`#>  1 UnidadeGesto… unidade_gestor… FALSE    string Unidade Gestora`\
`#>  …`

### 3. Inspect output fields

\
[`tce_fields`](https://strategicprojects.github.io/tceper/reference/tce_fields.md)`(``"Contratos"``)`

### 4. Query

Use `snake_case` names (from `r_name`) or the original API names — both
work:

\
`# These are equivalent:`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``CodigoEfiscoUG ``=`` ``"510101"``)`\
\
`# Add more filters`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``, ano_contrato ``=`` ``"2025"``)`

## Verbose mode

When `verbose = TRUE`, the package prints the final API URL and helper
commands for inspecting the endpoint:

\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``, verbose ``=`` ``TRUE``)`\
`#> ℹ API URL: https://sistemas.tcepe.tc.br/DadosAbertos/Contratos!json?CodigoEfiscoUG=510101`\
`#> ℹ To inspect this endpoint:`\
`#>     - Input parameters: tce_params("Contratos")`\
`#>     - Output fields: tce_fields("Contratos")`

Enable globally:

\
[`options`](https://rdrr.io/r/base/options.html)`(``tceper.verbose ``=`` ``TRUE``)`

## Cache

All 72 wrapper functions cache results in memory, keyed by endpoint +
parameters. Default TTL is 1 hour.

\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)``       ``# hits the API`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)``       ``# cache hit (instant)`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510102"``)``       ``# different key → hits the API`\
\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``, cache ``=`` ``FALSE``)``  ``# force fresh`\
\
[`tce_cache_info`](https://strategicprojects.github.io/tceper/reference/tce_cache_info.md)`(``)``    ``# inspect cached entries`\
[`tce_cache_clear`](https://strategicprojects.github.io/tceper/reference/tce_cache_clear.md)`(``)``   ``# clear all`

## Parameter validation

The package validates query parameters against the catalog. If you pass
a parameter that doesn’t exist for that endpoint, it aborts with a
helpful error listing the allowed parameters:

\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``xyz ``=`` ``"foo"``)`\
`#> ✖ Unknown query parameter(s) for endpoint Contratos: xyz`\
`#> ℹ Allowed parameters:`\
`#>   • unidade_gestora (UnidadeGestora)`\
`#>   • codigo_efisco_ug (CodigoEfiscoUG)`\
`#>   …`

## Options

| Option             | Default | Description                       |
|--------------------|---------|-----------------------------------|
| `tceper.verbose`   | `FALSE` | Print final API URL on every call |
| `tceper.progress`  | `TRUE`  | Show progress messages            |
| `tceper.cache_ttl` | `3600`  | Cache time-to-live in seconds     |

\
[`options`](https://rdrr.io/r/base/options.html)`(`\
`  tceper.verbose  ``=`` ``TRUE``,`\
`  tceper.progress ``=`` ``FALSE``,`\
`  tceper.cache_ttl ``=`` ``7200`\
`)`

## API limits

The API returns at most **100,000 records** per request. When this limit
is reached, the package issues a warning. Use filters to narrow your
query:

\
[`tce_municipal_expenditures`](https://strategicprojects.github.io/tceper/reference/tce_municipal_expenditures.md)`(`\
`  codigo_municipio ``=`` ``"P113"``,`\
`  ano_referencia   ``=`` ``"2025"`\
`)`

## Direct access

If you prefer to pass API parameter names directly, use
[`tce_request()`](https://strategicprojects.github.io/tceper/reference/tce_request.md):

\
[`tce_request`](https://strategicprojects.github.io/tceper/reference/tce_request.md)`(``"Contratos"``, CodigoEfiscoUG ``=`` ``"510101"``, AnoContrato ``=`` ``"2025"``)`
