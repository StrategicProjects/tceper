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
#>    api_name            r_name               required type      description      
#>  * <chr>               <chr>                <lgl>    <chr>     <chr>            
#>  1 UnidadeGestora      unidade_gestora      FALSE    character Unidade Gestora  
#>  2 UnidadeOrcamentaria unidade_orcamentaria FALSE    character Unidade Gestora …
#>  3 Esfera              esfera               FALSE    character Esfera (E - Esta…
#>  4 Municipio           municipio            FALSE    character Município        
#>  5 Objeto              objeto               FALSE    character Objeto           
#>  6 NumeroContrato      numero_contrato      FALSE    character Número do Contra…
#>  7 AnoContrato         ano_contrato         FALSE    character Ano do Contrato  
#>  8 TipoProcesso        tipo_processo        FALSE    character Tipo do Processo 
#>  9 AnoProcesso         ano_processo         FALSE    character Ano do Processo  
#> 10 CPF_CNPJ            cpf_cnpj             FALSE    character CPF ou CNPJ do C…
#> # ℹ 14 more rows
tce_params("Municipios")
#> ── Municipios has 2 parameters: ────────────────────────────────────────────────
#> ℹ municipio, unidadefederativa.
#> ── Dictionary ──────────────────────────────────────────────────────────────────
#> # A tibble: 2 × 5
#>   api_name          r_name            required type      description       
#> * <chr>             <chr>             <lgl>    <chr>     <chr>             
#> 1 MUNICIPIO         municipio         FALSE    character Nome do Município 
#> 2 UNIDADEFEDERATIVA unidadefederativa FALSE    character Unidade federativa
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
#>  1 CODIGOMODALIDADE          codigomodalidade         FALSE    char… "Código da…
#>  2 CODIGOUG                  codigoug                 FALSE    char… "Código da…
#>  3 UG                        ug                       FALSE    char… "Unidade G…
#>  4 NOMENATUREZA              nomenatureza             FALSE    char… "Natureza …
#>  5 NOMEMODALIDADE            nomemodalidade           FALSE    char… "Modalidad…
#>  6 NUMEROMODALIDADE          numeromodalidade         FALSE    char… "Número da…
#>  7 ANOMODALIDADE             anomodalidade            FALSE    char… "Ano da Mo…
#>  8 SITUACAOLICITACAO         situacaolicitacao        FALSE    char… "Situação …
#>  9 ESTAGIOLICITACAO          estagiolicitacao         FALSE    char… "Estágio d…
#> 10 DATAPUBLICACAOHOMOLOGACAO datapublicacaohomologac… FALSE    char… "Data de P…
#> 11 TOTALADJUDICADOLICITACAO  totaladjudicadolicitacao FALSE    char… ""         
#> 12 QTDELICITANTES            qtdelicitantes           FALSE    char… "Quantidad…
#> 13 DESCRICAOOBJETO           descricaoobjeto          FALSE    char… "Descrição…
#> 14 CODIGOMUNICIPIO           codigomunicipio          FALSE    char… "Código do…
#> 15 DATASESSAOABERTURA        datasessaoabertura       FALSE    char… "Data da S…
#> 16 DOTACAOORCAMENTARIA       dotacaoorcamentaria      FALSE    char… "Dotação O…
#> 17 CODIGOSITUACAOLICITACAO   codigosituacaolicitacao  FALSE    char… "Codigo da…
#> 18 FUNDAMENTOLEGAL           fundamentolegal          FALSE    char… "Código da…
```
