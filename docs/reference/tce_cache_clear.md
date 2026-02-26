# Clear the tceper in-memory cache

Removes cached API responses so that subsequent calls hit the API again.
By default clears everything; use `pattern` to selectively clear entries
for specific endpoints.

## Usage

``` r
tce_cache_clear(pattern = NULL)
```

## Arguments

- pattern:

  Optional regex pattern to clear only matching keys. If `NULL`
  (default), clears the entire cache. For example, `"Contratos"` clears
  all cached contract queries.

## Value

Invisibly returns the number of entries cleared.

## See also

[`tce_cache_info()`](https://strategicprojects.github.io/tceper/reference/tce_cache_info.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_cache_clear()              # clear everything
tce_cache_clear("Contratos")   # clear contract queries only
} # }
```
