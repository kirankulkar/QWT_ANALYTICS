{{config (materialized='incremental',unique_key='orderid')}}

select * from {{ source('qwt_src', 'orders') }}
{% if is_incremental() %}

    where orderdate > (select max(orderdate) from {{ this }})

{% endif %}
