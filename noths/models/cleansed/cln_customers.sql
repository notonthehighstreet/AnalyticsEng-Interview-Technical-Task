{{ config(
    enabled=true,
    materialized='view',
    unique_key='CustomerId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  CustomerId
  , FirstName
  , LastName
  , Company
  , Address
  , City
  , State
  , Country
  , PostalCode
  , Phone
  , Fax
  , Email
  , SupportRepId
from {{ ref('customers') }}
