# Getting started with tceper

> **Note** — Code chunks in this vignette are shown but not executed at
> build time (`eval = FALSE`). The TCE-PE API host
> (`sistemas.tcepe.tc.br`) only accepts connections from Brazilian IP
> addresses, so requests would fail on CRAN check machines and on most
> CI runners outside Brazil. Run the snippets interactively from a
> Brazilian network to reproduce the outputs. The discovery functions
> ([`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
> [`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
> [`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md))
> work offline anywhere.

## Overview

**tceper** is an R client for the TCE-PE (Tribunal de Contas do Estado
de Pernambuco) Open Data API.

The package wraps the official endpoints into user-friendly functions
that:

- accept `snake_case` arguments (mapped to the API’s expected query
  names), and
- return tibbles (with optional `snake_case` output column names).

## Installation

\
`# install.packages("remotes")`\
`remotes``::`[`install_github`](https://remotes.r-lib.org/reference/install_github.html)`(``"StrategicProjects/tceper"``)`

## Load the package

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`tceper`](https://strategicprojects.github.io/tceper/)`)`

## Explore endpoints before querying

### List endpoints

\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``)`

Filter by keyword:

\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``search ``=`` ``"contrat"``)`

### Inspect input parameters

\
[`tce_params`](https://strategicprojects.github.io/tceper/reference/tce_params.md)`(``"Contratos"``)`

### Inspect output fields

\
[`tce_fields`](https://strategicprojects.github.io/tceper/reference/tce_fields.md)`(``"Contratos"``)`

## Quick queries

### Municipalities

The `Municipios` endpoint is exposed as
[`tce_municipalities()`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md).

\
[`tce_municipalities`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md)`(``)`

You can filter by state (UF) or by municipality name. Accented
Portuguese characters work as-is – the package transcodes UTF-8 input to
the Latin-1 encoding the API expects:

\
[`tce_municipalities`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md)`(``unidadefederativa ``=`` ``"PE"``)`\
[`tce_municipalities`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md)`(``municipio ``=`` ``"Recife"``)`\
[`tce_municipalities`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md)`(``municipio ``=`` ``"São José da Coroa Grande"``)`

### Contracts

\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)`

You can add additional filters. Use `tce_params("Contratos")` to see
what is allowed.

\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``, ano_contrato ``=`` ``"2025"``)`

### Suppliers

The `Fornecedores` endpoint is exposed as
[`tce_suppliers()`](https://strategicprojects.github.io/tceper/reference/tce_suppliers.md).

\
[`tce_suppliers`](https://strategicprojects.github.io/tceper/reference/tce_suppliers.md)`(``cpfcnpj ``=`` ``"25173110000186"``)`\
[`tce_suppliers`](https://strategicprojects.github.io/tceper/reference/tce_suppliers.md)`(``nome ``=`` ``"eireli"``)`

## Verbose mode (recommended while exploring)

When `verbose = TRUE`, the package prints:

- the final API URL, and
- helper commands to inspect inputs/outputs for the endpoint.

\
[`tce_bids`](https://strategicprojects.github.io/tceper/reference/tce_bids.md)`(``anomodalidade ``=`` ``"2025"``, verbose ``=`` ``TRUE``)`

## Keeping original output field names

By default, output columns are converted to `snake_case`. To keep the
original names from the API:

\
[`tce_municipalities`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md)`(``clean_names ``=`` ``FALSE``)`

## Handling the 100,000-record limit

The API returns at most **100,000 records** per request. When this limit
is reached, `tceper` issues a warning.

To work around this, apply filters to narrow your query:

\
`# Avoid unfiltered requests that may hit the 100k limit:`\
`# tce_municipal_expenditures()`\
\
`# Choose a municipality code:`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`dplyr`](https://dplyr.tidyverse.org)`)`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`stringr`](https://stringr.tidyverse.org)`)`\
\
[`tce_municipalities`](https://strategicprojects.github.io/tceper/reference/tce_municipalities.md)`(``)`` ``|>`\
`  `[`filter`](https://dplyr.tidyverse.org/reference/filter.html)`(`[`str_detect`](https://stringr.tidyverse.org/reference/str_detect.html)`(``municipio``, ``"Pesqueira"``)``)`` ``|>`\
`  `[`glimpse`](https://pillar.r-lib.org/reference/glimpse.html)`(``)`\
`# Rows: 1`\
`# Columns: 5`\
`# $ codigoibge        <chr> "2610905"`\
`# $ codigo            <chr> "P113"`\
`# $ unidadefederativa <chr> "PE"`\
`# $ municipio         <chr> "Pesqueira"`\
`# $ codigosagres      <chr> "5408"`\
\
`# Filter by municipality and year:`\
[`tce_municipal_expenditures`](https://strategicprojects.github.io/tceper/reference/tce_municipal_expenditures.md)`(`\
`  codigo_municipio ``=`` ``"P113"``, ``# Pesqueira`\
`  ano_referencia   ``=`` ``"2025"`\
`)`

## Direct access to any endpoint

If you prefer to call an endpoint directly, use
[`tce_request()`](https://strategicprojects.github.io/tceper/reference/tce_request.md)
and pass the API query names (as shown by
[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md)):

\
[`tce_request`](https://strategicprojects.github.io/tceper/reference/tce_request.md)`(``"Contratos"``, CodigoEfiscoUG ``=`` ``"510101"``, AnoContrato ``=`` ``"2025"``)`

## Cache

All wrapper functions cache results in memory. The default TTL is 1
hour.

\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)``  ``# hits the API`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``)``  ``# instant (from cache)`\
\
`# Bypass cache`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``codigo_efisco_ug ``=`` ``"510101"``, cache ``=`` ``FALSE``)`\
\
`# Inspect and manage`\
[`tce_cache_info`](https://strategicprojects.github.io/tceper/reference/tce_cache_info.md)`(``)`\
[`tce_cache_clear`](https://strategicprojects.github.io/tceper/reference/tce_cache_clear.md)`(``)`

You can change the TTL globally:

\
[`options`](https://rdrr.io/r/base/options.html)`(``tceper.cache_ttl ``=`` ``7200``)``  ``# 2 hours`
