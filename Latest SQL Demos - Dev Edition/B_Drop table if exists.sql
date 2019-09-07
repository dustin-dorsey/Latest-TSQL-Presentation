-- Description: Change in DROP TABLE syntax
-- RELEASE: SQL 2016
-- Link: https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-table-transact-sql?view=sql-server-2017

Use TEST
GO
CREATE TABLE dbo.Animals
(AnimalName VARCHAR(20), MealPlan VARCHAR(20));


/* Old Way */

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Animals') 
AND [type] IN (N'U'))
   DROP TABLE dbo.Animals;  

/* New way */

DROP TABLE IF EXISTS dbo.Animals;

/* Other examples */ 

DROP TRIGGER IF EXISTS tr_sometrigger
DROP VIEW IF EXISTS vw_someview
DROP PROC IF EXISTS sp_someproc
