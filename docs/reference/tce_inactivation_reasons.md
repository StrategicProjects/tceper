# Inactivation reason types

Lookup table of inactivation reason types.

## Usage

``` r
tce_inactivation_reasons(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters passed directly to the API.

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
[`tce_municipal_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_entities.md),
[`tce_municipalities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipalities.md),
[`tce_payroll_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_payroll_types.md),
[`tce_state_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_entities.md),
[`tce_sub_units()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_sub_units.md)
