# Sub-units of managed entities

Retrieve sub-units belonging to managed entities.

## Usage

``` r
tce_sub_units(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters. Common: `CodigoEfiscoUG`.

- verbose:

  If `TRUE`, prints the final API URL.

- cache:

  If `TRUE` (default), returns cached results when available.

- clean_names:

  If `TRUE` (default), converts column names to `snake_case`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).

## See also

Other reference:
[`tce_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_creditor_types.md),
[`tce_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_entities.md),
[`tce_funding_sources()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_funding_sources.md),
[`tce_inactivation_reasons()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_inactivation_reasons.md),
[`tce_municipal_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_entities.md),
[`tce_municipalities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipalities.md),
[`tce_payroll_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_payroll_types.md),
[`tce_state_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_entities.md)
