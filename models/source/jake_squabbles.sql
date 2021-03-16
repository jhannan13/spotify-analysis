select
  *

from {{ source('raw', 'jake_squabbles') }}
