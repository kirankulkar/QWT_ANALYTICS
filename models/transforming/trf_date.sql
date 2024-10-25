{{ config(materialized='table' ,schema = env_var('DBT_TRANSFORMING','TRANSFORMING'))}}

{% set var_min_order_dt = get_min_order_dt()%}

{% set var_max_order_dt = get_max_order_dt()%}

{{ dbt_date.get_date_dimension(var_min_order_dt, var_max_order_dt) }}
