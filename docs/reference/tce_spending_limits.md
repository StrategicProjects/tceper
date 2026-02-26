# Spending limits

Retrieve spending-limit data from government account processes.

## Usage

``` r
tce_spending_limits(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters passed directly to the API. Common filters:
  `CodigoEfiscoUG`, `AnoReferencia`, `CodigoMunicipio`.

- verbose:

  If `TRUE`, prints the final API URL.

- cache:

  If `TRUE` (default), returns cached results when available.

- clean_names:

  If `TRUE` (default), converts column names to `snake_case`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).

## See also

Other processes:
[`tce_consideranda()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_consideranda.md),
[`tce_debts_fines()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_debts_fines.md),
[`tce_determinations()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_determinations.md),
[`tce_outcomes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_outcomes.md),
[`tce_processes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_processes.md),
[`tce_recommendations()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_recommendations.md),
[`tce_retirement_outcomes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_retirement_outcomes.md),
[`tce_special_accountability()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_special_accountability.md)
