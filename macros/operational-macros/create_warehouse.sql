{% macro create_wh(role) %}
{% set sql %}
    create warehouse temp_wh;
{% endset %}

{% do run_query(sql) %}
{% do log("warehouse created", info=True) %}
{% endmacro %}
