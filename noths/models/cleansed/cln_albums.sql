{{ config(
    enabled=true,
    materialized='view',
    unique_key='AlbumId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  AlbumId
  , Title
  , ArtistId
from {{ ref('albums') }}
