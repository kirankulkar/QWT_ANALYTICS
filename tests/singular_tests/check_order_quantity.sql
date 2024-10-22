select count(1)
from {{ref("stg_order_details")}}
where quantity>70