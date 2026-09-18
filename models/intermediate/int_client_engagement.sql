select
    client_id,
    count(*) as interaction_count,
    max(interaction_at) as last_interaction_at,
    count(*) filter (where interaction_at >= (select max(interaction_at) from {{ ref('stg_interactions') }}) - interval '30 days') as interactions_last_30_days
from {{ ref('stg_interactions') }}
group by client_id
