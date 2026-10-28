# Exploring endpoints, parameters, and fields

> **Note** — Code chunks are shown but not executed at build time
> (`eval = FALSE`). The discovery snippets
> ([`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
> [`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
> [`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md))
> work offline anywhere and can be run as-is from any network. The query
> snippets require a Brazilian IP (the TCE-PE API is geo-restricted).

This vignette shows how to *discover* endpoints and their input/output
metadata using the built-in catalog shipped with **tceper**.

## Discover endpoints with `tce_catalog()`

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`tceper`](https://strategicprojects.github.io/tceper/)`)`\
\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``)`

Filter by keyword:

\
[`tce_catalog`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)`(``search ``=`` ``"licit"``)`

## Inspect one endpoint

Pick an endpoint name from
[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md).
For instance, `LicitacaoUG`:

### Input parameters

\
[`tce_params`](https://strategicprojects.github.io/tceper/reference/tce_params.md)`(``"LicitacaoUG"``)`

`api_name` is the exact query name expected by the API.

`r_name` is the `snake_case` name you can pass to the R wrapper.

### Output fields

\
[`tce_fields`](https://strategicprojects.github.io/tceper/reference/tce_fields.md)`(``"LicitacaoUG"``)`

## Query using `snake_case` arguments

Once you know which parameters exist, you can query with `snake_case`
arguments (the package maps them to `api_name` internally).

\
[`tce_bids`](https://strategicprojects.github.io/tceper/reference/tce_bids.md)`(``anomodalidade ``=`` ``"2025"``)`

## Parameter validation

`tceper` validates query parameters against the endpoint catalog. If you
pass a parameter that does not exist for that endpoint, it aborts and
shows the allowed parameter list.

\
`# Example (invalid parameter name for this endpoint):`\
[`tce_contracts`](https://strategicprojects.github.io/tceper/reference/tce_contracts.md)`(``fog ``=`` ``"510101"``, verbose ``=`` ``TRUE``)`

To avoid this, inspect allowed parameters first:

\
[`tce_params`](https://strategicprojects.github.io/tceper/reference/tce_params.md)`(``"Contratos"``)`

## Working with cache

Many wrapper functions can cache results in-memory for faster repeated
calls.

You can inspect cache state with:

\
[`tce_cache_info`](https://strategicprojects.github.io/tceper/reference/tce_cache_info.md)`(``)`

And clear it with:

\
[`tce_cache_clear`](https://strategicprojects.github.io/tceper/reference/tce_cache_clear.md)`(``)`

When `verbose = TRUE`, cache hits may print a short message indicating
the returned object comes from cache.
