{{ config(
    enabled=true,
    materialized='view',
    unique_key='TrackId',
    schema='cln',
    tags=["cleansed"],
) }}

select 
  TrackId
  , Name
  , AlbumId
  , MediaTypeId
  , GenreId
  , Composer
  , Milliseconds
  , Bytes
  , UnitPrice
from {{ ref('tracks') }}
