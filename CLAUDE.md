# tceper — project notes for Claude

R client for the **Open Data API of TCE-PE** (Tribunal de Contas do
Estado de Pernambuco). Wraps ~71 endpoints into tidy tibble-returning
functions.

## Current status

**0.1.4 resubmitted to CRAN on 2026-05-28 — awaiting response.**

Resubmission addressing Benjamin Altmann's review of 0.1.3 (quote
software/API names in Title/Description, add API web reference, unwrap
offline-runnable examples and comment the remaining `\dontrun{}` ones).

Until CRAN replies, treat the package as frozen:
- No new commits to `master` unless they fix something CRAN explicitly
  asks about.
- If CRAN requests further revisions, bump to 0.1.5 (or follow the
  version policy in their reply), update `cran-comments.md`, and
  resubmit.
- If CRAN accepts, the next development cycle starts at 0.1.4.9000.

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
