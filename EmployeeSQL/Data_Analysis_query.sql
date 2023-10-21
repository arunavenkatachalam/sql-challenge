select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles

--DATA ANALYSIS
--List the employee number, last name, first name, sex, and salary of each employee
select employees.emp_no,last_name,first_name,sex,salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name,last_name,hire_date
from employees
where extract(year from hire_date) = 1986;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name
select departments.dept_no,
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from departments
join dept_emp
on dept_emp.dept_no = departments.dept_no
join employees
on  employees.emp_no = dept_emp.emp_no
join titles
on employees.emp_title_id = titles.title_id
where titles.title = 'Manager'
group by departments.dept_no,employees.emp_no;

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name
select employees.emp_no,
departments.dept_no,
employees.last_name,
employees.first_name,
departments.dept_name
from departments
join dept_emp
on dept_emp.dept_no = departments.dept_no
join employees
on  employees.emp_no = dept_emp.emp_no
join titles
on employees.emp_title_id = titles.title_id;

--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B
select first_name,
last_name,
sex
from employees
where first_name = 'Hercules' and last_name LIKE 'B%';

--List each employee in the Sales department, 
--including their employee number, last name, and first name
select 
employees.emp_no,
employees.last_name,
employees.first_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on  dept_emp.dept_no = departments.dept_no
join titles
on employees.emp_title_id = titles.title_id
where departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments,
--including their employee number, last name, first name, and department name
select 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on  dept_emp.dept_no = departments.dept_no
join titles
on employees.emp_title_id = titles.title_id
where departments.dept_name = 'Sales' and departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)
select last_name,
count(last_name) As Last_Name_Count
from employees
group by last_name
order by Last_Name_Count desc;
