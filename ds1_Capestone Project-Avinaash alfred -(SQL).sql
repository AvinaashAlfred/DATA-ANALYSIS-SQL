-- CAPESTONE PROJECT SQL --------------------------------------------------------------
use sakila;
-- TASK 1-----------------------
select * from actor;
select concat(first_name,' ',last_name) AS ' ACTORS FULL NAME' from actor;

-- TASK 2.1-----------------
select  first_name ,count(first_name ) as 'count of first name' from actor  group by  first_name;
-- TASK 2.2-----------------
select first_name ,count(first_name)as count
from actor group by first_name having count(first_name)=1;

-- TASK 3.1----------------------
select  last_name ,count(last_name) as 'count of last name' from actor  group by  last_name;
-- TASK 3.2--------------------
select last_name ,count(last_name)as count
from actor group by last_name having count(last_name)=1;

-- TASK 4.1-----------------
SELECT * FROM film  where rating ="R";
-- TASK 4.2---------------
select *from film where not rating='R';
-- TASK 4.3--------------
select * from film where rating='PG' OR rating='PG-13';
-- TASK 5.1---------------
select * from film  where replacement_cost<=11;
-- TASK 5.2---------------
select * from film  where replacement_cost between 11 and 20;
-- TASK 5.3-----------------
select title, replacement_cost from film order by replacement_cost desc;

-- TASK 6-------------------------------
select count(*) as Actor_count, title from film
join film_actor on film.film_id = film_actor.film_id group by title order by Actor_count desc limit 3;
-- TASK 7-----------------------------------
select title from film where title like 'K%' or title like 'Q%';
 -- TASK 8 -----------------------
select concat( first_name , ' ', last_name) as 'Actors Full name' from actor
join film_actor ON actor.actor_id = film_actor.actor_id
join film ON film_actor.film_id = film.film_id
where film.title ='Agent Truman';
-- TASK 9------------------------
select title from film where rating='G';

-- TASK 10.1---------------
SELECT rating, MAX(rental_rate) AS max_rental_rate, MIN(rental_rate) AS min_rental_rate, avg(rental_rate) AS avg_rental_rate
FROM film
GROUP BY rating 
order by avg_rental_rate desc;
-- TASK 10.2-------------------
SELECT film.title, COUNT(rental.rental_id) AS rental_frequency
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
order by  rental_frequency desc;

-- TASK 11----------------------
select category.name, avg(replacement_cost) as 'Avg Replacement_cost',Avg(rental_rate) as 'Avg Rental_rate', 
(avg(replacement_cost)-avg(rental_rate)) as " Difference"
from film inner join film_actor on film_actor.film_id = film.film_id
inner join category on film_actor.actor_id = category.category_id group by name having (AVG(replacement_cost)-AVG(rental_rate)) >15;

-- TASK 12------------------------
SELECT category.name, COUNT(film.film_id) AS movie_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name
HAVING COUNT(film.film_id)>70;

-- OBSERVATION------------
#Find the total number of customers in the database:
SELECT COUNT(*) AS total_customers
FROM customer;









