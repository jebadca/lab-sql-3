USE sakila;

#How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) as unique_last_names FROM actor;

#In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) as unique_languages FROM language;

#How many movies were released with "PG-13" rating?
SELECT COUNT(DISTINCT film_id)
FROM film
WHERE rating like ("PG-13");

#Get 10 the longest movies from 2006.
SELECT film_id, length, release_year
FROM film
WHERE release_year = 2006
ORDER BY length desc
LIMIT 10;

#How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(NOW(), MIN(payment_date)) AS days_operating
FROM payment;

#Show rental info with additional columns month and weekday. Get 20.
SELECT *,
DATE_FORMAT(rental_date,"%M") as month,
DAYNAME(STR_TO_DATE(DATE_FORMAT(rental_date, '%Y-%m-%d'), '%Y-%m-%d')) AS weekday
FROM rental
LIMIT 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" or DAYNAME(rental_date) = "Sunday") THEN "weekend"
    ELSE "workday"
    END as day_type
FROM rental
ORDER BY rental_date desc;

#How many rentals were in the last month of activity?
SELECT COUNT(*) AS num_rentals
FROM rental
WHERE rental_date >= DATE_SUB('2006-02-14', INTERVAL 30 DAY);


