# Get the catalog entry for a given endpoint

Returns the full metadata for a single endpoint, including its input
parameters (`entrada`) and output fields (`saida`). Useful for
programmatic access to endpoint metadata.

## Usage

``` r
tce_endpoint(endpoint)
```

## Arguments

- endpoint:

  Endpoint name (e.g., `"Municipios"`, `"LicitacaoUG"`, `"Contratos"`).
  Use
  [`tce_catalog()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_catalog.md)
  to see all available endpoints.

## Value

A list with endpoint metadata, including `entrada` (input parameters)
and `saida` (output fields) when available.

## See also

[`tce_catalog()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_catalog.md),
[`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md),
[`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_endpoint("Contratos")
} # }
```
