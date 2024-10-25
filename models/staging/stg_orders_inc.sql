{{config (materialized='incremental',unique_key='orderid', schema = env_var('DBT_STAGESCHEMA','STAGING'))}}

select * from {{ source('qwt_src', 'orders') }}
{% if is_incremental() %}

    where orderdate > (select max(orderdate) from {{ this }})

{% endif %}
