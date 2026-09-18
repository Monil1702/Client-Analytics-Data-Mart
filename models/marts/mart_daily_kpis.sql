with dates as (
    select transaction_date as reporting_date from {{ ref('stg_transactions') }}
    union
    select cast(interaction_at as date) from {{ ref('stg_interactions') }}
)
select
    d.reporting_date,
    (select count(*) from {{ ref('stg_clients') }} where status = 'active') as active_clients,
    (select coalesce(sum(current_balance), 0) from {{ ref('stg_accounts') }} where status = 'open') as assets_under_management,
    coalesce(sum(case when t.transaction_type = 'deposit' then t.amount else -t.amount end), 0) as net_flow
from dates d
left join {{ ref('stg_transactions') }} t on d.reporting_date = t.transaction_date
group by d.reporting_date
