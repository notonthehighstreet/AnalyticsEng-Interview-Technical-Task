{{ config(
    enabled=true,
    materialized='view',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  PlaylistId
  , TrackId
from {{ ref('playlist_track') }}
