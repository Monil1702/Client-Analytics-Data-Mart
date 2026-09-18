select
    a.client_id,
    coalesce(sum(f.total_deposits), 0) as total_deposits,
    coalesce(sum(f.total_withdrawals), 0) as total_withdrawals,
    coalesce(sum(f.net_flow), 0) as net_flow
from {{ ref('stg_accounts') }} a
left join {{ ref('int_account_flows') }} f on a.account_id = f.account_id
group by a.client_id
