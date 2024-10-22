{{config(materialised='view', schema='reporting')}}

select
DC.companyname, DC.contactname , DC.city,min(orderdate) as first_order_date, max(orderdate) as recent_order_date,
count(orderid) as total_orders, sum(FO.linesalesamount) as total_sales
from {{ref("dim_customer")}} DC
inner join {{ref("fct_orders")}} FO
on FO.customerid=DC.customerid
group by 1,2,3