{{ config(
    enabled=true,
    materialized='view',
    unique_key='MediaTypeId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  MediaTypeId
  , Name
from {{ ref('media_types') }}
