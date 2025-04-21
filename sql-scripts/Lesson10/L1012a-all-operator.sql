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

--ALL Operator
-- <>ALL() -> value NOT equal all value in subquery -> is identical to NOT IN
SELECT * FROM #ValueNumbers
WHERE number <>ALL (SELECT number FROM #ANYALLNumbers);

SELECT * FROM #ValueNumbers
WHERE number NOT IN (SELECT number FROM #ANYALLNumbers);

-- value <ALL() -> value is less than all the value in the subquery -> value is less than the smallest value in subquery
SELECT * FROM #ValueNumbers
WHERE number <ALL (SELECT number FROM #ANYALLNumbers);

-- value >ALL() -> value is larger than all value in the subquery -> value is larger than the largest value in subquery
SELECT * FROM #ValueNumbers
WHERE number >ALL (SELECT number FROM #ANYALLNumbers);

