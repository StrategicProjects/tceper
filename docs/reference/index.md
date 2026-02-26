# Package index

## Core

Low-level function for querying any API endpoint.

- [`tce_request()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_request.md)
  : Perform a request to the TCE-PE Open Data API
- [`tceper`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tceper-package.md)
  [`tceper-package`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tceper-package.md)
  : tceper: Access the Open Data API of TCE-PE

## Endpoint catalog

Discover endpoints and inspect input/output fields from the built-in API
catalog.

- [`tce_catalog()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_catalog.md)
  : List available API endpoints

- [`tce_endpoint()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_endpoint.md)
  : Get the catalog entry for a given endpoint

- [`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md)
  : List input parameters for an endpoint

- [`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md)
  : List output fields for an endpoint

- [`print(`*`<tce_params_tbl>`*`)`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/print.tce_params_tbl.md)
  :

  Print method for
  [`tce_params()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_params.md)
  output

- [`print(`*`<tce_fields_tbl>`*`)`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/print.tce_fields_tbl.md)
  :

  Print method for
  [`tce_fields()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_fields.md)
  output

## Revenues

State and municipal revenue data.

- [`tce_state_revenues()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_revenues.md)
  : State revenues
- [`tce_municipal_revenues()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_revenues.md)
  : Municipal revenues
- [`tce_budgeted_revenues()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_budgeted_revenues.md)
  : Budgeted revenues (municipal)

## Expenditures

State and municipal expenditure data.

- [`tce_state_expenditures()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_expenditures.md)
  : State expenditures
- [`tce_municipal_expenditures()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_expenditures.md)
  : Municipal expenditures
- [`tce_municipal_transfers()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_transfers.md)
  : Municipal granted transfers
- [`tce_municipal_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_creditor_types.md)
  : Municipal creditor types
- [`tce_state_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_creditor_types.md)
  : State creditor types

## Budget commitments

Commitment (empenho) summaries, liquidations, payments and line items.

- [`tce_commitment_summary()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_commitment_summary.md)
  : Commitment summary
- [`tce_commitment_liquidations()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_commitment_liquidations.md)
  : Commitment liquidations
- [`tce_commitment_payments()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_commitment_payments.md)
  : Commitment payments
- [`tce_state_commitment_items()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_commitment_items.md)
  : State commitment line items
- [`tce_state_price_comparison()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_price_comparison.md)
  : State price comparison

## Suppliers

Supplier registry and sanctions.

- [`tce_suppliers()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_suppliers.md)
  : Suppliers
- [`tce_sanctions()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_sanctions.md)
  : Sanctions
- [`tce_person_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_person_creditor_types.md)
  : Person creditor types

## Procurement & contracts

Bids, contracts, amendments, agreements and related lookup tables.

- [`tce_contracts()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contracts.md)
  : Contracts
- [`tce_contract_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contract_documents.md)
  : Contract documents
- [`tce_contract_items()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contract_items.md)
  : Contract line items
- [`tce_contract_amendments()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_contract_amendments.md)
  : Contract amendments
- [`tce_agreements()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_agreements.md)
  : Agreements (Convenios)
- [`tce_bids()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bids.md)
  : Bids
- [`tce_bid_details()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_details.md)
  : Bid details with bidders
- [`tce_bid_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_documents.md)
  : Bid documents
- [`tce_bid_stages()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_stages.md)
  : Bid stages
- [`tce_bid_modalities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_modalities.md)
  : Bid modalities
- [`tce_bid_statuses()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_statuses.md)
  : Bid statuses
- [`tce_bid_legal_basis()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_bid_legal_basis.md)
  : Bid legal basis
- [`tce_object_characteristics()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_object_characteristics.md)
  : Object characteristics
- [`tce_object_classifications()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_object_classifications.md)
  : Object classifications
- [`tce_object_nature()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_object_nature.md)
  : Object nature types

## Public works

Engineering works, contractors, audits and school transport.

- [`tce_public_works()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_public_works.md)
  : Public works
- [`tce_public_works_contractors()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_public_works_contractors.md)
  : Public works contractor data
