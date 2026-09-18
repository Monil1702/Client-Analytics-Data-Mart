select
    segment,
    count(*) as client_count,
    count(*) filter (where status = 'active') as active_clients,
    sum(assets_under_management) as assets_under_management,
    sum(net_flow) as net_flow
from {{ ref('mart_client_360') }}
group by segment
