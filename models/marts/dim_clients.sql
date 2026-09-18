select client_id, advisor_id, full_name, segment, status, created_at
from {{ ref('stg_clients') }}
