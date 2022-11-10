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



SELECT CONCAT(employee.first_name, ' ', employee.last_name) AS full_name, department_emp.dept_no
FROM employees as employee
         JOIN dept_emp as department_emp
              ON department_emp.emp_no = employee.emp_no
         JOIN departments as department
              ON department.dept_no = department_emp.dept_no
WHERE department_emp.to_date = '9999-01-01' AND employee.emp_no = 10001;

SELECT dept_name AS 'DEPARTMENT', CONCAT(first_name,', ', last_name) AS 'DEPARTMENT MANAGER'
    FROM employees
    JOIN dept_manager
        ON dept_manager.emp_no = employees.emp_no
    JOIN departments
        ON departments.dept_no = dept_manager.dept_no
    WHERE  dept_manager.to_date LIKE '%9999%' ORDER BY DEPARTMENT;



# EXERCISE PORTION
# ######################################################




SHOW TABLES;

DESCRIBE roles;
DESCRIBE users;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100),
                       can_edit TINYINT NOT NULL,
                       can_post TINYINT NOT NULL,
                       PRIMARY KEY (id)
);

SELECT * FROM roles;
SELECT * FROM users;

INSERT INTO roles (name, can_edit, can_post) VALUES
                      ('admin', 1,1),
                      ('author', 0,1),
                      ('user', 0, 0);

CREATE TABLE users (
                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                      name VARCHAR(255),
                      email VARCHAR(100) NOT NULL,
                      role_id INT UNSIGNED DEFAULT NULL,
                      PRIMARY KEY (id),
                      FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO users (name, email, role_id) VALUES
                      ('Mason Wudtee', 'masonwudtee@wudtee.com', 1),
                      ('Kelly Clarkson', 'kellyclark@son.com', 2),
                      ('Billy Bob', 'billy@bob.com', 2),
                      ('Ariana Grande', 'ariana@grande.com', 3),
                      (null, 'john@cena.com', null);

SELECT users.name as username, roles.name as rolename
FROM users
LEFT JOIN roles ON users.role_id = roles.id;



