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
#' Removes all cached API responses. Useful when you need fresh data.
#'
#' @param pattern Optional regex pattern to clear only matching keys.
#'   If `NULL` (default), clears the entire cache.
#'
#' @return Invisibly returns the number of entries cleared.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' tce_cache_clear()
#' tce_cache_clear("Contratos")
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
#' List all currently cached entries and their age.
#'
#' @return A [tibble][tibble::tibble-package] with columns `key`, `rows`,
#'   `cached_at` and `age_secs`, or an empty tibble if the cache is empty.
#'
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
