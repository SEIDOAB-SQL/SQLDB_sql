USE friends;
GO

SELECT N'A simple unicode string literal', N'Let''s try a string using separate single quotes ''hello''';

-- unicode -> decimal -> hex 
SELECT UNICODE(N'Å'), master.dbo.fn_varbintohexstr(UNICODE(N'Å')),  convert(varbinary, UNICODE(N'Å'), 1);

-- hex -> unicode
-- https://www.rapidtables.com/code/text/unicode-characters.html
SELECT NCHAR(0x20A9) AS wong, NCHAR(0x20AB) AS dong, NCHAR(0x20B9) AS rupee, NCHAR(0x20AA) AS shekel; 

--Use some string functions
DECLARE @myString AS NVARCHAR(100) = N'₪₪₪₪₪₪₪₪₪₪';

SELECT N'List of Shekel signs: ' + @myString;
SELECT @myString = CONCAT (N'So is this: ', @myString);

SELECT @myString as string, LEN(@myString) nr_char, DATALENGTH(@myString) nr_bytes;

SELECT  CHARINDEX(N':', @myString) AS charindex, 
        SUBSTRING (@myString, 1, CHARINDEX(N':', @myString)) AS substring, 
        REPLACE(@myString, N'₪₪₪₪₪₪₪₪₪₪', N'₱₱₱₱₱') AS replace,
        STUFF (@myString, 1, CHARINDEX(N':', @myString), N'Some sekels:') As stuff

--Use string functions on a table
SELECT Name + N' the happy ' + AnimalKind FROM dbo.Pet;

SELECT CONCAT_WS(N' ', Name, N'the mischievous', AnimalKind, N'is owned by', FriendId) FROM dbo.Pet;



