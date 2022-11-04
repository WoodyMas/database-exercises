USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
   id INT NOT NULL AUTO_INCREMENT,
   artist VARCHAR(25) NOT NULL,
   name VARCHAR(25) NOT NULL ,
   release_date INT(4),
   sales FLOAT(7),
   genre VARCHAR(25),

   PRIMARY KEY (id)
);