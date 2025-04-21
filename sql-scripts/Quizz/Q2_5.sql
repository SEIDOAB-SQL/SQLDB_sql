USE sakila;
GO

USE sakila;
GO

DROP TABLE IF EXISTS  #tmp_customer;

SELECT * 
INTO #tmp_customer 
FROM dbo.customer;

--Lets simulate the misspellings
UPDATE #tmp_customer
SET first_name = 'Hermaine'
WHERE customer_id BETWEEN 1 AND 50;

UPDATE #tmp_customer
SET first_name = 'Herrmone'
WHERE customer_id BETWEEN 51 AND 100;

UPDATE #tmp_customer
SET first_name = 'Hermaini'
WHERE customer_id BETWEEN 101 AND 150;


--Now, lets find all misspellings
SELECT first_name, COUNT(*) FROM #tmp_customer
WHERE first_name LIKE 'Her%'
GROUP BY first_name;

--Now, lets correct all misspellings
UPDATE #tmp_customer
SET first_name = 'Hermoine'
WHERE first_name IN ('Hermaine', 'Hermaini', 'Herrmone')


--Finally, lets ensure all is corrected
SELECT first_name, COUNT(*) FROM #tmp_customer
WHERE first_name LIKE 'Her%'
GROUP BY first_name;


--Now we are ready to update the actual customer table

DROP TABLE IF EXISTS  #tmp_customer;