-- Description: Silent Truncation Error message
-- RELEASE: 2016 SP2 CU6/ SQL Server 2017

Use TEST 
GO

DROP TABLE IF EXISTS dbo.Animals;

CREATE TABLE Animals
(AnimalName VARCHAR(20), MealPlan VARCHAR(20));

INSERT INTO Animals
(AnimalName, MealPlan)
VALUES 
('Lion', 'Feed 2 beef steaks at noon and 5 thawed gazelle filets at 2pm ')
--OPTION (QUERYTRACEON 460); -- Does not work on SQL 2019

-- NOTE: Enabling this will change the error Msg number from 8152 to 2628

/* Turn on the instance level */
DBCC TRACEON(460, -1);

/* Turn off on the instance level */
DBCC TRACEOFF(460, -1);

/* New in 2019 */
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = OFF -- SQL 2019
