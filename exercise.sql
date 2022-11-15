CREATE DATABASE adlister_exercise_db;
USE adlister_exercise_db;
CREATE TABLE users (
       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
       email VARCHAR(255) NOT NULL UNIQUE,
       username VARCHAR(35) NOT NULL UNIQUE,
       password VARCHAR(100) NOT NULL,
       PRIMARY KEY (id)
);
INSERT INTO users (email, username, password) VALUES
                                                  ('email1@email.com', 'username1', 'dumbopass'),
                                                  ('email2@email.com', 'username2', 'dumbopass'),
                                                  ('email3@email.com', 'username3', 'dumbopass');
CREATE TABLE ads (
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     title VARCHAR(255) NOT NULL,
                     description VARCHAR(10000) NOT NULL,
                     user_id INT UNSIGNED NOT NULL,
                     PRIMARY KEY (id),
                     FOREIGN KEY (user_id) REFERENCES users (id)
);
CREATE TABLE categories (
                            id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                            name VARCHAR(35) NOT NULL,
                            PRIMARY KEY (id)
);
CREATE TABLE ads_categories (
                                id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                ad_id INT UNSIGNED NOT NULL,
                                category_id INT UNSIGNED NOT NULL,
                                PRIMARY KEY (id),
                                FOREIGN KEY (ad_id) REFERENCES ads (id),
                                FOREIGN KEY (category_id) REFERENCES categories (id)
);
INSERT INTO categories (name) VALUES
                                  ('Help Wanted'),
                                  ('Missed Connections'),
                                  ('Pets');
INSERT INTO ads (title, description, user_id) VALUES
                                                  ('Get this dog outta here', 'please take my dog', 1),
                                                  ('HELP', 'I''ve fallen and I can''t get up!', 3),
                                                  ('Saw redhead in HEB parking lot on blank street', 'This isn''t creepy at all! I just saw you walking to your car. Message me with the color shirt you were wearing', 2);
INSERT INTO ads_categories (ad_id, category_id) VALUES
                                                    (1, 3),
                                                    (1, 2),
                                                    (2, 1),
                                                    (3, 2),
                                                    (2, 2);

SELECT * FROM users;
SELECT * FROM categories;
SELECT * FROM ads;
SELECT * FROM ads_categories;

SELECT email AS query_1 FROM users WHERE id IN (SELECT ad_id FROM ads_categories WHERE ad_id = 3);

SELECT name FROM categories WHERE id IN (SELECT id FROM ads);

SELECT name FROM categories WHERE id IN (SELECT category_id FROM ads_categories WHERE ad_id = 2);

SELECT * FROM ads WHERE id IN (SELECT category_id FROM ads_categories WHERE ad_id = 3);

SELECT title, description FROM ads WHERE id IN (SELECT id FROM ads WHERE user_id = 1);