- [`tce_public_works_audits()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_public_works_audits.md)
  : Public works audit data
- [`tce_school_transport()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_school_transport.md)
  : School transport

## Legal processes

Processes, determinations, recommendations, outcomes, debts, fines and
spending limits.

- [`tce_processes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_processes.md)
  : Legal processes
- [`tce_determinations()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_determinations.md)
  : Determinations
- [`tce_consideranda()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_consideranda.md)
  : Consideranda
- [`tce_recommendations()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_recommendations.md)
  : Recommendations
- [`tce_outcomes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_outcomes.md)
  : Process outcomes
- [`tce_retirement_outcomes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_retirement_outcomes.md)
  : Retirement, pension and reform outcomes
- [`tce_special_accountability()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_special_accountability.md)
  : Special accountability outcomes
- [`tce_debts_fines()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_debts_fines.md)
  : Debts and fines
- [`tce_spending_limits()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_spending_limits.md)
  : Spending limits

## Personnel

Public servant records.

- [`tce_servants()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_servants.md)
  : Public servants

## Reference tables

Municipalities, managed entities, sub-units, creditor types, payroll
types, funding sources and inactivation reasons.

- [`tce_municipalities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipalities.md)
  : Municipalities
- [`tce_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_entities.md)
  : Managed entities (all)
- [`tce_state_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_state_entities.md)
  : State managed entities
- [`tce_municipal_entities()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_municipal_entities.md)
  : Municipal managed entities
- [`tce_sub_units()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_sub_units.md)
  : Sub-units of managed entities
- [`tce_creditor_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_creditor_types.md)
  : Creditor types
- [`tce_payroll_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_payroll_types.md)
  : Payroll types
- [`tce_funding_sources()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_funding_sources.md)
  : Funding source types
- [`tce_inactivation_reasons()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_inactivation_reasons.md)
  : Inactivation reason types

## RemessaTCEPE

Data from the RemessaTCEPE system: benefit types, reference
sources/dates/codes, update indices, budget statuses, legal instruments,
procurement processes and public works.

- [`tce_benefit_types()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_benefit_types.md)
  : Benefit types (Remessa)
- [`tce_reference_sources()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_reference_sources.md)
  : Reference sources (Remessa)
- [`tce_reference_dates()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_reference_dates.md)
  : Reference dates (Remessa)
- [`tce_reference_codes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_reference_codes.md)
  : Reference codes (Remessa)
- [`tce_update_indices()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_update_indices.md)
  : Price update indices (Remessa)
- [`tce_budget_statuses()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_budget_statuses.md)
  : Budget item statuses (Remessa)
- [`tce_legal_instruments()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instruments.md)
  : Legal instruments (Remessa)
- [`tce_legal_instrument_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instrument_documents.md)
  : Legal instrument documents (Remessa)
- [`tce_legal_instrument_items()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instrument_items.md)
  : Legal instrument items (Remessa)
- [`tce_legal_instrument_participants()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_legal_instrument_participants.md)
  : Legal instrument participants (Remessa)
- [`tce_procurement_processes()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_processes.md)
  : Procurement processes (Remessa)
- [`tce_procurement_process_documents()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_process_documents.md)
  : Procurement process documents (Remessa)
- [`tce_procurement_process_budget()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_process_budget.md)
  : Procurement process budget (Remessa)
- [`tce_procurement_process_participants()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_procurement_process_participants.md)
  : Procurement process participants (Remessa)
- [`tce_remessa_works()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_remessa_works.md)
  : Public works details (Remessa)
- [`tce_remessa_works_execution()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_remessa_works_execution.md)
  : Public works execution (Remessa)
- [`tce_remessa_works_geometry()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_remessa_works_geometry.md)
  : Public works geometry (Remessa)

## Cache

Manage the in-memory cache.

- [`tce_cache_clear()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_cache_clear.md)
  : Clear the tceper in-memory cache
- [`tce_cache_info()`](https://monitoramento.sepe.pe.gov.br/tcepe/reference/tce_cache_info.md)
  : Show cache status
