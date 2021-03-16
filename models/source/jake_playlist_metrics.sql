select
  *

from {{ source('raw', 'jake_playlist_metrics') }}
