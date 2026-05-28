# Get the catalog entry for a given endpoint

Returns the full metadata for a single endpoint, including its input
parameters (`entrada`) and output fields (`saida`). Useful for
programmatic access to endpoint metadata.

## Usage

``` r
tce_endpoint(endpoint)
```

## Arguments

- endpoint:

  Endpoint name (e.g., `"Municipios"`, `"LicitacaoUG"`, `"Contratos"`).
  Use
  [`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md)
  to see all available endpoints.

## Value

A list with endpoint metadata, including `entrada` (input parameters)
and `saida` (output fields) when available.

## See also

[`tce_catalog()`](https://strategicprojects.github.io/tceper/reference/tce_catalog.md),
[`tce_params()`](https://strategicprojects.github.io/tceper/reference/tce_params.md),
[`tce_fields()`](https://strategicprojects.github.io/tceper/reference/tce_fields.md)

## Examples

``` r
tce_endpoint("Contratos")
#> $detail_url
#> [1] "https://sistemas.tcepe.tc.br/DadosAbertos/Exemplo!detalhar?dadosAbertos.id=33"
#> 
#> $ok
#> [1] TRUE
#> 
#> $entidade
#> [1] "Contratos"
#> 
#> $descricao
#> [1] "Listas dos Contratos Estaduais e Municipais"
#> 
#> $grupo
#> [1] "Licitações, Contratos e Convênios"
#> 
#> $url
#> [1] "https://sistemas.tcepe.tc.br:443/DadosAbertos/Contratos!<formato>"
#> 
#> $formatos
#> list()
#> 
#> $entrada
#> $entrada[[1]]
#> $entrada[[1]]$nome
#> [1] "UnidadeGestora"
#> 
#> $entrada[[1]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[1]]$tipo_db
#> [1] "varchar(200)"
#> 
#> $entrada[[1]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[1]]$descricao
#> [1] "Unidade Gestora"
#> 
#> $entrada[[1]]$valor
#> NULL
#> 
#> 
#> $entrada[[2]]
#> $entrada[[2]]$nome
#> [1] "UnidadeOrcamentaria"
#> 
#> $entrada[[2]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[2]]$tipo_db
#> [1] "varchar(200)"
#> 
#> $entrada[[2]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[2]]$descricao
#> [1] "Unidade Gestora da SCA_LicitacoesDetalhes"
#> 
#> $entrada[[2]]$valor
#> NULL
#> 
#> 
#> $entrada[[3]]
#> $entrada[[3]]$nome
#> [1] "Esfera"
#> 
#> $entrada[[3]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[3]]$tipo_db
#> [1] "char(2)"
#> 
#> $entrada[[3]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[3]]$descricao
#> [1] "Esfera (E - Estadual ou M - Municipal)"
#> 
#> $entrada[[3]]$valor
#> NULL
#> 
#> 
#> $entrada[[4]]
#> $entrada[[4]]$nome
#> [1] "Municipio"
#> 
#> $entrada[[4]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[4]]$tipo_db
#> [1] "varchar(40)"
#> 
#> $entrada[[4]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[4]]$descricao
#> [1] "Município"
#> 
#> $entrada[[4]]$valor
#> NULL
#> 
#> 
#> $entrada[[5]]
#> $entrada[[5]]$nome
#> [1] "Objeto"
#> 
#> $entrada[[5]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[5]]$tipo_db
#> [1] "varchar(106)"
#> 
#> $entrada[[5]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[5]]$descricao
#> [1] "Objeto"
#> 
#> $entrada[[5]]$valor
#> NULL
#> 
#> 
#> $entrada[[6]]
#> $entrada[[6]]$nome
#> [1] "NumeroContrato"
#> 
#> $entrada[[6]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[6]]$tipo_db
#> [1] "varchar(50)"
#> 
#> $entrada[[6]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[6]]$descricao
#> [1] "Número do Contrato"
#> 
#> $entrada[[6]]$valor
#> NULL
#> 
#> 
#> $entrada[[7]]
#> $entrada[[7]]$nome
#> [1] "AnoContrato"
#> 
#> $entrada[[7]]$tipo_api
#> [1] "numeric"
#> 
#> $entrada[[7]]$tipo_db
#> [1] "int(10)"
#> 
#> $entrada[[7]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[7]]$descricao
#> [1] "Ano do Contrato"
#> 
#> $entrada[[7]]$valor
#> NULL
#> 
#> 
#> $entrada[[8]]
#> $entrada[[8]]$nome
#> [1] "TipoProcesso"
#> 
#> $entrada[[8]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[8]]$tipo_db
#> [1] "varchar(100)"
#> 
#> $entrada[[8]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[8]]$descricao
#> [1] "Tipo do Processo"
#> 
#> $entrada[[8]]$valor
#> NULL
#> 
#> 
#> $entrada[[9]]
#> $entrada[[9]]$nome
#> [1] "AnoProcesso"
#> 
#> $entrada[[9]]$tipo_api
#> [1] "numeric"
#> 
#> $entrada[[9]]$tipo_db
#> [1] "int(10)"
#> 
#> $entrada[[9]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[9]]$descricao
#> [1] "Ano do Processo"
#> 
#> $entrada[[9]]$valor
#> NULL
#> 
#> 
#> $entrada[[10]]
#> $entrada[[10]]$nome
#> [1] "CPF_CNPJ"
#> 
#> $entrada[[10]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[10]]$tipo_db
#> [1] "varchar(18)"
#> 
#> $entrada[[10]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[10]]$descricao
#> [1] "CPF ou CNPJ do Contratado"
#> 
#> $entrada[[10]]$valor
#> NULL
#> 
#> 
#> $entrada[[11]]
#> $entrada[[11]]$nome
#> [1] "TipoDocumento"
#> 
#> $entrada[[11]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[11]]$tipo_db
#> [1] "varchar(5)"
#> 
#> $entrada[[11]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[11]]$descricao
#> [1] "Tipo do Documento do Contratado"
#> 
#> $entrada[[11]]$valor
#> NULL
#> 
#> 
#> $entrada[[12]]
#> $entrada[[12]]$nome
#> [1] "NumeroDocumento"
#> 
#> $entrada[[12]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[12]]$tipo_db
#> [1] "varchar(20)"
#> 
#> $entrada[[12]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[12]]$descricao
#> [1] "CPF ou CNPJ do Contratado"
#> 
#> $entrada[[12]]$valor
#> NULL
#> 
#> 
#> $entrada[[13]]
#> $entrada[[13]]$nome
#> [1] "NumeroDocumentoAjustado"
#> 
#> $entrada[[13]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[13]]$tipo_db
#> [1] "varchar(30)"
#> 
#> $entrada[[13]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[13]]$descricao
#> [1] "CPF ou CNPJ do Contratado sem Formatação"
#> 
#> $entrada[[13]]$valor
#> NULL
#> 
#> 
#> $entrada[[14]]
#> $entrada[[14]]$nome
#> [1] "RazaoSocial"
#> 
#> $entrada[[14]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[14]]$tipo_db
#> [1] "varchar(255)"
#> 
#> $entrada[[14]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[14]]$descricao
#> [1] "Razão Social do Contratado"
#> 
#> $entrada[[14]]$valor
#> NULL
#> 
#> 
#> $entrada[[15]]
#> $entrada[[15]]$nome
#> [1] "Estagio"
#> 
#> $entrada[[15]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[15]]$tipo_db
#> [1] "varchar(15)"
#> 
#> $entrada[[15]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[15]]$descricao
#> [1] "Estagio do Contrato"
#> 
#> $entrada[[15]]$valor
#> NULL
#> 
#> 
#> $entrada[[16]]
#> $entrada[[16]]$nome
#> [1] "Situacao"
#> 
#> $entrada[[16]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[16]]$tipo_db
#> [1] "varchar(50)"
#> 
#> $entrada[[16]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[16]]$descricao
#> [1] "Situacao do Contrato"
#> 
#> $entrada[[16]]$valor
#> NULL
#> 
#> 
#> $entrada[[17]]
#> $entrada[[17]]$nome
#> [1] "Valor"
#> 
#> $entrada[[17]]$tipo_api
#> [1] "numeric"
#> 
#> $entrada[[17]]$tipo_db
#> [1] "numeric(18,2)"
#> 
#> $entrada[[17]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[17]]$descricao
#> [1] "Valor do Contrato"
#> 
#> $entrada[[17]]$valor
#> NULL
#> 
#> 
#> $entrada[[18]]
#> $entrada[[18]]$nome
#> [1] "SiglaUG"
#> 
#> $entrada[[18]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[18]]$tipo_db
#> [1] "varchar(20)"
#> 
#> $entrada[[18]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[18]]$descricao
#> [1] "Sigla da Unidade Gestora"
#> 
#> $entrada[[18]]$valor
#> NULL
#> 
#> 
#> $entrada[[19]]
#> $entrada[[19]]$nome
#> [1] "CodigoUG"
#> 
#> $entrada[[19]]$tipo_api
#> [1] "numeric"
#> 
#> $entrada[[19]]$tipo_db
#> [1] "int(10)"
#> 
#> $entrada[[19]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[19]]$descricao
#> [1] "Codigo da Unidade Gestora no TCE"
#> 
#> $entrada[[19]]$valor
#> NULL
#> 
#> 
#> $entrada[[20]]
#> $entrada[[20]]$nome
#> [1] "CodigoEfiscoUG"
#> 
#> $entrada[[20]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[20]]$tipo_db
#> [1] "char(6)"
#> 
#> $entrada[[20]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[20]]$descricao
#> [1] "Codigo da Unidade Gestora no e-Fisco"
#> 
#> $entrada[[20]]$valor
#> NULL
#> 
#> 
#> $entrada[[21]]
#> $entrada[[21]]$nome
#> [1] "CodigoAudinUG"
#> 
#> $entrada[[21]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[21]]$tipo_db
#> [1] "varchar(20)"
#> 
#> $entrada[[21]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[21]]$descricao
#> [1] "Codigo da Unidade Gestora no Audin"
#> 
#> $entrada[[21]]$valor
#> NULL
#> 
#> 
#> $entrada[[22]]
#> $entrada[[22]]$nome
#> [1] "PortariaComissaoLicitacao"
#> 
#> $entrada[[22]]$tipo_api
#> [1] "string"
#> 
#> $entrada[[22]]$tipo_db
#> [1] "varchar(100)"
#> 
#> $entrada[[22]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[22]]$descricao
#> [1] "Número da Portaria na Comissão de Licitacao"
#> 
#> $entrada[[22]]$valor
#> NULL
#> 
#> 
#> $entrada[[23]]
#> $entrada[[23]]$nome
#> [1] "CodigoContrato"
#> 
#> $entrada[[23]]$tipo_api
#> [1] "numeric"
#> 
#> $entrada[[23]]$tipo_db
#> [1] "int(10)"
#> 
#> $entrada[[23]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[23]]$descricao
#> [1] "Código do contrato no LICON"
#> 
#> $entrada[[23]]$valor
#> NULL
#> 
#> 
#> $entrada[[24]]
#> $entrada[[24]]$nome
#> [1] "CodigoPL"
#> 
#> $entrada[[24]]$tipo_api
#> [1] "numeric"
#> 
#> $entrada[[24]]$tipo_db
#> [1] "int(10)"
#> 
#> $entrada[[24]]$obrigatorio
#> [1] "N"
#> 
#> $entrada[[24]]$descricao
#> [1] "Código do processo licitatório no LICON"
#> 
#> $entrada[[24]]$valor
#> NULL
#> 
#> 
#> 
#> $saida
#> $saida[[1]]
#> $saida[[1]]$nome
#> [1] "UnidadeGestora"
#> 
#> $saida[[1]]$tipo_api
#> [1] "string"
#> 
#> $saida[[1]]$tipo_db
#> [1] "varchar(200)"
#> 
#> $saida[[1]]$descricao
#> [1] "Unidade Gestora"
#> 
#> 
#> $saida[[2]]
#> $saida[[2]]$nome
#> [1] "UnidadeOrcamentaria"
#> 
#> $saida[[2]]$tipo_api
#> [1] "string"
#> 
#> $saida[[2]]$tipo_db
#> [1] "varchar(200)"
#> 
#> $saida[[2]]$descricao
#> [1] "Unidade Gestora da SCA_LicitacoesDetalhes"
#> 
#> 
#> $saida[[3]]
#> $saida[[3]]$nome
#> [1] "Esfera"
#> 
#> $saida[[3]]$tipo_api
#> [1] "string"
#> 
#> $saida[[3]]$tipo_db
#> [1] "char(2)"
#> 
#> $saida[[3]]$descricao
#> [1] "Esfera (E -Estadual ou M - Municipal)"
#> 
#> 
#> $saida[[4]]
#> $saida[[4]]$nome
#> [1] "Municipio"
#> 
#> $saida[[4]]$tipo_api
#> [1] "string"
#> 
#> $saida[[4]]$tipo_db
#> [1] "varchar(40)"
#> 
#> $saida[[4]]$descricao
#> [1] "Município"
#> 
#> 
#> $saida[[5]]
#> $saida[[5]]$nome
#> [1] "NumeroContrato"
#> 
#> $saida[[5]]$tipo_api
#> [1] "string"
#> 
#> $saida[[5]]$tipo_db
#> [1] "varchar(50)"
#> 
#> $saida[[5]]$descricao
#> [1] "Número do Contrato"
#> 
#> 
#> $saida[[6]]
#> $saida[[6]]$nome
#> [1] "AnoContrato"
#> 
#> $saida[[6]]$tipo_api
#> [1] "numeric"
#> 
#> $saida[[6]]$tipo_db
#> [1] "int(10)"
#> 
#> $saida[[6]]$descricao
#> [1] "Ano do Contrato"
#> 
#> 
#> $saida[[7]]
#> $saida[[7]]$nome
#> [1] "TipoProcesso"
#> 
#> $saida[[7]]$tipo_api
#> [1] "string"
#> 
#> $saida[[7]]$tipo_db
#> [1] "varchar(100)"
#> 
#> $saida[[7]]$descricao
#> [1] "Tipo do Processo"
#> 
#> 
#> $saida[[8]]
#> $saida[[8]]$nome
#> [1] "AnoProcesso"
#> 
#> $saida[[8]]$tipo_api
#> [1] "numeric"
#> 
#> $saida[[8]]$tipo_db
#> [1] "int(10)"
#> 
#> $saida[[8]]$descricao
#> [1] "Ano do Processo"
#> 
#> 
#> $saida[[9]]
#> $saida[[9]]$nome
#> [1] "CPF_CNPJ"
#> 
#> $saida[[9]]$tipo_api
#> [1] "string"
#> 
#> $saida[[9]]$tipo_db
#> [1] "varchar(69)"
#> 
#> $saida[[9]]$descricao
#> [1] "CPF ou CNPJ do Contratado"
#> 
#> 
#> $saida[[10]]
#> $saida[[10]]$nome
#> [1] "TipoDocumento"
#> 
#> $saida[[10]]$tipo_api
#> [1] "string"
#> 
#> $saida[[10]]$tipo_db
#> [1] "varchar(5)"
#> 
#> $saida[[10]]$descricao
#> [1] "Tipo do Documento do Contratado"
#> 
#> 
#> $saida[[11]]
#> $saida[[11]]$nome
#> [1] "NumeroDocumento"
#> 
#> $saida[[11]]$tipo_api
#> [1] "string"
#> 
#> $saida[[11]]$tipo_db
#> [1] "varchar(20)"
#> 
#> $saida[[11]]$descricao
#> [1] "CPF ou CNPJ do Contratado"
#> 
#> 
#> $saida[[12]]
#> $saida[[12]]$nome
#> [1] "NumeroDocumentoAjustado"
#> 
#> $saida[[12]]$tipo_api
#> [1] "string"
#> 
#> $saida[[12]]$tipo_db
#> [1] "varchar(30)"
#> 
#> $saida[[12]]$descricao
#> [1] "CPF ou CNPJ do Contratado sem Formatação"
#> 
#> 
#> $saida[[13]]
#> $saida[[13]]$nome
#> [1] "RazaoSocial"
#> 
#> $saida[[13]]$tipo_api
#> [1] "string"
#> 
#> $saida[[13]]$tipo_db
#> [1] "varchar(255)"
#> 
#> $saida[[13]]$descricao
#> [1] "Razão Social do Contratado"
#> 
#> 
#> $saida[[14]]
#> $saida[[14]]$nome
#> [1] "Objeto"
#> 
#> $saida[[14]]$tipo_api
#> [1] "string"
#> 
#> $saida[[14]]$tipo_db
#> [1] "varchar(106)"
#> 
#> $saida[[14]]$descricao
#> [1] "Objeto do Contrato"
#> 
#> 
#> $saida[[15]]
#> $saida[[15]]$nome
#> [1] "Vigencia"
#> 
#> $saida[[15]]$tipo_api
#> [1] "string"
#> 
#> $saida[[15]]$tipo_db
#> [1] "varchar(63)"
#> 
#> $saida[[15]]$descricao
#> [1] "Vigência do Contrato"
#> 
#> 
#> $saida[[16]]
#> $saida[[16]]$nome
#> [1] "Valor"
#> 
#> $saida[[16]]$tipo_api
#> [1] "numeric"
#> 
#> $saida[[16]]$tipo_db
#> [1] "numeric(18,2)"
#> 
#> $saida[[16]]$descricao
#> [1] "Valor do Contrato"
#> 
#> 
#> $saida[[17]]
#> $saida[[17]]$nome
#> [1] "Estagio"
#> 
#> $saida[[17]]$tipo_api
#> [1] "string"
#> 
#> $saida[[17]]$tipo_db
#> [1] "varchar(15)"
#> 
#> $saida[[17]]$descricao
#> [1] "Estagio do Contrato"
#> 
#> 
#> $saida[[18]]
#> $saida[[18]]$nome
#> [1] "Situacao"
#> 
#> $saida[[18]]$tipo_api
#> [1] "string"
#> 
#> $saida[[18]]$tipo_db
#> [1] "varchar(50)"
#> 
#> $saida[[18]]$descricao
#> [1] "Situacao do Contrato"
#> 
#> 
#> $saida[[19]]
#> $saida[[19]]$nome
#> [1] "SiglaUG"
#> 
#> $saida[[19]]$tipo_api
#> [1] "string"
#> 
#> $saida[[19]]$tipo_db
#> [1] "varchar(20)"
#> 
#> $saida[[19]]$descricao
#> [1] "Sigla da Unidade Gestora"
#> 
#> 
#> $saida[[20]]
#> $saida[[20]]$nome
#> [1] "CodigoUG"
#> 
#> $saida[[20]]$tipo_api
#> [1] "numeric"
#> 
#> $saida[[20]]$tipo_db
#> [1] "int(10)"
#> 
#> $saida[[20]]$descricao
#> [1] "Codigo da Unidade Gestora no TCE"
#> 
#> 
#> $saida[[21]]
#> $saida[[21]]$nome
#> [1] "CodigoEfiscoUG"
#> 
#> $saida[[21]]$tipo_api
#> [1] "string"
#> 
#> $saida[[21]]$tipo_db
#> [1] "char(6)"
#> 
#> $saida[[21]]$descricao
#> [1] "Codigo da Unidade Gestora no e-Fisco"
#> 
#> 
#> $saida[[22]]
#> $saida[[22]]$nome
#> [1] "CodigoAudinUG"
#> 
#> $saida[[22]]$tipo_api
#> [1] "string"
#> 
#> $saida[[22]]$tipo_db
#> [1] "varchar(20)"
#> 
#> $saida[[22]]$descricao
#> [1] "Codigo da Unidade Gestora no Audin"
#> 
#> 
#> $saida[[23]]
#> $saida[[23]]$nome
#> [1] "PortariaComissaoLicitacao"
#> 
#> $saida[[23]]$tipo_api
#> [1] "string"
#> 
#> $saida[[23]]$tipo_db
#> [1] "varchar(100)"
#> 
#> $saida[[23]]$descricao
#> [1] "Número da Portaria na Comissão de Licitacao"
#> 
#> 
#> $saida[[24]]
#> $saida[[24]]$nome
#> [1] "LinkArquivo"
#> 
#> $saida[[24]]$tipo_api
#> [1] "string"
#> 
#> $saida[[24]]$tipo_db
#> [1] "varchar(500)"
#> 
#> $saida[[24]]$descricao
#> [1] "Link para o Arquivo em PDF"
#> 
#> 
#> $saida[[25]]
#> $saida[[25]]$nome
#> [1] "CodigoContrato"
#> 
#> $saida[[25]]$tipo_api
#> [1] "numeric"
#> 
#> $saida[[25]]$tipo_db
#> [1] "int(10)"
#> 
#> $saida[[25]]$descricao
#> [1] "Código do contrato no LICON"
#> 
#> 
#> $saida[[26]]
#> $saida[[26]]$nome
#> [1] "CodigoPL"
#> 
#> $saida[[26]]$tipo_api
#> [1] "numeric"
#> 
#> $saida[[26]]$tipo_db
#> [1] "int(10)"
#> 
#> $saida[[26]]$descricao
#> [1] "Código do processo licitatório no LICON"
#> 
#> 
#> 
```
