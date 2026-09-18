select
    count(*) filter (where status = 'active') as active_clients,
    sum(assets_under_management) as assets_under_management,
    sum(net_flow) as net_flow,
    avg(case when last_interaction_at is not null then 1.0 else 0.0 end) as engagement_rate
from {{ ref('mart_client_360') }}
