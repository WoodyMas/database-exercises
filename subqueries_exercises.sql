
USE employees;
# 1.
# Find all the employees with the same hire date as employee 101010 using a subquery.
# 69 Rows
# SELECT birth_date FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_manager);

# Question 1 complete
SELECT * FROM employees WHERE hire_date IN (SELECT hire_date FROM employees WHERE emp_no = 101010);

# 2.
# Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles

SELECT * FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod');
SELECT DISTINCT title FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod');
# Question 2 complete

# 3.
# Find all the current department managers that are female.
SELECT first_name, last_name FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE gender = 'F' AND to_date LIKE '9999%');

SELECT first_name, last_name FROM employees WHERE gender = 'F' AND emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date LIKE '9999%');

# Question 3 complete

################################################### BONUS ###########################################################
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT MAX(salary) FROM salaries;



# 1.
# Find all the department names that currently have female managers.
SELECT dept_name FROM departments
                 WHERE dept_no
                 IN (
                 SELECT dept_no FROM dept_manager dm
                 JOIN employees e
                    ON dm.emp_no = e.emp_no
                    WHERE e.gender = 'F' AND dm.to_date LIKE '999%'
                    )
                 ORDER BY dept_name;
;
# Bonus question 1 complete

# 2.
# Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name FROM employees WHERE emp_no IN (
    SELECT emp_no FROM salaries WHERE salary = 158220
    );
# Bonus question 2 solved but not in a way I'd prefer. Line 51's salary clause was determined using a query on line 30.
SELECT first_name, last_name FROM employees WHERE emp_no IN (
    SELECT emp_no FROM salaries WHERE (salary IN (SELECT MAX(salary) FROM salaries))
);


