USE sakila;
GO

-- ANY Operator
-- total payment amount from customers living in  'Finland','Sweden'
SELECT co.country, sum(p.amount) 
    FROM payment p
        INNER JOIN customer c ON p.customer_id = c.customer_id
        INNER JOIN address a ON c.address_id = a.address_id
        INNER JOIN city ct ON a.city_id = ct.city_id
        INNER JOIN country co ON ct.country_id = co.country_id
    WHERE co.country IN ('Finland','Sweden')
    GROUP BY co.country
 
-- customers with an amount higher than the lowest amount from 'Finland' OR 'Sweden'
SELECT customer_id, sum(amount)
FROM dbo.payment
GROUP BY customer_id
HAVING sum(amount) > ANY (
    SELECT sum(p.amount) 
    FROM payment p
        INNER JOIN customer c ON p.customer_id = c.customer_id
        INNER JOIN address a ON c.address_id = a.address_id
        INNER JOIN city ct ON a.city_id = ct.city_id
        INNER JOIN country co ON ct.country_id = co.country_id
    WHERE co.country IN ('Finland','Sweden')
    GROUP BY co.country)
    ORDER BY 2 ASC;

-- customers with an amount lower than the highest amount from 'Finland' OR 'Sweden'
SELECT customer_id, sum(amount)
FROM dbo.payment
GROUP BY customer_id
HAVING sum(amount) < ANY (
    SELECT sum(p.amount) 
    FROM payment p
        INNER JOIN customer c ON p.customer_id = c.customer_id
        INNER JOIN address a ON c.address_id = a.address_id
        INNER JOIN city ct ON a.city_id = ct.city_id
        INNER JOIN country co ON ct.country_id = co.country_id
    WHERE co.country IN ('Finland','Sweden')
    GROUP BY co.country)
    ORDER BY 2 DESC;

