# ---- Verbose helpers ---------------------------------------------------------

#' Print help commands for inspecting an endpoint (verbose mode)
#' @noRd
.tce_verbose_help <- function(endpoint) {
  cmd_params <- sprintf('tce_params("%s")', endpoint)
  cmd_fields <- sprintf('tce_fields("%s")', endpoint)

  if (requireNamespace("cli", quietly = TRUE)) {
    cli::cli_alert_info("To inspect this endpoint:")
    cli::cli_alert("    - Input parameters: {.code { cmd_params }}")
    cli::cli_alert("    - Output fields: {.code { cmd_fields}}")
  } else {
    message("To inspect this endpoint:")
    message("    - Input parameters: ", cmd_params)
    message("    - Output fields:    ", cmd_fields)
  }
}
