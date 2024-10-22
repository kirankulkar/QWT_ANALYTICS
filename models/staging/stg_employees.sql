{{ config(materialized='table' )}}

with employees as (
select * from {{ source('qwt_src', 'employees') }}
)

select * from employees