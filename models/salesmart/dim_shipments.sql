{{config( materialised='view', schema='salesmart')}}

select * from {{ref("trf_shipments")}}