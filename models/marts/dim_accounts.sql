select account_id, client_id, account_type, status, opened_at, current_balance
from {{ ref('stg_accounts') }}
