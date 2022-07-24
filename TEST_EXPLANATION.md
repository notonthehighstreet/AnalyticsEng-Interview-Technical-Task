Explanation of Steps followed to complete the Test

## Overall
- I have created 3 layered or schemas: ing (for ingestion or raw data) + cln (for cleansed or staging models) + mdl (for modelled data)
- I have added generate_schema_name macro that overwrites dbt default behaviour of creating schemas per user

## Steps
1. I created an empty dbt project
2. I added the source data as seeds (stored in ing schema - seeds folder) and created for each of them a cleansed model (stored in cln schema - cleansed folder). For cln_invoice_items model I added the TotalCost attribute. Also for each cln model I created corresponding .yml files with uniqueness test
3. I created a first version of the wanted model: fact_monthly_tracks (stored in mdl schema - modelled folder). I also created a dim_calendar dimension table that will help me on creating the model
4. I enhanced the fact_monthly_tracks model with clustering + created an incremental version of it (fact_monthly_tracks_incr). 

## Notes
Due to the requirement of not overthinking the solution and not creating additional requirements I decided not to create dimension and fact tables for tracks and invoices. Normally I would have create them, having some of the logic currently present in fact_monthly_tracks on these models.