select client_id
from {{ ref('mart_client_360') }}
where assets_under_management < 0
   or account_count < 0
   or interaction_count < 0
