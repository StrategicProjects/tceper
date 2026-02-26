# List input parameters for an endpoint

Returns a tibble describing the query parameters accepted by a given
endpoint. The `api_name` column shows the exact name expected by the
API; the `r_name` column shows the `snake_case` equivalent that you can
pass to wrapper functions.

## Usage

``` r
tce_params(endpoint)
```

## Arguments

- endpoint:

  Endpoint name (e.g., `"Municipios"`, `"Contratos"`). Use
  [`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)
  to see all available endpoints.

## Value

A tibble with columns `api_name`, `r_name`, `required`, `type`, and
`description`. Has a custom print method that summarises the parameter
names at the top.

## See also

[`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md),
[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
[`tce_endpoint()`](https://strategicprojects.github.io/tceper/reference/tce_endpoint.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_params("Contratos")
tce_params("Municipios")
tce_params("LicitacaoUG")
} # }
```
