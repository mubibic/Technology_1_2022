SELECT year FROM movies;
SELECT title, year FROM movies;

SELECT * FROM movies WHERE YEAR = 2003;
SELECT * FROM movies WHERE YEAR < 2003;
SELECT * FROM movies WHERE YEAR > 2003;

SELECT * FROM movies WHERE year < NOW();


SELECT * FROM movies WHERE 1 = 1;
SELECT * FROM movies WHERE TRUE;


SELECT * FROM movies WHERE year IS NOT NULL;

SELECT * FROM movies ORDER BY title;
SELECT * FROM movies ORDER BY year;
SELECT * FROM movies ORDER BY year ASC;
SELECT * FROM movies ORDER BY year DESC;

INSERT INTO movies VALUES ('Need for Speed', 2011);
INSERT INTO movies (title) VALUES ('Movie');

INSERT INTO movies VALUE ('Toy Story', 1);

INSERT INTO movies (title) VALUE ('The fast and the furious: Tokyo Drift');










