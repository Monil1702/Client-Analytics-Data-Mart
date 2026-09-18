select
    c.client_id,
    c.full_name,
    c.segment,
    c.status,
    c.advisor_id,
    a.account_count,
    a.assets_under_management,
    f.total_deposits,
    f.total_withdrawals,
    f.net_flow,
    coalesce(e.interaction_count, 0) as interaction_count,
    e.last_interaction_at
from {{ ref('stg_clients') }} c
left join {{ ref('int_client_accounts') }} a using (client_id)
left join {{ ref('int_client_flows') }} f using (client_id)
left join {{ ref('int_client_engagement') }} e using (client_id)
