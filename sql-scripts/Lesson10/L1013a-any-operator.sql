DROP TABLE IF EXISTS #ANYALLNumbers;
DROP TABLE IF EXISTS #ValueNumbers;
GO

-- Lets explore SubQuery operators ANY and ALL
CREATE TABLE #ANYALLNumbers(
	[number] [int] NOT NULL)
GO

CREATE TABLE #ValueNumbers(
	[number] [int] NOT NULL)
GO


INSERT INTO #ANYALLNumbers(number)
VALUES (9), (5), (7), (1)

INSERT INTO #ValueNumbers(number)
VALUES (1), (5), (0), (10)

--ANY Operator
-- =ANY() -> value equal to at least one value in subquery -> is identical to IN
SELECT * FROM #ValueNumbers
WHERE number =ANY (SELECT number FROM #ANYALLNumbers);

SELECT * FROM #ValueNumbers
WHERE number IN (SELECT number FROM #ANYALLNumbers);

-- value <ANY () -> value is less than at least one value in the subquery -> value is less than the largest value in subquery
SELECT * FROM #ValueNumbers
WHERE number <ANY (SELECT number FROM #ANYALLNumbers);

-- value >ANY() -> value is larger than at least one value in the subquery -> value is larger than the smaller value in subquery
SELECT * FROM #ValueNumbers
WHERE number >ANY (SELECT number FROM #ANYALLNumbers);
