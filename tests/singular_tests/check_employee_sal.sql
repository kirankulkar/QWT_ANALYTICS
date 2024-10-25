select count(1)
from {{ref("stg_employees")}}
where YEARLY_SALARY>150000