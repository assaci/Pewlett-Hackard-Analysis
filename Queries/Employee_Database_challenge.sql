---Retrieve the emp_no, first_name, and last_name columns from the Employees table.					 
SELECT emp_no, first_name, last_name
FROM employees
					 
--Retrieve the title, from_date, and to_date columns from the Titles table.				 
SELECT title, from_date, to_date
FROM titles					 
--Create a new table using the INTO clause
					 
--Join both tables on the primary key.
					 
SELECT employees.emp_no,
	employees.first_name,
	 employees.last_name,
	 titles.title,
     titles.from_date,
     titles.to_date					 
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no;

SELECT employees.emp_no,
	employees.first_name,
	 employees.last_name,
	 titles.title,
     titles.from_date,
     titles.to_date					 
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no					 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;
					 
SELECT *FROM retirement_titles; 
				 
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
SELECT emp_no, first_name, last_name, title
FROM retirement_titles					 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO nameyourtable
FROM retirement_titles
ORDER BY emp_no, title DESC;	

SELECT * FROM nameyourtable; 
--Create a Unique Titles table using the INTO clause.
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC
SELECT * FROM unique_titles;	
					 
--Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(unique_titles.emp_no), unique_titles.title
INTO retiring_titles					 
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY unique_titles.count DESC;	
--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no, first_name, last_name, birth_date
FROM employees					 
--Retrieve the from_date and to_date columns from the Department Employee table					 
SELECT from_date, to_date
FROM dept_emp	
--Retrieve the title column from the Titles table.
SELECT title
FROM titles	
--retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.				 
SELECT DISTINCT ON (______) _____,
______,
______,
______
---Create a new table using the INTO clause.
INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;
--Join the Employees and the Department Employee tables on the primary key.
SELECT employees.emp_no,
	employees.first_name,
	 employees.last_name,
	 employees.birth_date,				 
	 dept_emp.from_date,
     dept_emp.to_date					 
INTO emp_dept_emp
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no					 
ORDER BY emp_no;					 
SELECT * FROM emp_dept_emp;					 
--Join the Employees and the Titles tables on the primary key.
SELECT emp_dept_emp.emp_no,
	emp_dept_emp.first_name,
	 emp_dept_emp.last_name,
	 emp_dept_emp.birth_date,				 
	 emp_dept_emp.from_date,
     emp_dept_emp.to_date,
	 titles.title
INTO mentorship_eligibilty					 
FROM emp_dept_emp
INNER JOIN titles
ON emp_dept_emp.emp_no = titles.emp_no
WHERE emp_dept_emp.to_date = '9999-01-01'					 
AND birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;									 
SELECT * FROM mentorship_eligibilty; 