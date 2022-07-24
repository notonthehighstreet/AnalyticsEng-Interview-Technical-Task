{{ config(
    enabled=true,
    materialized='view',
    unique_key='PlaylistId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  PlaylistId
  , Name
from {{ ref('playlists') }}
