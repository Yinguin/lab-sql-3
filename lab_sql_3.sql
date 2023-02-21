USE sakila;

# 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

# 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) FROM film;

# 3. How many movies were released with "PG-13" rating?
SELECT COUNT(*) FROM film
WHERE rating = "PG-13";

# 4. Get 10 the longest movies from 2006.
SELECT * FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

# 5. How many days has been the company operating (check DATEDIFF() function)?
SELECT datediff("2023-02-21", DATE_FORMAT(last_update,"%Y-%m-%d")) AS days_of_operating FROM store;

# 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, MONTHNAME(rental_date) AS month, DAYNAME(rental_date) AS weekday
FROM rental LIMIT 20;

# 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" or DAYNAME(rental_date) = "Sunday") THEN "weekend" 
	ELSE "workday"
    END AS day_type
FROM rental;

# 8. How many rentals were in the last month of activity?
SELECT * FROM rental
ORDER BY rental_date DESC;

SELECT COUNT(*) FROM rental
WHERE rental_date LIKE "2006-02%";