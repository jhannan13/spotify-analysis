select
  *
  , lower(concat(artist, '-', name)) as artist_track

from {{ source('raw', 'jake_playlist_metrics') }}
