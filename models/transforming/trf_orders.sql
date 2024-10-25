{{ config(materialized='table' ,schema = env_var('DBT_TRANSFORMING','TRANSFORMING'))}}

select 
o.ORDERID, o.ORDERDATE, 
month(o.orderdate) as ordermonth,
year(o.orderdate) as orderyear,
o.CUSTOMERID, o.EMPLOYEEID, o.SHIPPERID, o.FREIGHT,
LINENO, od.PRODUCTID, od.QUANTITY, od.UNITPRICE, od.DISCOUNT,
(od.UnitPrice * od.Quantity) * (1-od.Discount) as LineSalesAmount,
p.UnitCost * od.Quantity as CostOfGoodsSold,
((od.UnitPrice * od.Quantity)* (1-od.Discount)) - (p.UnitCost* od.Quantity) as margin
 from {{ref('stg_orders')}} o
 inner join {{ref('stg_order_details')}} od
 on o.orderid=od.orderid
 inner join {{ref('stg_products')}} p
 on p.PRODUCTID=od.PRODUCTID
