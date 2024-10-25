{{ config(materialized='table', schema = env_var('DBT_STAGESCHEMA','STAGING') )}}

with suppliers as (
select * from {{ source('qwt_src', 'suppliers') }}
)

select * from suppliers