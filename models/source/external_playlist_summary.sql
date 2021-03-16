select
  *

from {{ source('raw', 'external_playlist_summary') }}
