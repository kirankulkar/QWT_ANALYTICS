{{ config(materialized='table' )}}

with offices as (
select * from {{ source('qwt_src', 'offices') }}
)

select * from offices