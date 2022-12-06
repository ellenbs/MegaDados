USE sakila;

DROP TABLE IF EXISTS film_actor_r;

CREATE TEMPORARY TABLE film_actor_r
	SELECT
		actor_id, COUNT(film_id) as cnt
	FROM
		film_actor
		INNER JOIN film USING (film_id)
	WHERE
		rating = "R"
	GROUP BY
		actor_id;


SELECT
	first_name, last_name
FROM
	actor
	LEFT OUTER JOIN film_actor_r USING (actor_id)
WHERE
	cnt IS NULL;