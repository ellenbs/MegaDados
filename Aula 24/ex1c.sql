USE sakila;

DELIMITER //

CREATE TRIGGER trig_cnt_films
BEFORE INSERT ON film_actor
FOR EACH ROW BEGIN
	UPDATE actor SET cnt = cnt + 1 WHERE actor.actor_id = NEW.actor_id;
END //

CREATE TRIGGER trig_cnt_films
BEFORE DELETE ON film_actor
FOR EACH ROW BEGIN
	UPDATE actor SET cnt = cnt - 1 WHERE actor.actor_id = OLD.actor_id;
END //

DELIMITER ;