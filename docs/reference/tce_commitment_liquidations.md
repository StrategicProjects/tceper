# Commitment liquidations

Retrieve liquidation records for budget commitments.

## Usage

``` r
tce_commitment_liquidations(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters passed directly to the API. Common filters:
  `CodigoEfiscoUG`, `NumeroEmpenho`, `AnoReferencia`.

- verbose:

  If `TRUE`, prints the final API URL.

- cache:

  If `TRUE` (default), returns cached results when available.

- clean_names:

  If `TRUE` (default), converts column names to `snake_case`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).

## See also

Other commitments:
[`tce_commitment_payments()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_commitment_payments.md),
[`tce_commitment_summary()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_commitment_summary.md),
[`tce_state_commitment_items()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_commitment_items.md),
[`tce_state_price_comparison()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_price_comparison.md)
