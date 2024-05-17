CREATE TABLE tmpTable1 (
    c1 NVARCHAR(10),
    c2 NVARCHAR(10)
)

CREATE TABLE tmpTable2 (
    c1 NVARCHAR(10),
    c2 NVARCHAR(10)
)
GO

INSERT INTO tmpTable1 (c1, c2)
VALUES  ('a', 'aa'),
        ('b', 'bb'),
        (NULL, 'cc'),
        ('d', 'dd'),
        ('e', 'ee');

INSERT INTO tmpTable2 (c1, c2)
VALUES  ('a', 'aa'),
        ('b', 'bb'),
        ('c', 'cc'),
        (NULL, 'dd'),
        ('e', 'ee');


--SELECT * FROM tmpTable1 c;
--SELECT * FROM tmpTable2 s;

SELECT c.c2 T1c2, s.c2  T2c2 FROM tmpTable1 c
INNER JOIN tmpTable2 s ON c.c1 = s.c1;

GO

DROP TABLE tmpTable1;
DROP TABLE tmpTable2;