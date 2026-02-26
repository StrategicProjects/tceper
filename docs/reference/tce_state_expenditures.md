# State expenditures

Retrieve state-level expenditure data.

## Usage

``` r
tce_state_expenditures(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters passed directly to the API. Common filters:
  `CodigoEfiscoUG`, `AnoReferencia`.

- verbose:

  If `TRUE`, prints the final API URL.

- cache:

  If `TRUE` (default), returns cached results when available.

- clean_names:

  If `TRUE` (default), converts column names to `snake_case`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).

## See also

[`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md)
to discover available parameters,
[`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md)
to see output columns.

Other expenditures:
[`tce_municipal_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_creditor_types.md),
[`tce_municipal_expenditures()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_expenditures.md),
[`tce_municipal_transfers()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_transfers.md),
[`tce_state_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_creditor_types.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_state_expenditures(id_unidade_gestora = "510101")
} # }
```
