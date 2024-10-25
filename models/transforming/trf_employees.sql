{{ config(materialized='table' ,schema='transforming')}}

select E1.EMPID,concat(E1.First_NAME,' ',E1.Last_NAME) as EMP_NAME,E1.TITLE as Employee_Title,E1.Hire_date,OFF.Officeaddress as office_address,OFF.Officecity as office_city,OFF.officecountry as office_country, concat(E2.First_NAME,' ',E2.Last_NAME) as Manager_NAME,E2.TITLE as manager_Title, E1.YEARLY_SALARY as Emp_Sal
from {{ref('stg_employees')}} E1
left join {{ref('stg_employees')}}  E2
on E2.EMPID=E1.REPORTS_TO
left join {{ref('stg_offices')}}  OFF
on E1.office=off.office
