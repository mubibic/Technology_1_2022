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

CREATE TABLE actors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255)
);

CREATE TABLE actors_movies (
    actors_id INT,
    movies_id INT,
    FOREIGN KEY (actors_id) REFERENCES actors(id),
    FOREIGN KEY (movies_id) REFERENCES movies(id)

);

SELECT first_name, title, m.year
FROM movies m
INNER JOIN actors_movies am on m.id = am.movies_id
INNER JOIN actors a on am.actors_id = a.id;


CREATE TABLE production_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255)
);

INSERT INTO production_teams (team_name)
VALUES ('team cool'),
       ('team turtles');

CREATE TABLE movies_productions_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    production_team_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (production_team_id) REFERENCES production_teams(id)
);

INSERT INTO movies_productions_teams (movie_id, production_team_id)
VALUES (1, 2);

DELETE FROM production_teams
WHERE id = 1;

SHOW TABLES;
# DATABASES, TABLES, COLUMNS   vs. DATA (in ROWS)
# DDl = structure of database  vs. DML  = data manipulation
# Data Definition Language     vs. Data Manipulation Language