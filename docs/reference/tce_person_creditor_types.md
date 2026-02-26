# Person creditor types

Lookup table of person creditor types.

## Usage

``` r
tce_person_creditor_types(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters passed directly to the API. Common filters:
  `CpfCnpj`, `Nome`.

- verbose:

  If `TRUE`, prints the final API URL.

- cache:

  If `TRUE` (default), returns cached results when available.

- clean_names:

  If `TRUE` (default), converts column names to `snake_case`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).

## See also

Other suppliers:
[`tce_sanctions()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_sanctions.md),
[`tce_suppliers()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_suppliers.md)
