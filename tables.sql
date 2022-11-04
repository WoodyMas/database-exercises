-- TEST COMMENT

USE codeup_test_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(35) NOT NULL ,
    last_name VARCHAR(65) NOT NULL,
    PRIMARY KEY (user_id)
 );