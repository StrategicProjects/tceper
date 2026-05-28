# List output fields for an endpoint

Returns a tibble describing the columns returned by a given endpoint.
When `clean_names = TRUE` (the default), column names are converted from
the API's original names to `snake_case`.

## Usage

``` r
tce_fields(endpoint)
```

## Arguments

- endpoint:

  Endpoint name (e.g., `"Municipios"`, `"Contratos"`). Use
  [`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)
  to see all available endpoints.

## Value

A tibble with columns `name`, `type`, and `description`. Has a custom
print method that summarises the field names at the top.

## See also

[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
[`tce_endpoint()`](https://strategicprojects.github.io/tceper/reference/tce_endpoint.md)

## Examples

``` r
tce_fields("Contratos")
#> ── Contratos has 26 fields: ────────────────────────────────────────────────────
#> ℹ UnidadeGestora, UnidadeOrcamentaria, Esfera, Municipio, NumeroContrato,
#>   AnoContrato, TipoProcesso, AnoProcesso, CPF_CNPJ, TipoDocumento,
#>   NumeroDocumento, NumeroDocumentoAjustado, RazaoSocial, Objeto, Vigencia,
#>   Valor, Estagio, Situacao, SiglaUG, CodigoUG, CodigoEfiscoUG, CodigoAudinUG,
#>   PortariaComissaoLicitacao, LinkArquivo, CodigoContrato, CodigoPL.
#> ── Dictionary ──────────────────────────────────────────────────────────────────
#> # A tibble: 26 × 3
#>    name                type      description                              
#>  * <chr>               <chr>     <chr>                                    
#>  1 UnidadeGestora      character Unidade Gestora                          
#>  2 UnidadeOrcamentaria character Unidade Gestora da SCA_LicitacoesDetalhes
#>  3 Esfera              character Esfera (E -Estadual ou M - Municipal)    
#>  4 Municipio           character Município                                
#>  5 NumeroContrato      character Número do Contrato                       
#>  6 AnoContrato         character Ano do Contrato                          
#>  7 TipoProcesso        character Tipo do Processo                         
#>  8 AnoProcesso         character Ano do Processo                          
#>  9 CPF_CNPJ            character CPF ou CNPJ do Contratado                
#> 10 TipoDocumento       character Tipo do Documento do Contratado          
#> # ℹ 16 more rows
tce_fields("Municipios")
#> ── Municipios has 5 fields: ────────────────────────────────────────────────────
#> ℹ CODIGO, UNIDADEFEDERATIVA, MUNICIPIO, CODIGOSAGRES, CODIGOIBGE.
#> ── Dictionary ──────────────────────────────────────────────────────────────────
#> # A tibble: 5 × 3
#>   name              type      description        
#> * <chr>             <chr>     <chr>              
#> 1 CODIGO            character Código do município
#> 2 UNIDADEFEDERATIVA character Unidade federativa 
#> 3 MUNICIPIO         character Nome do município  
#> 4 CODIGOSAGRES      character Código do Sagres   
#> 5 CODIGOIBGE        character Código do IBGE     
```
