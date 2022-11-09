USE employees;

SHOW TABLES;


SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e';

# Find all employees born on Christmas — 842 rows.
SELECT CONCAT(first_name,' ', last_name) AS name, birth_date FROM employees WHERE birth_date LIKE '%12-25';

# Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT CONCAT(first_name,' ', last_name) AS name, birth_date ,hire_date FROM employees
        WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%';

# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT CONCAT(first_name,' ', last_name) AS name, birth_date ,hire_date FROM employees
        WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%' ORDER BY hire_date DESC;

# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).
SELECT CONCAT(first_name,' ', last_name) AS name, birth_date ,hire_date, DATEDIFF(NOW(), hire_date) AS daysInCompany FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%';

# SELECT DATEDIFF(NOW(), hire_date) FROM employees WHERE emp_no = 10006;


# Working

#2
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;

#3
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;

#4
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;

#5
SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no;

#6
SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no DESC;

SELECT * FROM employees WHERE last_name LIKE '%q%'
                          AND last_name NOT LIKE '%qu%' ORDER BY last_name;