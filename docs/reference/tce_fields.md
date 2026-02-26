# List output fields for an endpoint

Returns a tibble describing the columns returned by a given endpoint.
When `clean_names = TRUE` (the default), column names are converted from
the API's original names to `snake_case`.

## Usage

``` r
tce_fields(endpoint)
```

## Arguments

- endpoint:

  Endpoint name (e.g., `"Municipios"`, `"Contratos"`). Use
  [`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)
  to see all available endpoints.

## Value

A tibble with columns `name`, `type`, and `description`. Has a custom
print method that summarises the field names at the top.

## See also

[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
[`tce_endpoint()`](https://strategicprojects.github.io/tceper/reference/tce_endpoint.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_fields("Contratos")
tce_fields("Municipios")
} # }
```
