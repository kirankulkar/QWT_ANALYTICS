{{ config(materialized='table' )}}

with products as (
select * from {{ source('qwt_src', 'products') }}
)

select * from products