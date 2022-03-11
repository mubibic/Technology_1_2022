
/* create and index on movie id and another one on movies .title*/

CREATE UNIQUE INDEX movie_id ON movies (id);
CREATE INDEX moive_title ON movies (title);
CREATE INDEX movies_ids_titles ON movies (id, title);

DROP INDEX movie_id ON movies;

SHOW ENGINES;