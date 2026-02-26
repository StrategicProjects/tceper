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
  <https://sistemas.tce.pe.gov.br/DadosAbertos/Exemplo!listar> for the
  full list of available endpoints.

- ...:

  Named query parameters passed to the API **exactly as the API expects
  them** (typically `CamelCase`). `NULL` values are silently dropped.
  See the API documentation for parameter names.

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
  [cli::cli](https://cli.r-lib.org/reference/cli.html). Defaults to the
  value of `getOption("tceper.progress")`, or `TRUE` if unset.

- verbose:

  If `TRUE`, prints the final API URL to the console before performing
  the request. Useful for debugging and testing. Defaults to
  `getOption("tceper.verbose", FALSE)`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
with the response content. Returns a zero-row tibble if no records are
found.

## Details

### API base URL

`https://sistemas.tce.pe.gov.br/DadosAbertos/`

### URL construction

The TCE-PE API uses Struts2-style URLs where `!` invokes a method (e.g.
`Contratos!json`). The URL is built with
[`paste0()`](https://rdrr.io/r/base/paste.html) to preserve the literal
`!` — using
[`httr2::req_url_path_append()`](https://httr2.r-lib.org/reference/req_url.html)
would encode it as `%21`, causing the server to ignore all query
parameters.

### Response limit

The API returns at most **100,000 records** per request. When this limit
is reached, a warning is issued suggesting the use of additional
filters.

### Encoding

The API responds in ISO-8859-1 encoding, which is converted to UTF-8
internally.

### Options

- `tceper.progress` — set to `FALSE` to suppress all progress messages.

- `tceper.verbose` — set to `TRUE` to always print the final API URL.

- `tceper.cache_ttl` — cache time-to-live in seconds (default: `3600`).

## Examples

``` r
if (FALSE) { # \dontrun{
# Direct query to any endpoint
tce_request("Contratos", CodigoEfiscoUG = "510101")

# Show the final URL for debugging
tce_request("Contratos", CodigoEfiscoUG = "510101", verbose = TRUE)

# Keep original column names
tce_request("Municipios", clean_names = FALSE)
} # }
```
