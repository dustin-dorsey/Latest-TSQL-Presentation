-- COMMAND: TRIM 
-- RELEASE: SQL Server 2017\ Azure SQL DB
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/trim-transact-sql?view=sql-server-2017
-- DEFINITION: Removes the space character char(32) or other specified characters from the start or end of a string.
-- SYNTAX: TRANSLATE (inputString, characters, translations) 


DECLARE @VALUE VARCHAR(2000) 
SET @VALUE = '          testdata         '

Select @VALUE

SELECT RTRIM(LTRIM(@VALUE))

SELECT REPLACE(@VALUE, ' ', '')

/* TRIM command */

DECLARE @VALUE2 VARCHAR(2000) 
SET @VALUE2 = '          testdata         '
SELECT TRIM(@VALUE2)

/* You can also use the TRIM to remove specific characters (similar to a REPLACE) */
SELECT TRIM( '#$ ' FROM  '#        Some text here        $');
