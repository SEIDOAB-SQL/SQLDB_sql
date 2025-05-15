
-- Which garage is the most popular (with most cars)
SELECT TOP 1 g.GarageId, g.Name, Count(*) FROM dbo.Garages g
INNER JOIN dbo.Cars c ON g.GarageId = c.GarageId
GROUP BY g.GarageId, g.Name
ORDER BY 3 DESC

-- Only the name as response
SELECT GarageName FROM (
    SELECT TOP 1 g.GarageId as GarageID, g.Name as GarageName, Count(*) as Count FROM dbo.Garages g
    INNER JOIN dbo.Cars c ON g.GarageId = c.GarageId
    GROUP BY g.GarageId, g.Name
    ORDER BY 3 DESC
) r


-- Which brand has most cars in repair
SELECT CarMake FROM (
    SELECT TOP 1 [Make] as CarMake, Count(*) as Count FROM dbo.Cars c
    INNER JOIN dbo.Garages g ON c.GarageId = g.GarageId
    GROUP BY [Make]
    ORDER BY 2 DESC
) r

UPDATE dbo.Cars 
SET GarageId = NULL
WHERE Make = 'Fiat';

-- Which are the 3 brands with fewest cars in repair
-- Make not in repair
SELECT TOP 3 Make, SUM(Count) FROM 
(
    SELECT DISTINCT [Make] as Make, 0 as Count FROM dbo.Cars c
    LEFT JOIN dbo.Garages g ON c.GarageId = g.GarageId
    WHERE c.GarageId IS NULL

    UNION 

    -- Make in repair
    SELECT [Make], Count(*) FROM dbo.Cars c
    INNER JOIN dbo.Garages g ON c.GarageId = g.GarageId
    GROUP BY [Make]
) r
GROUP BY Make
ORDER BY 2 ASC

-- Owners of the brands with cars in repair
-- STEP 1 Break it down
SELECT * FROM dbo.Owners o
INNER JOIN dbo.Cars c ON o.OwnerId = c.OwnerId
WHERE Make IN ('Fiat', 'Volvo', 'Audi')

SELECT Make FROM
(
    SELECT TOP 3 Make as Make, SUM(Count) as Count FROM 
    (
        SELECT DISTINCT [Make] as Make, 0 as Count FROM dbo.Cars c
        LEFT JOIN dbo.Garages g ON c.GarageId = g.GarageId
        WHERE c.GarageId IS NULL

        UNION 

        -- Make in repair
        SELECT [Make], Count(*) FROM dbo.Cars c
        INNER JOIN dbo.Garages g ON c.GarageId = g.GarageId
        GROUP BY [Make]
    ) r
    GROUP BY Make
    ORDER BY 2 ASC
)rr

GO
-- STEP 2 put it together
--CREATE VIEW OwnersToCongrat AS
    SELECT o.OwnerId, o.FirstName, o.LastName, c.Make FROM dbo.Owners o
    INNER JOIN dbo.Cars c ON o.OwnerId = c.OwnerId
    WHERE c.Make IN (
        SELECT Make FROM
        (
            SELECT TOP 1 Make as Make, SUM(Count) as Count FROM 
            (
                SELECT DISTINCT [Make] as Make, 0 as Count FROM dbo.Cars c
                LEFT JOIN dbo.Garages g ON c.GarageId = g.GarageId
                WHERE c.GarageId IS NULL

                UNION 

                -- Make in repair
                SELECT [Make], Count(*) FROM dbo.Cars c
                INNER JOIN dbo.Garages g ON c.GarageId = g.GarageId
                GROUP BY [Make]
            ) r
            GROUP BY Make
            ORDER BY 2 ASC
        )rr
    )