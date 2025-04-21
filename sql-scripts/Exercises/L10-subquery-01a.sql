SELECT cy.country, f.title, f.film_id FROM dbo.customer c
INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN dbo.film f ON f.film_id = i.film_id
INNER JOIN dbo.address a ON a.address_id = c.address_id
INNER JOIN dbo.city ct ON ct.city_id = a.city_id
INNER JOIN dbo.country cy ON cy.country_id = ct.country_id
WHERE cy.country IN ('India')

SELECT TOP 1 cy.country, COUNT(f.film_id) FROM dbo.customer c
INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN dbo.film f ON f.film_id = i.film_id
INNER JOIN dbo.address a ON a.address_id = c.address_id
INNER JOIN dbo.city ct ON ct.city_id = a.city_id
INNER JOIN dbo.country cy ON cy.country_id = ct.country_id
GROUP BY cy.country
ORDER BY 2 DESC;

SELECT tc.country FROM (
    SELECT TOP 1 cy.country, COUNT(f.film_id) [count] FROM dbo.customer c
    INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
    INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN dbo.film f ON f.film_id = i.film_id
    INNER JOIN dbo.address a ON a.address_id = c.address_id
    INNER JOIN dbo.city ct ON ct.city_id = a.city_id
    INNER JOIN dbo.country cy ON cy.country_id = ct.country_id
    GROUP BY cy.country
    ORDER BY 2 DESC ) tc;


SELECT cy.country, f.title, f.film_id FROM dbo.customer c
INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN dbo.film f ON f.film_id = i.film_id
INNER JOIN dbo.address a ON a.address_id = c.address_id
INNER JOIN dbo.city ct ON ct.city_id = a.city_id
INNER JOIN dbo.country cy ON cy.country_id = ct.country_id
WHERE cy.country IN (
    SELECT tc.country FROM (
        SELECT TOP 1 cy.country, COUNT(f.film_id) [count] FROM dbo.customer c
        INNER JOIN dbo.rental r ON c.customer_id = r.customer_id
        INNER JOIN dbo.inventory i ON r.inventory_id = i.inventory_id
        INNER JOIN dbo.film f ON f.film_id = i.film_id
        INNER JOIN dbo.address a ON a.address_id = c.address_id
        INNER JOIN dbo.city ct ON ct.city_id = a.city_id
        INNER JOIN dbo.country cy ON cy.country_id = ct.country_id
        GROUP BY cy.country
        ORDER BY 2 DESC ) 
        tc)