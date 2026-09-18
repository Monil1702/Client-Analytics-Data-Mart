select
    account_id,
    sum(case when transaction_type = 'deposit' then amount else 0 end) as total_deposits,
    sum(case when transaction_type = 'withdrawal' then amount else 0 end) as total_withdrawals,
    sum(case when transaction_type = 'deposit' then amount else -amount end) as net_flow
from {{ ref('stg_transactions') }}
group by account_id
