-- COMMAND: FORMATMESSAGE
-- RELEASE: 2008, but SQL Server 2016 released message string functionality
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/formatmessage-transact-sql?view=sql-server-2017
-- DEFINITION: Function used to construct a message from sys.messages and now any string (SQL 2016) 
-- SYNTAX: FORMATMESSAGE ( { msg_number  | ' msg_string ' } , [ param_value [ ,...n ] ] ) 

-- NOTE: FormatMessage function works just like .NET's String.Format function
-- RAISERROR prints the message immediately, FORMATMESSAGE returns message for futher processing

USE [WideWorldImporters];
-- Genertate drop statements for all user tables in database
SELECT FORMATMESSAGE('DROP TABLE IF EXISTS [%s].[%s];', SCHEMA_NAME(schema_id), name) AS [Drop Statement]
FROM sys.tables WHERE type = 'U';

USE [WideWorldImporters];
SELECT 
FORMATMESSAGE('{ "CustomerID": %d,"Name": "%s" }', 
[CustomerID], STRING_ESCAPE([CustomerName],'json')) AS 'JSON Object'
FROM [Sales].[Customers]

