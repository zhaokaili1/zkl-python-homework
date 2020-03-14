-- LINK : Employee_management
-- 2.1 Select the last name of all employees.
SELECT lastname from employees;

-- 2.2 Select the last name of all employees, without duplicates.
SELECT distinct lastname from employees;

-- 2.3 Select all the data of employees whose last name is "Smith".
SELECT * from employees where lastname='Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * from employees where lastname in('Smith','Doe');

-- 2.5 Select all the data of employees that work in department 14.
SELECT * from employees where department=14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * from employees where department in(37, 77);

-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT * from employees where lastname like 'S%';

-- 2.8 Select the sum of all the departments' budgets.
SELECT sum(budget) from departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT count(*), code from departments d left join  employees e on d.code=e.department group by code;

-- 2.10 Select all the data of employees, including each employee's department's data.
SELECT e.*, d.* from employees e join departments d on e.department=d.code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT e.name, lastname, d.name, budget from employees e join departments d on e.department=d.code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT e.name, lastname from employees e join departments d on e.department=d.code where budget >60000;

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
SELECT code, name from departments where budget>(SELECT avg(budget) from departments);

-- 2.14 Select the names of departments with more than two employees.
SELECT d.name, count(*) from departments d join employees e on d.code=e.department group by code having count(*)>2;

-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
SELECT e.name, lastname, budget from employees e join departments d on e.department=d.code order by budget limit 1 offset 1; 

-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
INSERT into departments(code,name,budget) values(11,'Quality Assurance',40000);

-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into employees(ssn,name,lastname,department) values(847219811,'Mary','Moore',11);

-- 2.17 Reduce the budget of all departments by 10%.
update departments set budget = budget * 0.9;

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employees set department=14 where department=77;

-- 2.19 Delete from the table all employees in the IT department (code 14).
DELETE from employees where department=14;

-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employees where ssn in(SELECT ssn from departments d join employees e on d.code=e.department where budget>=60000);

-- 2.21 Delete from the table all employees.
DELETE from employees;
