# Object classifications

Lookup table of procurement object classification types.

## Usage

``` r
tce_object_classifications(
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

Other procurement:
[`tce_agreements()`](https://strategicprojects.github.io/tceper/reference/tce_agreements.md),
[`tce_bid_details()`](https://strategicprojects.github.io/tceper/reference/tce_bid_details.md),
[`tce_bid_documents()`](https://strategicprojects.github.io/tceper/reference/tce_bid_documents.md),
[`tce_bid_legal_basis()`](https://strategicprojects.github.io/tceper/reference/tce_bid_legal_basis.md),
[`tce_bid_modalities()`](https://strategicprojects.github.io/tceper/reference/tce_bid_modalities.md),
[`tce_bid_stages()`](https://strategicprojects.github.io/tceper/reference/tce_bid_stages.md),
[`tce_bid_statuses()`](https://strategicprojects.github.io/tceper/reference/tce_bid_statuses.md),
[`tce_bids()`](https://strategicprojects.github.io/tceper/reference/tce_bids.md),
[`tce_contract_amendments()`](https://strategicprojects.github.io/tceper/reference/tce_contract_amendments.md),
[`tce_contract_documents()`](https://strategicprojects.github.io/tceper/reference/tce_contract_documents.md),
[`tce_contract_items()`](https://strategicprojects.github.io/tceper/reference/tce_contract_items.md),
[`tce_contracts()`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md),
[`tce_object_characteristics()`](https://strategicprojects.github.io/tceper/reference/tce_object_characteristics.md),
[`tce_object_nature()`](https://strategicprojects.github.io/tceper/reference/tce_object_nature.md)
