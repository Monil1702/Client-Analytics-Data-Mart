select
    trim(client_id) as client_id,
    trim(advisor_id) as advisor_id,
    trim(full_name) as full_name,
    lower(trim(segment)) as segment,
    lower(trim(status)) as status,
    cast(created_at as date) as created_at
from {{ ref('raw_clients') }}
