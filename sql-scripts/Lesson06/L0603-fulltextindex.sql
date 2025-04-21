USE sakila;
GO

--NEED to run this on sakila database at Azure SQL server 
--as the full text is not installed in the docker image
SELECT FULLTEXTSERVICEPROPERTY('IsFullTextInstalled');

--right now empty
SELECT * from sys.fulltext_catalogs;
SELECT * from sys.fulltext_indexes;
SELECT * from sys.fulltext_index_columns;

