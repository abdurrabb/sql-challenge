# sql-challenge

## DESIGNING THE DATABASE WITH ERD
Creating the tables was straightforward. Using the graphic user interface to connect the columns. This resulted in the website guessing what type of connection. With each csv open in Atom (a text editor), I adjusted incorrect connection types.


## CREATING TABLES
I exported a PostgreSQL file from the QDB site. Then, uploaded that file to Atom. From there I copied and pasted the contents into pgAdmin. 


## IMPORT DATABASES
Importing data revealed some key errors. It stated: 
    - ERROR: duplicate key value violates unique constraint "pk_dept_emp"
    - DETAIL:  Key (emp_no)=(10010) already exists.
    - CONTEXT:  COPY dept_emp, line 12dept_emp and dept_manager required composite keys."

Another error appeared in multiple tables; emp_no was designated as INT, but a letter. So, I changed each one VARCHAR, then recreated the table. With that, the imports went smoothly.


## LIST EMPLOYEE DETAILS
This query uses a join since the requested data exists in two separate table. I joined on emp_no as both tables included this data and each emp_no represented an individual employee:

    SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
    FROM employees e
    JOIN salaries s
    ON (e.emp_no = s.emp_no);


## LIST DETAILS ON 1986 EMPLOYEES
This query taught me the limitations of LIKE operator. Since 1986 is a date format, I had to find another way to query a subset of the hire_date column. Thankfully, my google skills have improved alongside my coding chops. According to StackO (StackOverflow.com), I needed to CAST the date type to TEXT:
   
    SELECT first_name, last_name, hire_date
    FROM employees
    WHERE CAST(hire_date As TEXT) LIKE '1986%';


## LIST MANAGER DETAILS
This query called for lots of pseudo-coding.  Five pieces of data from three different tables in one query. After regrouping the data points into their tables, I traced foreign key relationships that could tie them together again:
    
    SELECT e.emp_no, e.emp_title_id, e.first_name, e.last_name, d.dept_name
    FROM employees e
    JOIN departments d
    ON e.emp_title_id = d.dept_no;

This returned the column headers, but no data!? Multiple reasons this didn't work:

1. the emp_no in employees is set as VARCHAR when it should be INT
2. employees.emp_title_id is not equivalent to dept_manager.emp_no

The solution required a LEFT JOIN that privileged data from dept_manager while adding details from employees table. A second join was needed to pull department names from departments table:
    
    SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, p.dept_name
    FROM dept_manager d
    LEFT JOIN employees e
    ON (e.emp_no = d.emp_no)
    INNER JOIN departments p
    ON (p.dept_no = d.dept_no)
    ORDER BY dept_no;


## LIST DEPARTMENT EMPLOYEE DETAILS
The task required relearning how junction tables work. The details requests live in unrelated tables (employees and dept_emp) and require the dept_emp to connect them. Applying an order by allows us to quickly verify employee numbers against the dept_emp table:
    
    SELECT e.emp_no, e.last_name, e.first_name, p.dept_name
    FROM employees e
    JOIN dept_emp  ON dept_emp.emp_no = e.emp_no
    JOIN departments p ON p.dept_no = dept_emp.dept_no
    ORDER BY e.emp_no;


## LIST HERCULES DETAILS
This query required the LIKE operator with the % wildcard. Helpful when you're uncertain of the spelling:
    
    SELECT first_name, last_name, sex
    FROM employees
    WHERE first_name = 'Hercules' AND last_name LIKE 'B%'


## LIST SALES DEPARTMENT EMPLOYEES
This query required multiple joins similar to query 4  and IN condition to search specifically for employees in dept_no d007 'Sales'. This returned 52245 rows:
    
    SELECT d.emp_no, e.first_name, e.last_name, p.dept_name
    FROM dept_emp d
    JOIN departments p
    ON (p.dept_no = d.dept_no)
    JOIN employees e
    ON (e.emp_no = d.emp_no)
    WHERE d.dept_no IN ('d007')
    ORDER BY emp_no;

I verified that the joins had not added more row by verifying the length of the core query. This confirmed that there are 52245 rows of salespeople:
   
    SELECT * FROM dept_emp
    WHERE dept_no = 'd007'
    ORDER BY emp_no;


## LIST SALES AND DEPARTMENT EMPLOYEES 
Nearly identical query 6, this required multiple joins  and IN condition to search specifically for employees in dept_no d007 'Sales' and d005 'Development'. This returned 137952 rows. I confirmed this with a core query:

    SELECT d.emp_no, e.first_name, e.last_name, p.dept_name
    FROM dept_emp d
    JOIN departments p
    ON (p.dept_no = d.dept_no)
    JOIN employees e
    ON (e.emp_no = d.emp_no)
    WHERE d.dept_no IN ('d007','d005')
    ORDER BY emp_no;
   
Verification step

    SELECT * FROM dept_emp
    WHERE dept_no IN ('d007','d005')
    ORDER BY emp_no;


## LIST FREQUENCY COUNT
This query had help from a new resource (c-sharpcorner.com). The big win here was finding the answer in the first google search selection. I selected the last name and a count of the last name and stored the count under alias Frequency. The alias named the column and allowed a simply descending order operation later: 

    SELECT last_name, COUNT(last_name) AS Frequency
    FROM employees
    GROUP BY last_name
    ORDER BY frequency DESC;


## SUBMISSION
* Create an image file of your ERD.

* Create a `.sql` file of your table schemata.

* Create a `.sql` file of your queries.

* (Optional) Create a Jupyter Notebook of the bonus analysis.

* Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

* Ensure your repository has regular commits (i.e. 20+ commits) and a thorough README.md file


## BIG THANKS
Sean (instructor) for patiently walking me through foreign keys

The countless contributors at w3schools.com and postgresqltutorial.com for the thorough guidance on SQL

The many developers and designers at  StackO willing to learn in public. 

My partner for being flexible with the time demands to learn this

My son, Heir, for his enthusiasm and warm smile 
