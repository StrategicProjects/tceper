# tceper: Access the Open Data API of TCE-PE

An R interface to the Open Data API of the Tribunal de Contas do Estado
de Pernambuco (TCE-PE), the Court of Accounts of the State of
Pernambuco, Brazil. Provides tidy, ready-to-use functions to query
public data on revenues, expenditures, commitments, procurement,
contracts, agreements, public works, legal processes, personnel and
reference tables for all state and municipal government entities in
Pernambuco.

## Recommended workflow

1.  **Discover** endpoints with
    [`tce_catalog()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_catalog.md)
    (filter with `search =`).

2.  **Inspect** input parameters with
    [`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md)
    and output fields with
    [`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md).

3.  **Query** using a wrapper function (e.g.
    [`tce_contracts()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contracts.md))
    or the low-level
    [`tce_request()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_request.md).

## Parameter names

All query parameters are passed through `...` using the names shown by
[`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md).
You can use either the original API name (e.g. `CodigoEfiscoUG`) or its
`snake_case` equivalent (e.g. `codigo_efisco_ug`); the package maps them
automatically.

## Options

- `tceper.verbose`:

  If `TRUE`, all functions print the final API URL. Default: `FALSE`.

- `tceper.progress`:

  If `FALSE`, suppresses progress messages. Default: `TRUE`.

- `tceper.cache_ttl`:

  Cache time-to-live in seconds. Default: `3600` (1 hour).

## See also

- [`tce_catalog()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_catalog.md),
  [`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md),
  [`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md)
  — endpoint discovery

- [`tce_request()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_request.md)
  — low-level query function

- [`tce_cache_info()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_cache_info.md),
  [`tce_cache_clear()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_cache_clear.md)
  — cache management

## Author

**Maintainer**: Andre Leite <leite@castlab.org>

Authors:

- Marcos Wasilew <marcos.wasilew@gmail.com>

- Hugo Vasconcelos <hugo.vasconcelos@ufpe.br>

- Carlos Amorin <carlos.agaf@ufpe.br>

- Diogo Bezerra <diogo.bezerra@ufpe.br>
