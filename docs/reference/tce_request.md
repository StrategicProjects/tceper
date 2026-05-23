# Perform a request to the TCE-PE Open Data API

Low-level function that sends a GET request to the TCE-PE Open Data API
and returns the response content as a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html).
Higher-level wrapper functions such as
[`tce_contracts()`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md),
[`tce_state_expenditures()`](https://strategicprojects.github.io/tceper/reference/tce_state_expenditures.md),
etc. call this function internally.

You can use `tce_request()` directly to access any API endpoint,
including those that do not yet have a dedicated wrapper.

## Usage

``` r
tce_request(
  endpoint,
  ...,
  clean_names = TRUE,
  max_tries = 3,
  progress = getOption("tceper.progress", TRUE),
  verbose = getOption("tceper.verbose", FALSE)
)
```

## Arguments

- endpoint:

  A character string with the API method name (e.g., `"Contratos"`,
  `"DespesasEstaduais"`). See
  <https://sistemas.tcepe.tc.br/DadosAbertos/Exemplo!listar> for the
  full list of available endpoints.

- ...:

  Named query parameters. You can use either the API names
  (`CamelCase`/`UPPERCASE`) or the snake_case aliases shown by
  [`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md).
  `NULL` values are silently dropped.

- clean_names:

  If `TRUE` (default), column names are converted to `snake_case` via
  [`janitor::clean_names()`](https://sfirke.github.io/janitor/reference/clean_names.html).
  Set to `FALSE` to keep the original column names returned by the API.

- max_tries:

  Maximum number of retry attempts for failed requests (default: `3`).
  Passed to
  [`httr2::req_retry()`](https://httr2.r-lib.org/reference/req_retry.html).

- progress:

  If `TRUE`, displays progress messages via
  [cli](https://cli.r-lib.org/reference/cli.html). Defaults to the value
  of `getOption("tceper.progress")`, or `TRUE` if unset.

- verbose:

  If `TRUE`, prints the final API URL, parameters, and response metadata
  (status, content-type, size, elapsed time). Defaults to
  `getOption("tceper.verbose", FALSE)`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
with the response content. Returns a zero-row tibble if no records are
found.

## Details

### API base URL

`https://sistemas.tcepe.tc.br/DadosAbertos/`

### Network access

The API host only accepts connections from **Brazilian IP addresses**.
Calls from outside Brazil are dropped at the network level and surface
as a connection or TLS error. The offline discovery functions
([`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
[`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md))
do not require network access and work anywhere.

### URL construction

The TCE-PE API uses Struts2-style URLs where `!` invokes a method (e.g.
`Contratos!json`). The URL is built with
[`paste0()`](https://rdrr.io/r/base/paste.html) to preserve the literal
`!` – using
[`httr2::req_url_path_append()`](https://httr2.r-lib.org/reference/req_url.html)
would encode it as `%21`, causing the server to ignore all query
parameters.

### Response limit

The API returns at most **100,000 records** per request. When this limit
is reached, a warning is issued suggesting the use of additional
filters.

### Encoding

The TCE-PE backend runs on **ISO-8859-1** (Latin-1), not UTF-8. The
package handles this transparently in both directions:

- **Response body** is decoded as Latin-1 and returned as UTF-8 R
  strings, so accented Portuguese characters come through cleanly
  (`São`, `Município`, `Conceição`, etc.).

- **Query parameters** are transcoded UTF-8 -\> Latin-1 before
  percent-encoding, so filtering by accented values works as expected
  (e.g. `tce_municipalities(municipio = "São José da Coroa Grande")`).
  You can pass any R string with accents – the conversion is automatic.

### Options

- `tceper.progress` – set to `FALSE` to suppress all progress messages.

- `tceper.verbose` – set to `TRUE` to always print request/response
  details.

- `tceper.cache_ttl` – cache time-to-live in seconds (default: `3600`).

## Examples

``` r
if (FALSE) { # \dontrun{
# Direct query to any endpoint
tce_request("Contratos", CodigoEfiscoUG = "510101")

# Show full request/response details
tce_request("Contratos", CodigoEfiscoUG = "510101", verbose = TRUE)

# Keep original column names
tce_request("Municipios", clean_names = FALSE)
} # }
```
