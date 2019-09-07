-- COMMAND: STRING_SPLIT
-- RELEASE: SQL Server 2016/ Azure SQL DB
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/string-split-transact-sql?view=sql-server-2017
-- DEFINITION: A table-valued function that splits a string into rows of substrings, based on a specified separator character
-- SYNTAX: STRING_SPLIT ( string , separator ) 
-- Considerations: Compatibility level must be 130


/* Old way */

DECLARE @Animals VARCHAR(4000) = 'Dolphin,Cat,Dog,Turtle';
SELECT * FROM Test.dbo.Split (@Animals,',');

DECLARE @Animals VARCHAR(4000) = 'Dolphin,Cat,Dog,Turtle';
SELECT [Animal]
FROM [Test].[dbo].[AnimalNames]
Where Animal in (SELECT * FROM Test.dbo.Split (@Animals,','));

/* New way */

DECLARE @Animals VARCHAR(4000) = 'Dolphin,Cat,Dog,Turtle';
SELECT * FROM STRING_SPLIT (@Animals,',');

DECLARE @Animals VARCHAR(4000) = 'Dolphin,Cat,Dog,Turtle';
SELECT [Animal]
FROM [Test].[dbo].[AnimalNames]
Where Animal in (SELECT * FROM STRING_SPLIT (@Animals,','));

/* SSRS Report example */

DECLARE @Animals VARCHAR(4000) = 'Dolphin,Cat,Dog,Turtle'
SELECT [Animal]
  FROM [Test].[dbo].[AnimalNames]
  Where Animal in (SELECT * FROM STRING_SPLIT (@Animals,','))

