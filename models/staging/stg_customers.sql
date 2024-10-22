{{ config(materialized='table' )}}

with customers as (
select * from {{ source('qwt_src', 'customers') }}
)

select * from customers