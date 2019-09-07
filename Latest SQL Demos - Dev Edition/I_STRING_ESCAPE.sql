-- COMMAND: STRING_ESCAPE
-- RELEASE: SQL Server 2016
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/string-escape-transact-sql?view=sql-server-2017
-- DEFINITION: Escapes special characters in texts and returns text with escaped characters.
-- SYNTAX: STRING_ESCAPE(text, type)  
-- NOTE: JSON is the only supported type currently

/*
Special Characters              Escapes As
Double Quote (“)				\”
Forward Slash (/)				\/
Reverse Slash (\)				\\
Backspace						\b
Form feed						\f
Carriage Return					\r
New line						\n
Tab								\t
*/

/* Example for using STRING_ESCAPE */
SELECT STRING_ESCAPE('Double quote:" , Forward slash:/ , 
    Reverse slash:\ , Tab:   , Carriage Return & New line:
 ','json')

 SELECT STRING_ESCAPE('Do you want a steak\shrimp or
chicken\scallops for a "snack"?', 'json') AS Result;

/* Check if valid JSON */
Select ISJSON('{ "name":"John" }')

/* WITH FORMATMESSAGE */
USE [WideWorldImporters];
GO
SELECT 
FORMATMESSAGE('{ "CustomerID": %d,"Name": "%s" }', 
[CustomerID], STRING_ESCAPE([CustomerName],'json')) AS 'JSON Object'
FROM [Sales].[Customers]

/* FORMATMESSAGE script to drop all User tables */

USE [WideWorldImporters];
GO
SELECT FORMATMESSAGE('DROP TABLE IF EXISTS [%s].[%s];', SCHEMA_NAME(schema_id), name) AS [Drop Statement]
FROM sys.tables WHERE type = 'U';

/* Other JSON functions */
https://docs.microsoft.com/en-us/sql/t-sql/functions/json-functions-transact-sql?view=sql-server-2017

/* JSON Path Expressions */
https://docs.microsoft.com/en-us/sql/relational-databases/json/json-path-expressions-sql-server?view=sql-server-2017

/* JSON Data in SQL Server */
https://docs.microsoft.com/en-us/sql/relational-databases/json/json-data-sql-server?view=sql-server-2017