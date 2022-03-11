show tables;
# comment
-- comment
/* comment */

#PascalCase
#snake_case


/* creates a table in movies, also called movies that has a column called title */
create table movies(
    title VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS movies(
    title varchar(255) NOT NULL
);

ALTER TABLE movies
    ADD COLUMN id INT primary key AUTO_INCREMENT UNIQUE;




ALTER TABLE movies
DROP COLUMN id;

ALTER TABLE movies ADD COLUMN year YEAR NOT NULL AFTER title;

ALTER TABLE movies DROP COLUMN year;

ALTER TABLE movies
MODIFY COLUMN year INT(4);

CREATE TABLE directors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    movie_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

DROP TABLE directors;




SHOW TABLES;
# DATABASES, TABLES, COLUMNS   vs. DATA (in ROWS)
# DDl = structure of database  vs. DML  = data manipulation
# Data Definition Language     vs. Data Manipulation Language