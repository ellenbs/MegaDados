USE sakila;

DROP TABLE IF EXISTS total_actor;

CREATE TEMPORARY TABLE total_actor
	SELECT
		actor_id, COUNT(film_id) as total_films
	FROM
		film_actor
	GROUP BY
		actor_id;

DROP TABLE IF EXISTS total_lucky_actor;

CREATE TEMPORARY TABLE total_lucky_actor
	SELECT
		actor_id, COUNT(film_id) as total_lucky_films
	FROM
		film_actor
		INNER JOIN actor USING (actor_id)
		INNER JOIN film USING (film_id)
	WHERE
		LEFT(first_name, 1) = LEFT(title, 1)
	GROUP BY 
		actor_id;

SELECT
	first_name, last_name, total_lucky_films / total_films as frac
FROM
	total_actor
    INNER JOIN total_lucky_actor USING (actor_id)
    INNER JOIN actor USING (actor_id)
ORDER BY
	frac DESC
LIMIT 10;