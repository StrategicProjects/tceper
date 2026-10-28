# List input parameters for an endpoint

Returns a tibble describing the query parameters accepted by a given
endpoint. The `api_name` column shows the exact name expected by the
API; the `r_name` column shows the `snake_case` equivalent that you can
pass to wrapper functions.

## Usage

``` r
tce_params(endpoint)
```

## Arguments

- endpoint:

  Endpoint name (e.g., `"Municipios"`, `"Contratos"`). Use
  [`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)
  to see all available endpoints.

## Value

A tibble with columns `api_name`, `r_name`, `required`, `type`, and
`description`. Has a custom print method that summarises the parameter
names at the top.

## See also

[`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md),
[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
[`tce_endpoint()`](https://strategicprojects.github.io/tceper/reference/tce_endpoint.md)

## Examples

``` r
tce_params("Contratos")
#> ── Contratos has 24 parameters: ────────────────────────────────────────────────
#> ℹ unidade_gestora, unidade_orcamentaria, esfera, municipio, objeto,
#>   numero_contrato, ano_contrato, tipo_processo, ano_processo, cpf_cnpj,
#>   tipo_documento, numero_documento, numero_documento_ajustado, razao_social,
#>   estagio, situacao, valor, sigla_ug, codigo_ug, codigo_efisco_ug,
#>   codigo_audin_ug, portaria_comissao_licitacao, codigo_contrato, codigo_pl.
#> ── Dictionary ──────────────────────────────────────────────────────────────────
#> # A tibble: 24 × 5
#>    api_name            r_name               required type    description        
#>  * <chr>               <chr>                <lgl>    <chr>   <chr>              
#>  1 UnidadeGestora      unidade_gestora      FALSE    string  Unidade Gestora    
#>  2 UnidadeOrcamentaria unidade_orcamentaria FALSE    string  Unidade Gestora da…
#>  3 Esfera              esfera               FALSE    string  Esfera (E - Estadu…
#>  4 Municipio           municipio            FALSE    string  Município          
#>  5 Objeto              objeto               FALSE    string  Objeto             
#>  6 NumeroContrato      numero_contrato      FALSE    string  Número do Contrato 
#>  7 AnoContrato         ano_contrato         FALSE    numeric Ano do Contrato    
#>  8 TipoProcesso        tipo_processo        FALSE    string  Tipo do Processo   
#>  9 AnoProcesso         ano_processo         FALSE    numeric Ano do Processo    
#> 10 CPF_CNPJ            cpf_cnpj             FALSE    string  CPF ou CNPJ do Con…
#> # ℹ 14 more rows
tce_params("Municipios")
#> ── Municipios has 2 parameters: ────────────────────────────────────────────────
#> ℹ municipio, unidadefederativa.
#> ── Dictionary ──────────────────────────────────────────────────────────────────
#> # A tibble: 2 × 5
#>   api_name          r_name            required type   description       
#> * <chr>             <chr>             <lgl>    <chr>  <chr>             
#> 1 MUNICIPIO         municipio         FALSE    string Nome do Município 
#> 2 UNIDADEFEDERATIVA unidadefederativa FALSE    string Unidade federativa
tce_params("LicitacaoUG")
#> ── LicitacaoUG has 18 parameters: ──────────────────────────────────────────────
#> ℹ codigomodalidade, codigoug, ug, nomenatureza, nomemodalidade,
#>   numeromodalidade, anomodalidade, situacaolicitacao, estagiolicitacao,
#>   datapublicacaohomologacao, totaladjudicadolicitacao, qtdelicitantes,
#>   descricaoobjeto, codigomunicipio, datasessaoabertura, dotacaoorcamentaria,
#>   codigosituacaolicitacao, fundamentolegal.
#> ── Dictionary ──────────────────────────────────────────────────────────────────
#> # A tibble: 18 × 5
#>    api_name                  r_name                   required type  description
#>  * <chr>                     <chr>                    <lgl>    <chr> <chr>      
#>  1 CODIGOMODALIDADE          codigomodalidade         FALSE    nume… "Código da…
#>  2 CODIGOUG                  codigoug                 FALSE    nume… "Código da…
#>  3 UG                        ug                       FALSE    stri… "Unidade G…
#>  4 NOMENATUREZA              nomenatureza             FALSE    stri… "Natureza …
#>  5 NOMEMODALIDADE            nomemodalidade           FALSE    stri… "Modalidad…
#>  6 NUMEROMODALIDADE          numeromodalidade         FALSE    nume… "Número da…
#>  7 ANOMODALIDADE             anomodalidade            FALSE    nume… "Ano da Mo…
#>  8 SITUACAOLICITACAO         situacaolicitacao        FALSE    stri… "Situação …
#>  9 ESTAGIOLICITACAO          estagiolicitacao         FALSE    stri… "Estágio d…
#> 10 DATAPUBLICACAOHOMOLOGACAO datapublicacaohomologac… FALSE    date… "Data de P…
#> 11 TOTALADJUDICADOLICITACAO  totaladjudicadolicitacao FALSE    nume… ""         
#> 12 QTDELICITANTES            qtdelicitantes           FALSE    nume… "Quantidad…
#> 13 DESCRICAOOBJETO           descricaoobjeto          FALSE    stri… "Descrição…
#> 14 CODIGOMUNICIPIO           codigomunicipio          FALSE    stri… "Código do…
#> 15 DATASESSAOABERTURA        datasessaoabertura       FALSE    date… "Data da S…
#> 16 DOTACAOORCAMENTARIA       dotacaoorcamentaria      FALSE    stri… "Dotação O…
#> 17 CODIGOSITUACAOLICITACAO   codigosituacaolicitacao  FALSE    nume… "Codigo da…
#> 18 FUNDAMENTOLEGAL           fundamentolegal          FALSE    nume… "Código da…
```
