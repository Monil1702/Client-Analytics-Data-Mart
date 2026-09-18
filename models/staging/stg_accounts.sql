select
    trim(account_id) as account_id,
    trim(client_id) as client_id,
    lower(trim(account_type)) as account_type,
    lower(trim(status)) as status,
    cast(opened_at as date) as opened_at,
    cast(current_balance as numeric(18, 2)) as current_balance
from {{ ref('raw_accounts') }}
