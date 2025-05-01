USE sakila;
GO

SELECT title, rental_rate*rental_duration as max_rate from dbo.film;

SELECT title, rental_rate*rental_duration as max_rate,
    FLOOR(rental_rate*rental_duration) as floor_rate,
    CEILING(rental_rate*rental_duration) as ceiling_rate,
    ROUND(rental_rate*rental_duration, 1) as round1_rate,
    ROUND(rental_rate*rental_duration, 0) as round0_rate,
    ROUND(rental_rate*rental_duration, -1) as roundn1_rate
from dbo.film;