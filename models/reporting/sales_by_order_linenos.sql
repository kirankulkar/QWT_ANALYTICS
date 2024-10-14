{{config(materialised='view', schema='reporting')}}

{% set order_linenumbers= get_linenos() %}
select
orderid,
{% for linenumbers in order_linenumbers %}
sum(case when lineno = '{{linenumbers}}' then LINESALESAMOUNT end) as lineno{{linenumbers}}_amount,
{% endfor %}
sum(LINESALESAMOUNT) as total_amount
from {{ ref('fct_orders') }}
group by 1
