# Municipal revenues

Retrieve municipal-level revenue data.

## Usage

``` r
tce_municipal_revenues(
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

Other revenues:
[`tce_budgeted_revenues()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_budgeted_revenues.md),
[`tce_state_revenues()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_revenues.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_municipal_revenues(id_unidade_gestora = "384")
} # }
```
