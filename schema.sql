-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE Employees (
     emp_no int NOT NULL,
	 birth_date DATE NOT NULL,
	 last_name VARCHAR,
     gender VARCHAR(10),
	 hire_date DATE, 
     PRIMARY KEY (emp_no),
     UNIQUE (birth_date)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
SELECT * FROM departments

