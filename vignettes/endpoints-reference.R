## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----mapping, eval = TRUE-----------------------------------------------------
library(tceper)

# Catalog with endpoint metadata
catalog <- tce_catalog()

# Discover exported wrappers and extract the endpoint used internally.
# We look for calls of the form: tce_cached("Endpoint") or tce_request("Endpoint")
exports <- getNamespaceExports("tceper")

# Keep likely "wrapper" functions
skip <- c(
  "tce_request", "tce_catalog", "tce_endpoint", "tce_params", "tce_fields",
  "tce_cache_info", "tce_cache_clear"
)
wrappers <- setdiff(exports, skip)

extract_endpoint <- function(fn) {
  f <- get(fn, envir = asNamespace("tceper"))
  txt <- paste(deparse(body(f)), collapse = "\n")
  m <- regexpr('tce_(?:cached|request)\\("([^"]+)"', txt, perl = TRUE)
  if (m[1] == -1) return(NA_character_)
  hit <- regmatches(txt, m)
  sub('^tce_(?:cached|request)\\("([^"]+)".*$', "\\1", hit)
}

endpoint <- vapply(wrappers, extract_endpoint, character(1))

mappings <- tibble::tibble(
  r_function = paste0("`", wrappers, "()`"),
  endpoint   = endpoint
) |>
  dplyr::filter(!is.na(endpoint)) |>
  dplyr::left_join(
    catalog |> dplyr::select(endpoint, group, title),
    by = "endpoint"
  ) |>
  dplyr::arrange(group, endpoint, r_function)

mappings

## ----example, eval = FALSE----------------------------------------------------
# tce_params("Contratos")
# tce_fields("Contratos")
# 
# tce_contracts(codigo_efisco_ug = "510101", ano_contrato = "2025")

