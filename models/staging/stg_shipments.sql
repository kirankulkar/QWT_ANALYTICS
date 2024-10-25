{{ config(materialized='table', schema = env_var('DBT_STAGESCHEMA','STAGING') )}}

with shipments as (
select OrderID,
LineNo,
ShipperID,
CustomerID,
ProductID,
EmployeeID,
substr(ShipmentDate,1,REGEXP_INSTR( ShipmentDate, ' ')) as ShipmentDate,
Status from {{ source('qwt_src', 'shipments') }}
)

select * from shipments