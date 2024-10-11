{{ config(materialized='table' ,schema='transforming')}}

select 
CUSTOMERID, COMPANYNAME, CONTACTNAME, CITY, COUNTRY, c.DIVISIONID,d.DIVISIONNAME, ADDRESS, FAX, PHONE, POSTALCODE, 
IFF(STATEPROVINCE='','NA',STATEPROVINCE) as STATEPROVINCE
 from {{ref('stg_customers')}} c
 inner join {{ref('divisions')}} d 
 on c.DIVISIONID=d.DIVISIONID
