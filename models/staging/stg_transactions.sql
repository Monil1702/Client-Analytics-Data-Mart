select
    trim(transaction_id) as transaction_id,
    trim(account_id) as account_id,
    cast(transaction_date as date) as transaction_date,
    lower(trim(transaction_type)) as transaction_type,
    cast(amount as numeric(18, 2)) as amount
from {{ ref('raw_transactions') }}
