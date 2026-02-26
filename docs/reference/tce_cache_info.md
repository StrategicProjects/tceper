# Show cache status

Returns a tibble describing all currently cached entries, including the
cache key (endpoint + parameters), row count, timestamp and age. Useful
for understanding what is cached and when it will expire.

## Usage

``` r
tce_cache_info()
```

## Value

A [tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
with columns `key`, `rows`, `cached_at` and `age_secs`, or an empty
tibble if the cache is empty. The cache TTL is controlled by
`getOption("tceper.cache_ttl", 3600)`.

## See also

[`tce_cache_clear()`](https://strategicprojects.github.io/tceper/reference/tce_cache_clear.md)

## Examples

``` r
if (FALSE) { # \dontrun{
tce_cache_info()
} # }
```
