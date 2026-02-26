# Procurement process budget (Remessa)

Procurement process budget (Remessa)

## Usage

``` r
tce_procurement_process_budget(
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
[`tce_benefit_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_benefit_types.md),
[`tce_budget_statuses()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_budget_statuses.md),
[`tce_legal_instrument_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instrument_documents.md),
[`tce_legal_instrument_items()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instrument_items.md),
[`tce_legal_instrument_participants()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instrument_participants.md),
[`tce_legal_instruments()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instruments.md),
[`tce_procurement_process_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_process_documents.md),
[`tce_procurement_process_participants()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_process_participants.md),
[`tce_procurement_processes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_processes.md),
[`tce_reference_codes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_reference_codes.md),
[`tce_reference_dates()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_reference_dates.md),
[`tce_reference_sources()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_reference_sources.md),
[`tce_remessa_works()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_remessa_works.md),
[`tce_remessa_works_execution()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_remessa_works_execution.md),
[`tce_remessa_works_geometry()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_remessa_works_geometry.md),
[`tce_update_indices()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_update_indices.md)
