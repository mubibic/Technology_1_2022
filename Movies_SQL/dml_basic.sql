# * is a wildcard character, it means ALL

SELECT * FROM movies;

/* CRUD = Create Read Update Delete
 */

 /* Create a new row (that is: add a new movie to the table*/

INSERT INTO movies
VALUES ('Fast and the Furious: Tokyo Drift');

SHOW TABLES;

SELECT * FROM movies;

DELETE FROM movies
WHERE title = 'Fast and the Furious: Tokyo Drift' LIMIT 1;

SELECT * FROM movies WHERE title = 'Fast and Furious: Tokyo Drift' LIMIT 1;

# Update KING KONG to KING v. GODZILLA

INSERT INTO movies VALUES ('King Kong');

UPDATE movies
SET title = 'King Kong vs Godzilla'
WHERE title = 'King Kong';

SELECT directors.id, directors.first_name AS 'directors', directors.movie_id, movies.title, movies.year
FROM directors
INNER JOIN movies on directors.movie_id = movies.id
WHERE movie_id = 1;

SELECT first_name, title, year FROM directors
INNER JOIN movies  on directors.movie_id = movies.id;

SELECT first_name, title, year FROM directors
LEFT JOIN movies  on directors.movie_id = movies.id;




SELECT * FROM (directors,movies)
WHERE directors.movie_id = movies.id;



#Homework






