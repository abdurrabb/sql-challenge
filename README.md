# sql-challenge

## DESIGNING THE DATABASE WITH ERD
- Creating the tables was straightforward. Using the graphic user interface to connect the columns. This resulted in the website guessing what type of connection.
- With each csv open in Atom (a text editor), I adjusted incorrect connection types.


## CREATING TABLES
- I exported a PostgreSQL file from the QDB site. Then, uploaded that file to Atom. 
- From there I copied and pasted the contents into pgAdmin. 


## IMPORT DATABASES
- Importing data revealed some key errors. It stated: 
    - ERROR: duplicate key value violates unique constraint "pk_dept_emp"
    - DETAIL:  Key (emp_no)=(10010) already exists.
    - CONTEXT:  COPY dept_emp, line 12dept_emp and dept_manager required composite keys."

- Another error appeared in multiple tables; emp_no was designated as INT, but a letter. So, I changed each one VARCHAR, then recreated the table. With that, the imports went smoothly.


## LIST EMPLOYEE DETAILS
- This query uses a join since the requested data exists in two separate table. I joined on emp_no as both tables included this data and each emp_no represented an individual employee:
    SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
    FROM employees e
    JOIN salaries s
    ON (e.emp_no = s.emp_no);

## LIST DETAILS ON 1986 EMPLOYEES



## LIST MANAGER DETAILS



## LIST DEPARTMENT EMPLOYEE DETAILS



## LIST HERCULES DETAILS



## LIST SALES DEPARTMENT EMPLOYEES



## LIST SALES AND DEPARTMENT EMPLOYEES 



## LIST FREQUENCY COUNT


## Submission

* Create an image file of your ERD.

* Create a `.sql` file of your table schemata.

* Create a `.sql` file of your queries.

* (Optional) Create a Jupyter Notebook of the bonus analysis.

* Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

* Ensure your repository has regular commits (i.e. 20+ commits) and a thorough README.md file