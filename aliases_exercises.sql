# 2. Use the employees database.
USE employees;

# 3. Return 10 employees in a result set named 'full_name' in the format of 'last name, first name' for each employee.
SELECT CONCAT(last_name,' ', first_name) AS 'full_name' FROM employees LIMIT 10;

# 4. Add the date of birth for each employee as 'DOB' to the query.
SELECT CONCAT(last_name,' ', first_name) AS 'full_name', birth_date FROM employees LIMIT 10;

# 5. Return 10 employees in a result set named 'full_name' in the format of 'last name, first name' for each employee.
SELECT CONCAT(emp_no, ' - ',  last_name,',', ' ', first_name) AS 'full_name', birth_date AS DOB FROM employees LIMIT 10;