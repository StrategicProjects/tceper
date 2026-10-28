# tceper — project notes for Claude

R client for the **Open Data API of TCE-PE** (Tribunal de Contas do
Estado de Pernambuco). Wraps 72 endpoints into tidy tibble-returning
functions.

## Current status

**0.1.5 submitted to CRAN on 2026-10-28** (previous: 0.1.4 published
2026-06-01). Submission went through `devtools:::upload_cran()` (the
public `submit_cran()` needs interactive `yesno()`s; with the user's
go-ahead, call `upload_cran(pkg, built_path)` + `flag_release(pkg)`
directly on the already-checked tarball). Maintainer confirmation
email goes to `leite@castlab.org`. After acceptance: commit, tag
`v0.1.5`, push (push publishes the pkgdown site from `master/docs`).
Normal workflow — build + check before any release-relevant change,
re-render pkgdown only when docs changed.

**Dev cycle started 2026-10-28** (`0.1.4.9000`). An API sweep (all 72
`Exemplo!detalhar` pages re-scraped and diffed against the packaged
catalog) found: one new endpoint `Remessa_InstrumentoJuridicoTermos`
(wrapped as `tce_legal_instrument_terms()`), a new `ORGAO` input param
on `UnidadesJurisdicionadas`, and nothing removed or renamed. The
catalog JSON was refreshed (also fixing 100 datetime entries where the
original scraper glued `tipo_api` into `tipo_db`), and two latent
`tce_params()` bugs were fixed: `required` never showed `TRUE` (API
marks mandatory as `"S"`) and `type` always fell back to `"character"`
(catalog key is `tipo_api`, not `tipo`). `R CMD check --as-cran`:
Status OK. To re-run the sweep later: fetch
`Exemplo!listar` + each `Exemplo!detalhar?dadosAbertos.id=N`
(`detail_url` in the catalog) and diff `entrada`/`saida`.

Note: pkgdown auto-renders every root `*.md` (including `CLAUDE.md`)
and has no exclude config, so `docs/CLAUDE.{html,md}` are gitignored to
keep these internal notes off the published site. `build_site()` will
recreate them locally each run — that's expected; they just never get
committed.

## API quirks (these bite, write them down)

- **Host:** `https://sistemas.tcepe.tc.br/DadosAbertos/`. The previous
  host `sistemas.tce.pe.gov.br` is retired and returns empty bodies.
- **Struts2 URLs:** the literal `!` must survive into the request
  (e.g. `Contratos!json`). Do not use `httr2::req_url_path_append()` --
  it percent-encodes the `!` to `%21` and the server silently drops all
  query params. Build the URL with `paste0()` and `httr2::request()`.
- **Encoding ISO-8859-1, both directions:**
  - Response body: read with
    `httr2::resp_body_string(resp, encoding = "ISO-8859-1")`.
  - Query params: transcode UTF-8 -> Latin-1, mark as `bytes`, then
    percent-encode. See `.tce_url_encode_latin1()` in `R/request.R`.
    Without this, accented filters silently return 0 rows.
- **Geo-restriction:** the API only accepts requests from Brazilian
  IPs. CRAN check machines, GitHub Actions runners, and most CI return
  TLS/connection errors. All examples are `\dontrun{}` and all
  API-touching vignette chunks use `eval = FALSE, purl = FALSE` (the
  `purl = FALSE` is critical -- without it, `R CMD check` extracts and
  runs the code regardless of `eval`).
- **Response limit:** API caps at 100,000 rows per request. The
  package warns when reached. Always narrow with `anoreferencia` /
  `mesreferencia` / similar.
- **Catalog is offline:** `tce_catalog()`, `tce_endpoint()`,
  `tce_params()`, `tce_fields()` read from
  `inst/extdata/tcepe_dados_abertos_catalogo.json` and work anywhere.

## Workflow

- Use `devtools::load_all(".")` for interactive iteration.
- Run `devtools::document()` after touching roxygen.
- Build + check before any release-relevant change:
  ```sh
  rm -rf tceper.Rcheck tceper_*.tar.gz
  R CMD build . --no-manual
  _R_CHECK_CRAN_INCOMING_=FALSE R CMD check tceper_<ver>.tar.gz --as-cran --no-manual
  ```
- Re-render pkgdown only when docs changed:
  `Rscript -e 'pkgdown::build_site(preview = FALSE, devel = FALSE)'`.
- `.DS_Store` may appear in the local `.Rcheck` dir after Finder
  visits it — this is a local-only NOTE, the tarball is clean. Verify
  with `tar -tzf <tarball> | grep DS_Store` (should be empty).

## Don't reintroduce

- The `CURL_SSL_BACKEND = "secure-transport"` macOS workaround
  (deleted with `R/zzz.R`). The new host has modern TLS that works
  with stock LibreSSL.
- Non-ASCII characters in R source. Use `\uXXXX` escapes if you need
  Unicode in string literals; em-dashes/ellipses in roxygen comments
  trigger a portability WARNING. Verify with
  `tools::showNonASCIIfile()`.
