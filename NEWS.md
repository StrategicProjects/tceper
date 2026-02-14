# tceper 0.1.1

## Bug fixes

* **Fixed critical URL encoding bug**: `httr2::req_url_path_append()` was
  percent-encoding the `!` character in Struts2-style URLs
  (`Contratos!json` → `Contratos%21json`), causing the API server to
  ignore all query parameters and return unfiltered results. The URL is
  now constructed directly via `paste0()` and passed to `httr2::request()`,
  preserving the literal `!` separator (#1).

## New features

* **In-memory cache for ALL 71 wrapper functions** with parameter-aware
  cache keys. Each unique combination of endpoint + parameters gets its
  own cache entry. For example, `tce_contracts(managing_unit_id = "510101")`
  and `tce_contracts(managing_unit_id = "510102")` are cached separately.
  - TTL defaults to 1 hour; configurable via
    `options(tceper.cache_ttl = <seconds>)`.
  - `tce_cache_clear()` — clear all or pattern-matched cached entries.
  - `tce_cache_info()` — inspect current cache contents and age.
  - All functions accept `.cache = FALSE` to force a fresh request.

* **`.verbose` parameter on all functions**. When `TRUE`, prints the
  final API URL (with all query parameters) before making the request.
  Useful for debugging and verifying that filters are being applied.
  Can be set globally via `options(tceper.verbose = TRUE)`.
