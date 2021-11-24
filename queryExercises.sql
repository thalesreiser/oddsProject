-- Inicialização do banco de dados

use odds;
-- Write a query to display the name (first_name and last_name) and department ID of all
-- employees in departments 30 or 100 in ascending order.

select e.FIRST_NAME, e.LAST_NAME, e.DEPARTMENT_ID from employees e, departments d
	where e.DEPARTMENT_ID = d.DEPARTMENT_ID 
    and d.DEPARTMENT_ID>29 
    and d.DEPARTMENT_ID<101;
    
-- Write a query to find the manager ID and the salary of the lowest-paid employee for that
-- manager.

select min(e.SALARY), e.LAST_NAME, e.MANAGER_ID from employees e
	where e.MANAGER_ID <> 0;

-- Write a query to find the name (first_name and last_name) and the salary of the employees
-- who earn more than the employee whose last name is Bell.

select e.FIRST_NAME, e.LAST_NAME, e.SALARY from employees e
where e.SALARY > 
(select e.SALARY from employees e where e.LAST_NAME = 'Bell');

-- Write a query to find the name (first_name and last_name), job, department ID and name of
-- all employees that work in London.

select e.FIRST_NAME, e.LAST_NAME, e.JOB_ID, e.DEPARTMENT_ID, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e
join departments d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
join locations l on
(d.LOCATION_ID = l.LOCATION_ID)
where lower(l.CITY) = 'LONDON'; 

-- Write a query to get the department name and number of employees in the department.

select d.DEPARTMENT_NAME, count(*) as 'Número de empregados'
from departments d
inner join employees e
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME
order by d.DEPARTMENT_NAME;