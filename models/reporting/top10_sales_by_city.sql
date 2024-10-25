{{config(materialised='view',schema='reporting')}}

select linesalesamount from {{ref('dim_customer')}} dc 
inner join {{ref('fct_orders')}} od
on dc.customerid=od.customerid
where city = '{{var('v_city','Berlin')}}'
order by 1 desc
limit 10