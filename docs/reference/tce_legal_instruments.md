# Legal instruments (Remessa)

Retrieve legal instruments from RemessaTCEPE.

## Usage

``` r
tce_legal_instruments(
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

Other remessa:
[`tce_benefit_types()`](https://strategicprojects.github.io/tceper/reference/tce_benefit_types.md),
[`tce_budget_statuses()`](https://strategicprojects.github.io/tceper/reference/tce_budget_statuses.md),
[`tce_legal_instrument_documents()`](https://strategicprojects.github.io/tceper/reference/tce_legal_instrument_documents.md),
[`tce_legal_instrument_items()`](https://strategicprojects.github.io/tceper/reference/tce_legal_instrument_items.md),
[`tce_legal_instrument_participants()`](https://strategicprojects.github.io/tceper/reference/tce_legal_instrument_participants.md),
[`tce_procurement_process_budget()`](https://strategicprojects.github.io/tceper/reference/tce_procurement_process_budget.md),
[`tce_procurement_process_documents()`](https://strategicprojects.github.io/tceper/reference/tce_procurement_process_documents.md),
[`tce_procurement_process_participants()`](https://strategicprojects.github.io/tceper/reference/tce_procurement_process_participants.md),
[`tce_procurement_processes()`](https://strategicprojects.github.io/tceper/reference/tce_procurement_processes.md),
[`tce_reference_codes()`](https://strategicprojects.github.io/tceper/reference/tce_reference_codes.md),
[`tce_reference_dates()`](https://strategicprojects.github.io/tceper/reference/tce_reference_dates.md),
[`tce_reference_sources()`](https://strategicprojects.github.io/tceper/reference/tce_reference_sources.md),
[`tce_remessa_works()`](https://strategicprojects.github.io/tceper/reference/tce_remessa_works.md),
[`tce_remessa_works_execution()`](https://strategicprojects.github.io/tceper/reference/tce_remessa_works_execution.md),
[`tce_remessa_works_geometry()`](https://strategicprojects.github.io/tceper/reference/tce_remessa_works_geometry.md),
[`tce_update_indices()`](https://strategicprojects.github.io/tceper/reference/tce_update_indices.md)
