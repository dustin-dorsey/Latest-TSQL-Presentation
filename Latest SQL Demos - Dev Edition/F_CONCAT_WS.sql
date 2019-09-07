-- COMMAND: CONCAT_WS 
-- RELEASE: SQL Server 2017/ Azure SQL DB 
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/concat-ws-transact-sql?view=sql-server-2017
-- DEFINITION: This function returns a string resulting from the concatenation, or joining, of two or more string values 
--             in an end-to-end manner. It separates those concatenated string values with the delimiter specified in the 
--             first function argument. (CONCAT_WS indicates concatenate with separator.)
-- SYNTAX: CONCAT_WS(separator, argument1, argument2 [, argumentN]... )
-- Considerations: Special considerations given to NULL values

/* CONCAT command */
SELECT CONCAT('Larry', ' fell', ' down the hill!');

/* CONCAT_WS command */
DROP TABLE IF EXISTS Test.dbo.Addresses;

CREATE TABLE Test.dbo.Addresses
(StreetNumber int, 
Street NVARCHAR(255),
City NVARCHAR(255),
State VARCHAR(2),
Zipcode VARCHAR(10))

Insert into Test.dbo.Addresses
([StreetNumber], [Street], [City], [State], [Zipcode])
VALUES
(123, 'Smith Street', 'Murfreesboro','TN','37129-0405'),
(5265, 'Hill Avenue', 'Franklin','TN','37027-1258'),
(47893, 'Turner Drive', 'Huntsville','AL','35709-5412')

Select [StreetNumber], [Street], [City], [State], [Zipcode]
FROM Test.dbo.Addresses

-- Comma Delimited
SELECT CONCAT_WS(',',[StreetNumber], [Street], [City], [State], [Zipcode])
FROM Test.dbo.Addresses

-- With spaces
SELECT CONCAT_WS(' ', [StreetNumber], [Street], [City], [State], [Zipcode]) AS Address
FROM Test.dbo.Addresses;

-- Address format
SELECT CONCAT_WS(' ', CONCAT_WS(' - ',[StreetNumber], [Street]), CONCAT_WS(', ',[City], [State]), [Zipcode])
FROM Test.dbo.Addresses
