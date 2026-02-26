# Sanctions

Retrieve sanctions applied to suppliers.

## Usage

``` r
tce_sanctions(
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
[`tce_person_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_person_creditor_types.md),
[`tce_suppliers()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_suppliers.md)
