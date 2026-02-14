# ---- Print methods for introspection tibbles ---------------------------------

#' Print method for `tce_params()` output
#'
#' @keywords internal
#' @param x An object returned by [tce_params()].
#' @param ... Passed to the next print method.
#' @return `x`, invisibly.
#' @method print tce_params_tbl
#' @export
print.tce_params_tbl <- function(x, ...) {
  ep <- attr(x, "endpoint") %||% "unknown"
  n  <- nrow(x)

  params <- x$r_name
  params_str <- paste(params, collapse = ", ")

  if (requireNamespace("cli", quietly = TRUE)) {
    cli::cli_rule(left = "{ep} has {n} parameter{?s}:")
    cli::cli_inform(c(
      "i" = "{.field {params_str}}."
    ))
    cli::cli_rule(left = "Dictionary")
  } else {
    cat(sprintf("%s has %d parameter(s): %s.\n", ep, n, params_str))
  }

  NextMethod("print", x, ...)
}

#' Print method for `tce_fields()` output
#'
#' @keywords internal
#' @param x An object returned by [tce_fields()].
#' @param ... Passed to the next print method.
#' @return `x`, invisibly.
#' @method print tce_fields_tbl
#' @export
print.tce_fields_tbl <- function(x, ...) {
  ep <- attr(x, "endpoint") %||% "unknown"
  n  <- nrow(x)

  fields <- x$name
  fields_str <- paste(fields, collapse = ", ")

  if (requireNamespace("cli", quietly = TRUE)) {
    cli::cli_rule(left = "{ep} has {n} field{?s}:")
    cli::cli_inform(c(
      "i" = "{.field {fields_str}}."
    ))
    cli::cli_rule(left = "Dictionary")
  } else {
    cat(sprintf("%s has %d field(s): %s.\n", ep, n, fields_str))
  }

  NextMethod("print", x, ...)
}
