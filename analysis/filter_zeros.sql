select
  case when streams = 0 then 'zero' else 'more_than_zero' end as stream_bucket
  , count(*) as playlists

from {{ ref('external_playlist_summary') }}

group by 1
order by 2 desc
