{{ config(
    enabled=true,
    materialized='view',
    unique_key='GenreId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  GenreId
  , Name
from {{ ref('genres') }}
