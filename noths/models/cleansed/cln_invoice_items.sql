{{ config(
    enabled=true,
    materialized='view',
    unique_key='id',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  InvoiceLineId
  , InvoiceId
  , TrackId
  , UnitPrice
  , Quantity
  , UnitPrice * Quantity as TotalCost
from {{ ref('invoice_items') }}
