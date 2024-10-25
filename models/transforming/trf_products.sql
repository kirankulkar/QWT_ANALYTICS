{{ config(materialized='table' ,schema = env_var('DBT_TRANSFORMING','TRANSFORMING'))}}

select 
productid,
productname,
categoryname,
companyname,
contactname,
city,
quantityperunit,
unitcost,
unitprice,
unitsinstock,
unitsonorder,
iff(unitsinstock-unitsonorder>0, 'Avalable','Not-Available') as productavailability
 from {{ref('stg_products')}} p
 inner join {{ref('trf_suppliers')}} s
 on p.supplierid=s.supplierid
 inner join {{ref("categories")}} c
 on c.categoryid=p.categoryid
