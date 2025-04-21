USE sakila;
GO

SELECT c.first_name, c.last_name, addr.address, addr.city
FROM customer c
INNER JOIN
    (SELECT a.address_id, a.address, ct.city
     FROM address a
         INNER JOIN city ct ON a.city_id = ct.city_id
     WHERE ct.city = 'Santa Rosa') addr ON c.address_id = addr.address_id;


