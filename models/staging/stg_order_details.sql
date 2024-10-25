{{config (materialized='incremental',unique_key=['orderid','lineno'], schema = env_var('DBT_STAGESCHEMA','STAGING'))}}

select OD.*,o.orderdate from {{ source('qwt_src', 'order_details') }} as OD inner join {{ source('qwt_src', 'orders') }} as O 
on OD.orderid=O.orderid
{% if is_incremental() %}

    where orderdate > (select max(orderdate) from {{ this }})

{% endif %}
