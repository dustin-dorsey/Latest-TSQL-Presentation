-- COMMAND: TRANSLATE 
-- RELEASE: SQL Server 2017\ Azure SQL DB
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/translate-transact-sql?view=sql-server-2017 
-- DEFINITION: Returns the string provided as a first argument after some characters specified in the second argument 
--			   are translated into a destination set of characters specified in the third argument
-- SYNTAX: TRANSLATE (inputString, characters, translations)
-- Considerations - You will get errors if character and translations have different lengths
--					Will return NULL if any values are NULL 

/* REPLACE command except on individual characters */
SELECT REPLACE('Curtis Crouch', 'Curtis', 'Rachel') as [REPLACE],
	   TRANSLATE('Curtis Crouch', 'Curtis', 'Rachel') as [TRANSLATE]

SELECT REPLACE('123', '321', '456'),
       TRANSLATE('123', '321', '456')  -- 1 is replaced by 6, 2 is replaced by 5, 3 is replaced by 4

SELECT REPLACE(REPLACE(REPLACE('123','1','6'),'2','5'),'3','4')