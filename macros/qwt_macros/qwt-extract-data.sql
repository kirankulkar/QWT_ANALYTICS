{% macro get_linenos() %}

{% set extract_linenos_query %}
select distinct
lineno
from {{ ref('fct_orders') }}
order by 1
{% endset %}

{% set results = run_query(extract_linenos_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}


{% macro get_min_order_dt() %}

{% set get_min_order_dt_query %}
select min(orderdate)
from {{ ref('fct_orders') }}
{% endset %}

{% set results = run_query(get_min_order_dt_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}

{% macro get_max_order_dt() %}

{% set get_max_order_dt_query %}
select max(orderdate)+1
from {{ ref('fct_orders') }}
{% endset %}

{% set results = run_query(get_max_order_dt_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}