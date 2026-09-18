select
    trim(interaction_id) as interaction_id,
    trim(client_id) as client_id,
    cast(interaction_at as timestamp) as interaction_at,
    lower(trim(channel)) as channel,
    lower(trim(outcome)) as outcome
from {{ ref('raw_interactions') }}
