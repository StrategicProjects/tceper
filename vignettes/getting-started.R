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
# # Avoid unfiltered requests that may hit the 100k limit:
# # tce_municipal_expenditures()
# 
# # Choose a municipality code:
# library(dplyr)
# library(stringr)
# 
# tce_municipalities() |>
#   filter(str_detect(municipio, "Pesqueira")) |>
#   glimpse()
# # Rows: 1
# # Columns: 5
# # $ codigoibge        <chr> "2610905"
# # $ codigo            <chr> "P113"
# # $ unidadefederativa <chr> "PE"
# # $ municipio         <chr> "Pesqueira"
# # $ codigosagres      <chr> "5408"
# 
# # Filter by municipality and year:
# tce_municipal_expenditures(
#   codigo_municipio = "P113", # Pesqueira
#   ano_referencia   = "2025"
# )

## ----request------------------------------------------------------------------
# tce_request("Contratos", CodigoEfiscoUG = "510101", AnoContrato = "2025")

## ----cache--------------------------------------------------------------------
# tce_contracts(codigo_efisco_ug = "510101")  # hits the API
# tce_contracts(codigo_efisco_ug = "510101")  # instant (from cache)
# 
# # Bypass cache
# tce_contracts(codigo_efisco_ug = "510101", cache = FALSE)
# 
# # Inspect and manage
# tce_cache_info()
# tce_cache_clear()

## ----cache-options------------------------------------------------------------
# options(tceper.cache_ttl = 7200)  # 2 hours

