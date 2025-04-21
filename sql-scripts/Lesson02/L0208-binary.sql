USE sakila;
GO

--create a temp table
CREATE TABLE #BinaryTest (
    DataDescription VARCHAR(50),
    BinaryData VARBINARY(MAX));

--fill it with some binary data byte[] in c#
INSERT INTO #BinaryTest (DataDescription, BinaryData)
VALUES 
    ('Test 1', CONVERT(VARBINARY(MAX),'this is test 1')),
    ('Test 2', CONVERT(VARBINARY(MAX),'this is test 2')),
    ('Test 3', CONVERT(VARBINARY(MAX),'this is test 3'));


--insert a small and a large binary file into the table
--use openrowset to load a file into the BinaryData
--you need to have moved the image file into the sql server docker container:
--   1. in the sql server docker terminal create a directory: 
--         mkdir /usr/images/
--   2. open a terminal in the directory of your image file on the computer
--   3. copy the image file from your computer into the docker container: 
--         docker cp image1.jpg sql2022container:/usr/images/
--         docker cp image2.jpg sql2022container:/usr/images/
INSERT INTO #BinaryTest(DataDescription, BinaryData)
   SELECT 'image1.jpg, small file 45kB' AS DataDescription,
      * FROM OPENROWSET(BULK N'/usr/images/image1.jpg', SINGLE_BLOB) AS BinaryData;
GO

INSERT INTO #BinaryTest(DataDescription, BinaryData)
   SELECT 'image2.jpg, large file 4.6MB' AS DataDescription,
      * FROM OPENROWSET(BULK N'/usr/images/image2.jpg', SINGLE_BLOB) AS BinaryData;
GO


--show the table data
SELECT DataDescription, BinaryData, 
    CONVERT(VARCHAR(MAX), BinaryData) as [to varchar], 
    DATALENGTH(BinaryData) as [binary size]
FROM #BinaryTest;

--remove the temp table
DROP TABLE #BinaryTest;

