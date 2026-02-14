## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----catalog------------------------------------------------------------------
# library(tceper)
# 
# tce_catalog()

## ----catalog-search-----------------------------------------------------------
# tce_catalog(search = "licit")

## ----params-------------------------------------------------------------------
# tce_params("LicitacaoUG")

## ----fields-------------------------------------------------------------------
# tce_fields("LicitacaoUG")

## ----query--------------------------------------------------------------------
# tce_bids(anomodalidade = "2025")

## ----invalid, eval = FALSE----------------------------------------------------
# # Example (invalid parameter name for this endpoint):
# tce_contracts(fog = "510101", verbose = TRUE)

## ----inspect-first------------------------------------------------------------
# tce_params("Contratos")

## ----cache-info---------------------------------------------------------------
# tce_cache_info()

## ----cache-clear--------------------------------------------------------------
# tce_cache_clear()

