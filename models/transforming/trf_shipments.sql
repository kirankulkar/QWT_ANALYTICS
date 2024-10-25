{{ config(materialized='table' ,schema = env_var('DBT_TRANSFORMING','TRANSFORMING'))}}

select 
sh.orderid,
sh.shipmentdate,
sh.status,
sp.companyname
 from {{ref('shipment_snapshot')}} sh
 inner join {{ref('shippers')}} sp
 on sp.ShipperID=sh.ShipperID
where sh.DBT_VALID_TO is null