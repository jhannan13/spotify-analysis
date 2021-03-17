select
  artist
  , album
  , track
  , time_played
  , concat(artist, '-', track) as artist_track

from {{ source('raw', 'jake_squabbles') }}
