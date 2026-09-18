select
    advisor_id,
    count(*) filter (where status = 'active') as active_clients,
    sum(assets_under_management) as assets_under_management,
    avg(interaction_count) as avg_interactions_per_client,
    sum(net_flow) as net_flow
from {{ ref('mart_client_360') }}
group by advisor_id
