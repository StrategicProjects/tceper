# Public works contractor data

Retrieve data on companies contracted for public works.

## Usage

``` r
tce_public_works_contractors(
  ...,
  verbose = getOption("tceper.verbose", FALSE),
  cache = TRUE,
  clean_names = TRUE
)
```

## Arguments

- ...:

  Named query parameters passed directly to the API. Common filters:
  `CodigoEfiscoUG`, `CodigoMunicipio`.

- verbose:

  If `TRUE`, prints the final API URL.

- cache:

  If `TRUE` (default), returns cached results when available.

- clean_names:

  If `TRUE` (default), converts column names to `snake_case`.

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html).

## See also

Other public_works:
[`tce_public_works()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_public_works.md),
[`tce_public_works_audits()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_public_works_audits.md)
