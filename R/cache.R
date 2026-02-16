# ---- Cache infrastructure ----------------------------------------------------

#' Cache environment (package-internal)
#' @noRd
tce_cache_env <- new.env(parent = emptyenv())

#' Retrieve a cached result or execute and cache the expression
#' @noRd
tce_cached <- function(key, expr, use_cache = TRUE) {
  if (!use_cache) return(expr)

  ttl <- getOption("tceper.cache_ttl", 3600)

  if (exists(key, envir = tce_cache_env, inherits = FALSE)) {
    cli::cli_alert_success("Data retrieved from cache.")
    entry <- get(key, envir = tce_cache_env, inherits = FALSE)
    age <- as.numeric(difftime(Sys.time(), entry$time, units = "secs"))
    if (age < ttl) return(entry$value)
  }

  result <- expr
  assign(key, list(value = result, time = Sys.time()), envir = tce_cache_env)
  result
}

#' Clear the tceper in-memory cache
#'
#' Removes cached API responses so that subsequent calls hit the API again.
#' By default clears everything; use `pattern` to selectively clear entries
#' for specific endpoints.
#'
#' @param pattern Optional regex pattern to clear only matching keys.
#'   If `NULL` (default), clears the entire cache. For example,
#'   `"Contratos"` clears all cached contract queries.
#'
#' @return Invisibly returns the number of entries cleared.
#'
#' @seealso [tce_cache_info()]
#' @export
#'
#' @examples
#' \dontrun{
#' tce_cache_clear()              # clear everything
#' tce_cache_clear("Contratos")   # clear contract queries only
#' }
tce_cache_clear <- function(pattern = NULL) {
  keys <- ls(envir = tce_cache_env)
  if (!is.null(pattern)) keys <- grep(pattern, keys, value = TRUE)
  rm(list = keys, envir = tce_cache_env)
  if (length(keys) > 0) {
    cli::cli_alert_success("Cleared {.val {length(keys)}} cached entr{?y/ies}.")
  } else {
    cli::cli_alert_info("No cached entries to clear.")
  }
  invisible(length(keys))
}

#' Show cache status
#'
#' Returns a tibble describing all currently cached entries, including
#' the cache key (endpoint + parameters), row count, timestamp and age.
#' Useful for understanding what is cached and when it will expire.
#'
#' @return A [tibble][tibble::tibble-package] with columns `key`, `rows`,
#'   `cached_at` and `age_secs`, or an empty tibble if the cache is empty.
#'   The cache TTL is controlled by `getOption("tceper.cache_ttl", 3600)`.
#'
#' @seealso [tce_cache_clear()]
#' @export
#'
#' @examples
#' \dontrun{
#' tce_cache_info()
#' }
tce_cache_info <- function() {
  keys <- ls(envir = tce_cache_env)
  if (length(keys) == 0) {
    cli::cli_alert_info("Cache is empty.")
    return(tibble::tibble(
      key = character(), rows = integer(),
      cached_at = as.POSIXct(character()), age_secs = numeric()
    ))
  }
  now <- Sys.time()
  entries <- lapply(keys, function(k) {
    entry <- get(k, envir = tce_cache_env, inherits = FALSE)
    nrows <- if (tibble::is_tibble(entry$value)) nrow(entry$value) else NA_integer_
    tibble::tibble(
      key = k, rows = nrows, cached_at = entry$time,
      age_secs = round(as.numeric(difftime(now, entry$time, units = "secs")))
    )
  })
  do.call(rbind, entries)
}
