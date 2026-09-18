select
    c.client_id,
    c.advisor_id,
    count(a.account_id) as account_count,
    coalesce(sum(case when a.status = 'open' then a.current_balance else 0 end), 0) as assets_under_management
from {{ ref('stg_clients') }} c
left join {{ ref('stg_accounts') }} a on c.client_id = a.client_id
group by c.client_id, c.advisor_id
