# Legal processes

Retrieve the list of formalized physical and electronic processes.

## Usage

``` r
tce_processes(
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
[`tce_consideranda()`](https://strategicprojects.github.io/tceper/reference/tce_consideranda.md),
[`tce_debts_fines()`](https://strategicprojects.github.io/tceper/reference/tce_debts_fines.md),
[`tce_determinations()`](https://strategicprojects.github.io/tceper/reference/tce_determinations.md),
[`tce_outcomes()`](https://strategicprojects.github.io/tceper/reference/tce_outcomes.md),
[`tce_recommendations()`](https://strategicprojects.github.io/tceper/reference/tce_recommendations.md),
[`tce_retirement_outcomes()`](https://strategicprojects.github.io/tceper/reference/tce_retirement_outcomes.md),
[`tce_special_accountability()`](https://strategicprojects.github.io/tceper/reference/tce_special_accountability.md),
[`tce_spending_limits()`](https://strategicprojects.github.io/tceper/reference/tce_spending_limits.md)
