select account_id
from {{ ref('dim_accounts') }}
where current_balance < 0
