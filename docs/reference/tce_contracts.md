# Contracts

Retrieve state and municipal contracts.

## Usage

``` r
tce_contracts(
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

[`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md)
to discover available parameters,
[`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md)
to see output columns.

Other procurement:
[`tce_agreements()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_agreements.md),
[`tce_bid_details()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_details.md),
[`tce_bid_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_documents.md),
[`tce_bid_legal_basis()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_legal_basis.md),
[`tce_bid_modalities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_modalities.md),
[`tce_bid_stages()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_stages.md),
[`tce_bid_statuses()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_statuses.md),
[`tce_bids()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bids.md),
[`tce_contract_amendments()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contract_amendments.md),
[`tce_contract_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contract_documents.md),
[`tce_contract_items()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contract_items.md),
[`tce_object_characteristics()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_object_characteristics.md),
[`tce_object_classifications()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_object_classifications.md),
[`tce_object_nature()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_object_nature.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_contracts(codigo_efisco_ug = "510101", verbose = TRUE)
} # }
```
