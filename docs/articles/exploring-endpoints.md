# Exploring endpoints, parameters, and fields

This vignette shows how to *discover* endpoints and their input/output
metadata using the built-in catalog shipped with **tceper**.

## Discover endpoints with `tce_catalog()`

``` r

library(tceper)

tce_catalog()
```

Filter by keyword:

``` r

tce_catalog(search = "licit")
```

## Inspect one endpoint

Pick an endpoint name from
[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md).
For instance, `LicitacaoUG`:

### Input parameters

``` r

tce_params("LicitacaoUG")
```

`api_name` is the exact query name expected by the API.

`r_name` is the `snake_case` name you can pass to the R wrapper.

### Output fields

``` r

tce_fields("LicitacaoUG")
```

## Query using `snake_case` arguments

Once you know which parameters exist, you can query with `snake_case`
arguments (the package maps them to `api_name` internally).

``` r

tce_bids(anomodalidade = "2025")
```

## Parameter validation

`tceper` validates query parameters against the endpoint catalog. If you
pass a parameter that does not exist for that endpoint, it aborts and
shows the allowed parameter list.

``` r

# Example (invalid parameter name for this endpoint):
tce_contracts(fog = "510101", verbose = TRUE)
```

To avoid this, inspect allowed parameters first:

``` r

tce_params("Contratos")
```

## Working with cache

Many wrapper functions can cache results in-memory for faster repeated
calls.

You can inspect cache state with:

``` r

tce_cache_info()
```

And clear it with:

``` r

tce_cache_clear()
```

When `verbose = TRUE`, cache hits may print a short message indicating
the returned object comes from cache.
