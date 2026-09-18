{{ config(materialized='incremental', unique_key='interaction_id') }}

select interaction_id, client_id, interaction_at, channel, outcome
from {{ ref('stg_interactions') }}
{% if is_incremental() %}
where interaction_at > (select coalesce(max(interaction_at), '1900-01-01') from {{ this }})
{% endif %}
