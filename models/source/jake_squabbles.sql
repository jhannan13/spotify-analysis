select
  artist
  , album
  , track
  , time_played
  , lower(concat(artist, '-', track)) as artist_track

from {{ source('raw', 'jake_squabbles') }}
