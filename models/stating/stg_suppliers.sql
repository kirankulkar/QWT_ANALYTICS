{{ config(materialized='table' )}}

with suppliers as (
select * from {{ source('qwt_src', 'suppliers') }}
)

select * from suppliers