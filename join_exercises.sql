USE join_test_db;
# ######################################################
# EXERCISE PORTION
# PART 1
USE join_test_db;

CREATE TABLE departments (
                             dept_no INT UNSIGNED NOT NULL AUTO_INCREMENT,
                             dept_name VARCHAR(100) NOT NULL,
                             PRIMARY KEY (dept_no)
);
INSERT INTO departments (dept_name) VALUES
                                        ('human resources'),
                                        ('finance'),
                                        ('sales');

CREATE TABLE employees (
                           emp_no INT UNSIGNED NOT NULL AUTO_INCREMENT,
                           first_name VARCHAR(255),
                           last_name VARCHAR(255),
                           email VARCHAR(100) NOT NULL,
                           PRIMARY KEY (emp_no)
);
INSERT INTO employees (emp_no, first_name, last_name, email) VALUES
                                                                 (10001,'Jason', 'Merrell', 'jason.merrell@codeup.com'),
                                                                 (10002,'Kelly', 'Clarkson', 'kelly@clarkson.com'),
                                                                 (10003,'Billy', 'Bob', 'billy@bob.com'),
                                                                 (10004,'Ariana', 'Grande', 'ariana@grande.com');

CREATE TABLE dept_emp (
                          dept_no INT UNSIGNED NOT NULL,
                          emp_no INT UNSIGNED NOT NULL,
                          from_date DATE NOT NULL,
                          to_date DATE NOT NULL,
                          FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
                          FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
INSERT INTO dept_emp (dept_no, emp_no, from_date, to_date) VALUES
                                                               (1, 10001, '2008-01-01', '2011-12-31'),
                                                               (1, 10001, '2012-01-01', '9999-01-01');

DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE roles;
SHOW TABLES;



# Test SELECT user
SELECT CONCAT(employee.first_name, ' ', employee.last_name) AS full_name, department_emp.dept_no
FROM employees as employee
         JOIN dept_emp as department_emp
              ON department_emp.emp_no = employee.emp_no
         JOIN departments as department
              ON department.dept_no = department_emp.dept_no
WHERE department_emp.to_date = '9999-01-01' AND employee.emp_no = 10001;


SHOW DATABASES;
USE employees;
SHOW TABLES;
DESC titles;

# PART 2

USE employees;
SHOW TABLES;

DESC dept_manager;
SELECT * FROM dept_manager; # emp_no & dept_no



DESC titles;

#     First column Department Name
    SELECT * FROM departments;

SELECT * , dept_name AS 'Department Name' FROM departments;

SELECT *, emp_no, CONCAT(first_name,', ', last_name) FROM employees;




SELECT * FROM dept_manager;

# Need to get emp_no from both employees and dept_manager
SELECT emp_no FROM dept_manager;
SELECT emp_no FROM employees;


# EXAMPLE
SELECT CONCAT(employee.first_name, ' ', employee.last_name) AS full_name, department_emp.dept_no
FROM employees as employee
         JOIN dept_emp as department_emp
              ON department_emp.emp_no = employee.emp_no
         JOIN departments as department
              ON department.dept_no = department_emp.dept_no
WHERE department_emp.to_date = '9999-01-01' AND employee.emp_no = 10001;

# A working version with no aliases
SELECT dept_name AS 'DEPARTMENT', CONCAT(first_name,', ', last_name) AS 'DEPARTMENT MANAGER'
    FROM employees
    JOIN dept_manager
        ON dept_manager.emp_no = employees.emp_no
    JOIN departments
        ON departments.dept_no = dept_manager.dept_no
    WHERE  dept_manager.to_date LIKE '%9999%' ORDER BY DEPARTMENT;

# WORKS with aliases
SELECT dept_name AS 'DEPARTMENT', CONCAT(first_name,', ', last_name) AS 'DEPARTMENT MANAGER'
         FROM employees AS e
         JOIN dept_manager AS dm
              ON dm.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = dm.dept_no
WHERE  (dm.to_date LIKE '%9999%' AND e.gender = 'F') ORDER BY DEPARTMENT;


SELECT dept_name AS 'DEPARTMENT', CONCAT(first_name,', ', last_name) AS 'DEPARTMENT MANAGER'
FROM employees AS e
         JOIN dept_manager AS dm
              ON dm.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = dm.dept_no
WHERE  (dm.to_date LIKE '%9999%' AND e.gender = 'F') ORDER BY DEPARTMENT;

SELECT title FROM titles;

SELECT * FROM titles;

SELECT * FROM titles; # This has emp_no
SELECT * FROM employees; # This has emp_no
SELECT * FROM departments; # This has dept_no
SELECT * FROM dept_emp; # This has emp_no and dept_no



# Need to link the titles with the

SELECT title, COUNT(*) AS Total FROM titles
    JOIN employees
        ON titles.emp_no = employees.emp_no
    JOIN dept_emp
        ON employees.emp_no = dept_emp.emp_no
    WHERE (dept_no = 'd009' AND dept_emp.to_date LIKE '999%' AND titles.to_date LIKE '999%')
    GROUP BY title ORDER BY Total DESC;

# Find the current salary of all current managers
# Department Name | Department Manager | Salary
# titles.title    |

SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name,', ', e.last_name) AS 'Department Manager',
       s.salary
FROM salaries s JOIN employees.employees e ON s.emp_no = e.emp_no
    JOIN dept_manager dm on e.emp_no = dm.emp_no
    JOIN departments d on dm.dept_no = d.dept_no
WHERE dm.to_date LIKE '9%' AND s.to_date LIKE '9%'
    ORDER BY d.dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name .



SELECT title AS title, COUNT(*) AS Total FROM titles
    JOIN employees AS emp
        ON emp.emp_no = titles.emp_no
    JOIN dept_emp AS useMe
        ON emp.emp_no = useMe.emp_no
    JOIN departments AS deps
        ON useMe.dept_no = deps.dept_no

    WHERE deps.dept_no = 'd009' GROUP BY title;

# EXERCISE PORTION
# ######################################################