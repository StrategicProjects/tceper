# List available API endpoints

Returns a tibble listing all 71 endpoints available in the TCE-PE Open
Data API, with their group, description and URL. Use `search` to filter
by keyword.

## Usage

``` r
tce_catalog(search = NULL)
```

## Arguments

- search:

  Optional character string to filter endpoints by name or description
  (case-insensitive). For example, `search = "licit"` returns all
  procurement-related endpoints.

## Value

A tibble with columns `endpoint`, `group`, `title`, and `url`.

## See also

[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
[`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md),
[`tce_endpoint()`](https://strategicprojects.github.io/tceper/reference/tce_endpoint.md)

## Examples

``` r
tce_catalog()
#> # A tibble: 71 × 4
#>    endpoint            group    title                                      url  
#>    <chr>               <chr>    <chr>                                      <chr>
#>  1 ReceitasEstaduais   Receitas Relação das Receitas Estaduais             http…
#>  2 ReceitasMunicipais  Receitas Relação das Receitas Municipais            http…
#>  3 ReceitasPrevistas   Receitas Relação das Receitas Previstas (apenas Mu… http…
#>  4 DespesasEstaduais   Despesas Relação das Despesas Estaduais             http…
#>  5 DespesasMunicipais  Despesas Relação das Despesas Municipais - Chave c… http…
#>  6 EmpenhoLiquidacao   Despesas Relação das Liquidações dos Empenhos Muni… http…
#>  7 EmpenhoPagamento    Despesas Relação dos Pagamentos dos Empenhos (apen… http…
#>  8 EmpenhoResumo       Despesas Relação dos Valores Originais, Reforços e… http…
#>  9 TipoCredorMunicipal Despesas Lista dos tipos de credores Municipal      http…
#> 10 TipoCredorEstadual  Despesas Lista dos tipos de credores Estadual       http…
#> # ℹ 61 more rows
tce_catalog(search = "contrat")
#> # A tibble: 9 × 4
#>   endpoint                                 group                     title url  
#>   <chr>                                    <chr>                     <chr> <chr>
#> 1 Contratos                                Licitações, Contratos e … List… http…
#> 2 ContratoDocumentos                       Licitações, Contratos e … List… http…
#> 3 ContratoItemObjeto                       Licitações, Contratos e … Rela… http…
#> 4 TermoAditivo                             Licitações, Contratos e … List… http…
#> 5 ObrasDadosContratacao                    Obras                     Refe… http…
#> 6 Remessa_ProcessoContratacao              RemessaTCEPE              Dado… http…
#> 7 Remessa_ProcessoContratacaoDocumento     RemessaTCEPE              Docu… http…
#> 8 Remessa_ProcessoContratacaoOrcamento     RemessaTCEPE              Lote… http…
#> 9 Remessa_ProcessoContratacaoParticipantes RemessaTCEPE              List… http…
tce_catalog(search = "municipio")
#> # A tibble: 1 × 4
#>   endpoint   group               title                  url                     
#>   <chr>      <chr>               <chr>                  <chr>                   
#> 1 Municipios Informações básicas Relação dos municípios https://sistemas.tcepe.…
```
