-- COMMAND: STRING_AGG 
-- RELEASE: SQL Server 2017/ Azure SQL DB
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/string-agg-transact-sql?view=sql-server-2017
--		 https://www.red-gate.com/simple-talk/sql/t-sql-programming/concatenating-row-values-in-transact-sql/ (Old Ways)
-- DEFINITION: Aggregate function that takes all expressions from rows and concatenantes them into a single string
-- SYNTAX: STRING_AGG ( expression, separator ) [ <order_clause> ]<order_clause> ::=   
--         WITHIN GROUP ( ORDER BY <order_by_expression_list> [ ASC | DESC ] ) 
-- Considerations: Special considerations given to NULL values 


USE TEST
GO
DROP TABLE IF EXISTS Locations;
 
CREATE TABLE Locations (
    [State] VARCHAR(2), 
    [City] VARCHAR(50))

INSERT INTO Locations
([State], [City])
VALUES
('TN', 'Nashville'),
('TN', 'Murfreesboro'),
('TN', 'Memphis'),
('AL', 'Huntsville'),
('AL', 'Hazel Green'),
('AL', 'Athens'),
('KY', 'Lexington'),
('KY', 'Louisville'),
('KY', 'Ashland'),
('KY', 'Greenup')

SELECT * FROM Locations

/* Comma seperate values */
SELECT STRING_AGG(City,', ') as Cities
FROM Locations

/* Comma seperated with ORDER BY */
SELECT STRING_AGG(City,', ') WITHIN GROUP(ORDER BY City) as Cities
FROM Locations

/* Grouped by state */
SELECT [State], STRING_AGG(City, ', ') WITHIN GROUP (ORDER BY City) as Cities
FROM Locations
GROUP BY [State]