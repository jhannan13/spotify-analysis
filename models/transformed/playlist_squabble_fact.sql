{{
  config(
    materialized='view'
  )
}}

select
  js.time_played
  , js.artist as squabble_artist
  , js.track as squabble_track
  , case when lower(js.artist_track) = lower(jpm.artist_track) then TRUE else FALSE end as is_from_playlist
  , jpm.*

from {{ ref('jake_squabbles') }} as js
left join {{ ref('jake_playlist_metrics') }} as jpm
  on lower(js.artist_track) = lower(jpm.artist_track)
