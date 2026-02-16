# tceper 0.1.2

## Bug fixes

* **Removed duplicate `.tce_catalog()` definition.** The function was
  defined in both `catalog.R` (with in-memory caching) and
  `introspection.R` (without caching). The uncached version in
  `introspection.R` was loaded second and silently overrode the cached
  version, causing the JSON catalog to be re-parsed on every call.
  Now only the cached version in `catalog.R` is used.

* **Fixed double `.tce_map_params()` call in `tce_cache_key()`.** Parameter
  names were being mapped twice, which was harmless but wasteful.

## Documentation

* Rewrote `README.md` with complete sections: quick start, catalog
  exploration, verbose mode, cache, parameter validation, options table,
  and API limits.

* Improved `tceper-package.R` with full package-level documentation
  including workflow, parameter names, and options.

* Fixed vignette `getting-started`: corrected record limit from 10,000
  to 100,000 and typo "municapality" → "municipality".

* Updated `_pkgdown.yml`: added print methods and `tceper-package` to
  the reference index.

* Fixed `DESCRIPTION`: replaced placeholder pkgdown URL with the actual
  site URL.

* Updated `NEWS.md` to reflect the current API (parameter names without
  leading dots, no translated parameter names).

# tceper 0.1.1

## Bug fixes

* **Fixed critical URL encoding bug**: `httr2::req_url_path_append()` was
  percent-encoding the `!` character in Struts2-style URLs
  (`Contratos!json` → `Contratos%21json`), causing the API server to
  ignore all query parameters and return unfiltered results. The URL is
  now constructed directly via `paste0()` and passed to `httr2::request()`,
  preserving the literal `!` separator (#1).

## New features

* **In-memory cache for all 71 wrapper functions** with parameter-aware
  cache keys. Each unique combination of endpoint + parameters gets its
  own cache entry. For example, `tce_contracts(codigo_efisco_ug = "510101")`
  and `tce_contracts(codigo_efisco_ug = "510102")` are cached separately.
  - TTL defaults to 1 hour; configurable via
    `options(tceper.cache_ttl = <seconds>)`.
  - `tce_cache_clear()` — clear all or pattern-matched cached entries.
  - `tce_cache_info()` — inspect current cache contents and age.
  - All functions accept `cache = FALSE` to force a fresh request.

* **`verbose` parameter on all functions.** When `TRUE`, prints the
  final API URL (with all query parameters) before making the request.
  Also shows helper commands for `tce_params()` and `tce_fields()`.
  Can be set globally via `options(tceper.verbose = TRUE)`.

* **Endpoint catalog and introspection.** New functions for discovering
  the API without leaving R:
  - `tce_catalog()` — list all endpoints with search support.
  - `tce_endpoint()` — get metadata for a single endpoint.
  - `tce_params()` — list input parameters with `api_name` and `r_name`.
  - `tce_fields()` — list output fields.

* **Parameter validation and mapping.** Query parameters are validated
  against the catalog. Invalid parameter names trigger a helpful error
  listing all allowed parameters. Users can pass `snake_case` names
  (e.g. `codigo_efisco_ug`) which are automatically mapped to the API's
  expected names (e.g. `CodigoEfiscoUG`).
