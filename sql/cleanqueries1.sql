select employee.id AS employee_id, concat(employee.first_name, ' ', employee.last_name) 
AS employee_full_name, department.id AS department_id, department.name AS last_department_name 
from employee employee inner join ( select der.employee_id, max(der.id) AS max_id 
from department_employee_rel der where der.deleted_flag = 0 group by der.employee_id ) 
derm ON derm.employee_id = employee.id 
inner join department_employee_rel der ON der.id = derm.max_id 
and der.deleted_flag = 0 
inner join department department ON department.id = der.department_id 
and department.deleted_flag = 0 where employee.id IN 
(10010, 10040, 10050, 91050, 205357) and employee.deleted_flag = 0 limit 100; 