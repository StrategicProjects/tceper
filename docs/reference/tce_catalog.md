# List available API endpoints

Returns a tibble listing all 71 endpoints available in the TCE-PE Open
Data API, with their group, description and URL. Use `search` to filter
by keyword.

## Usage

``` r
tce_catalog(search = NULL)
```

## Arguments

- search:

  Optional character string to filter endpoints by name or description
  (case-insensitive). For example, `search = "licit"` returns all
  procurement-related endpoints.

## Value

A tibble with columns `endpoint`, `group`, `title`, and `url`.

## See also

[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
[`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md),
[`tce_endpoint()`](https://strategicprojects.github.io/tceper/reference/tce_endpoint.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_catalog()
tce_catalog(search = "contrat")
tce_catalog(search = "municipio")
} # }
```
