
select
  *
  , safe_divide(mau - mau_previous_month, mau_previous_month) as mau_change
  , safe_divide(dau, users) as daily_per_users
  , safe_divide(skippers, users) as skippers_users
  , safe_divide(stream30s, streams) as stream30s_rate
  , safe_divide(wau, users) as weekly_per_users
  , ntile(10) over (order by streams asc) as streams_decile
  , ntile(10) over (order by wau asc) as wau_decile
  , ntile(10) over (order by safe_divide(dau, users) asc) as daily_per_tot_user_decile
  , ntile(10) over (order by safe_divide(mau - mau_previous_month, mau_previous_month) asc) as mau_change_decile
  , ntile(10) over (order by n_tracks asc) as tracks_decile
  , ntile(10) over (order by n_artists asc) as artists_decile
  , ntile(10) over (order by safe_divide(skippers, users) asc) as skippers_users_decile

from {{ ref('external_playlist_summary') }}

where stream30s > 0
  and mau_previous_month > 10

order by safe_divide(mau - mau_previous_month, mau) desc
