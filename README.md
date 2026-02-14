
# tceper <a href="https://monitoramento.sepe.pe.gov.br/tcepe/"><img src="man/figures/logo.svg" align="right" alt="tceper website" /></a>

`tceper` is an R client for the TCE-PE (Tribunal de Contas do Estado de Pernambuco) Open Data API.

The package provides a structured, discoverable interface to query public procurement, contracts, suppliers, revenues, expenditures, and other public datasets made available by TCE-PE.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("StrategicProjects/tceper")
```

---

## 🔎 Explore the API First

Before querying any endpoint, you can explore the built-in API catalog directly from R.

``` r
library(ibger)
```

This is the recommended workflow.

### 1️⃣ View the full catalog

```r
tce_catalog()
```

Returns the full structured catalog of endpoints available in the API.

You can also search by keyword:

```r
tce_catalog(search = "contrato")
```

This helps you identify the correct endpoint name before querying.

---

### 2️⃣ Inspect input parameters

```r
tce_params("Contratos")
```

Returns a tibble with:

- `api_name` – official API parameter name  
- `r_name` – snake_case version for use in R  
- `required` – whether the parameter is required  
- `type` – parameter type (default: "character")  
- `description` – description provided by the API  

Example:

```r
tce_params("Municipios")
```

---

### 4️⃣ Inspect output fields

```r
tce_fields("Contratos")
```

Returns the expected output columns for that endpoint.

---

## 🚀 Querying Data

After inspecting parameters, you can query using either:

- Official API parameter names
- Snake_case names (`r_name`)

Example:

```r
tce_contracts(codigo_efisco_ug = "510101")
```

Or directly via the low-level function:

```r
tce_request("Contratos", codigo_efisco_ug = "510101")
```

---

## 🔍 Verbose Mode (Recommended for Exploration)

You can inspect the final request URL and get helper commands:

```r
tce_contracts(codigo_efisco_ug = "510101", verbose = TRUE)
```

Verbose mode prints:

- The final API URL
- The command to inspect parameters (`tce_params("...")`)
- The command to inspect output fields (`tce_fields("...")`)

---

## 🧠 Recommended Workflow

1. `tce_catalog()` → find the endpoint  
2. `tce_params("Endpoint")` → inspect inputs  
3. `tce_fields("Endpoint")` → inspect outputs  
4. Query using `tce_request()` or a wrapper function  



