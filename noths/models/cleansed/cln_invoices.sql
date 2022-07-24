{{ config(
    enabled=true,
    materialized='view',
    unique_key='id',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  InvoiceId
  , CustomerId
  , InvoiceDate
  , BillingAddress
  , BillingCity
  , BillingState
  , BillingCountry
  , BillingPostalCode
  , Total
from {{ ref('invoices') }}
