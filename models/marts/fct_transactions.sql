{{ config(materialized='incremental', unique_key='transaction_id') }}

select transaction_id, account_id, transaction_date, transaction_type, amount
from {{ ref('stg_transactions') }}
{% if is_incremental() %}
where transaction_date > (select coalesce(max(transaction_date), '1900-01-01') from {{ this }})
{% endif %}
