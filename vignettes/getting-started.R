## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----install------------------------------------------------------------------
# # install.packages("remotes")
# remotes::install_github("StrategicProjects/tceper")

## ----setup--------------------------------------------------------------------
# library(tceper)

## ----catalog------------------------------------------------------------------
# tce_catalog()

## ----catalog-search-----------------------------------------------------------
# tce_catalog(search = "contrat")

## ----params-------------------------------------------------------------------
# tce_params("Contratos")

## ----fields-------------------------------------------------------------------
# tce_fields("Contratos")

## ----municipalities-----------------------------------------------------------
# tce_municipalities()

## ----municipalities-filter----------------------------------------------------
# tce_municipalities(unidadefederativa = "PE")
# tce_municipalities(municipio = "Recife")

## ----contracts----------------------------------------------------------------
# tce_contracts(codigo_efisco_ug = "510101")

## ----contracts-filter---------------------------------------------------------
# tce_contracts(codigo_efisco_ug = "510101", ano_contrato = "2025")

## ----suppliers----------------------------------------------------------------
# tce_suppliers(cpfcnpj = "25173110000186")
# tce_suppliers(nome = "eireli")

## ----verbose------------------------------------------------------------------
# tce_bids(anomodalidade = "2025", verbose = TRUE)

## ----clean-names--------------------------------------------------------------
# tce_municipalities(clean_names = FALSE)

## ----limits-------------------------------------------------------------------
# # Avoid unfiltered requests that may hit 10k limit:
# # tce_municipal_expenditures()
# 
# # Filter by municipality and year:
# tce_municipal_expenditures(
#   codigo_municipio = "2604106",
#   ano_referencia   = "2025"
# )

## ----request------------------------------------------------------------------
# tce_request("Contratos", CodigoEfiscoUG = "510101", AnoContrato = "2025")

