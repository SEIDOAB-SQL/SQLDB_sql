USE sakila;
GO

DECLARE @myString NVARCHAR(200) = 'Hello world';
DECLARE @myMoney as MONEY = 123.567;
DECLARE @myInt as INT = 789;

SET @myString += ', and hello again!';
SET @myMoney = @myMoney * 2;
SET @myInt += 1000;

SELECT @myString, @myMoney, @myInt;

--I can set several variables in a select statement, 
--notice how the are evaluated and assigned from left to right
DECLARE @myString1 NVARCHAR(200)
SELECT @myString += ' '+ LTRIM(CONVERT(NCHAR, @myMoney)), @myString1 = @myString, @myMoney = @myInt
SELECT @myString, @myString1, @myMoney, @myInt;
