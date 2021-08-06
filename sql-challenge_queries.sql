-- Verify data in teach table
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


-- Data Analysis

-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);





-- 2. List first name, last name, and hire date for 
-- employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE CAST(hire_date As TEXT) LIKE '1986%';




-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, p.dept_name
FROM dept_manager d
LEFT JOIN employees e
ON (e.emp_no = d.emp_no)
INNER JOIN departments p
ON (p.dept_no = d.dept_no)
ORDER BY dept_no;



-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, p.dept_name
FROM employees e
JOIN dept_emp  ON dept_emp.emp_no = e.emp_no
JOIN departments p ON p.dept_no = dept_emp.dept_no
ORDER BY e.emp_no;






-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';





-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT d.emp_no, e.first_name, e.last_name, p.dept_name 
FROM dept_emp d
JOIN departments p
ON (p.dept_no = d.dept_no)
JOIN employees e
ON (e.emp_no = d.emp_no)
WHERE d.dept_no IN ('d007')
ORDER BY emp_no;

SELECT * FROM dept_emp
WHERE dept_no = 'd007'
ORDER BY emp_no;



-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT d.emp_no, e.first_name, e.last_name, p.dept_name 
FROM dept_emp d
JOIN departments p
ON (p.dept_no = d.dept_no)
JOIN employees e
ON (e.emp_no = d.emp_no)
WHERE d.dept_no IN ('d007','d005')
ORDER BY emp_no;

SELECT * FROM dept_emp
WHERE dept_no IN ('d007','d005')
ORDER BY emp_no;



-- 8. In descending order, list the frequency count of 
-- employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name 
ORDER BY frequency DESC;

SELECT last_name
FROM employees
WHERE last_name IN ('Scallan');

