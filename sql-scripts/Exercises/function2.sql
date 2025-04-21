USE musicefc;
GO

SELECT FirstName, Birthday, dbo.udf_DaysToBirthday(Birthday) FROM dbo.Artists
WHERE dbo.udf_DaysToBirthday(Birthday) > 0
ORDER BY 3 ASC;