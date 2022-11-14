# Subqueries

USE employees;

SELECT birth_date FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_manager);

SELECT * FROM employees;

SELECT emp_no FROM dept_manager;

USE codeup_test_db;
SHOW TABLES;

DESC persons;
SELECT * FROM persons;

DESC preferences;
SELECT * FROM preferences;

DESC albums;

SELECT id FROM albums WHERE album_name = 'Led Zeppelin IV';



INSERT INTO preferences (person_id, album_id) VALUES ((SELECT person_id FROM persons WHERE first_name = 'Tareq'), (SELECT id FROM albums WHERE album_name = 'Led Zeppelin IV'));