{{ config(
    enabled=true,
    materialized='view',
    unique_key='ArtistId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  ArtistId
  , Name
from {{ ref('artists') }}
