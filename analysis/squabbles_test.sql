select
  coalesce(artist, squabble_artist) as artist
  , is_from_playlist
  , datetime(time_played, 'America/New_York') as played_dt
  , time(time_played, 'America/New_York') as played_time
  , date(time_played, 'America/New_York') as played_date
  , count(*) as squabbles
  , avg(energy) as energy
  , avg(danceability) as danceability
  , avg(tempo) as tempo
  , avg(loudness) as loudness
  , avg(popularity) as popularity
  , avg(speechiness) as speechiness

from {{ ref('playlist_squabble_fact') }}

where time_played is not null
  and is_from_playlist

group by 1,2,3,4,5
order by played_date asc;
