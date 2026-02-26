# Municipal granted transfers

Retrieve inter-unit transfers granted within the same municipality.

## Usage

``` r
tce_municipal_transfers(
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

Other expenditures:
[`tce_municipal_creditor_types()`](https://strategicprojects.github.io/tceper/reference/tce_municipal_creditor_types.md),
[`tce_municipal_expenditures()`](https://strategicprojects.github.io/tceper/reference/tce_municipal_expenditures.md),
[`tce_state_creditor_types()`](https://strategicprojects.github.io/tceper/reference/tce_state_creditor_types.md),
[`tce_state_expenditures()`](https://strategicprojects.github.io/tceper/reference/tce_state_expenditures.md)
