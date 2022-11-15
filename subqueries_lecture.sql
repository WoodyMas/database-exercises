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

# SELECT email FROM users WHERE user IN (SELECT user_id FROM ads WHERE id = (ad_id))

# We have a given ad, we need the category which is found in categories (name)

SELECT id FROM ads WHERE id IN (SELECT ads_id FROM ads_categories WHERE categories_id)

