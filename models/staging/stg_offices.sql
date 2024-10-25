{{ config(materialized = 'table', schema = env_var('DBT_STAGESCHEMA','STAGING') ) }}
 
with offices as (
select * from {{ source('qwt_src', 'offices') }}
)

select * from offices