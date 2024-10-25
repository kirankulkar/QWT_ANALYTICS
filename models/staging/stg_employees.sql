{{ config(materialized = 'table', schema = env_var('DBT_STAGESCHEMA','STAGING')) }}
 
with employees as (
select * from {{ source('qwt_src', 'employees') }}
)

select * from employees