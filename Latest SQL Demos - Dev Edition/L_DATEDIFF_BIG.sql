-- COMMAND: DATEDIFF_BIG
-- RELEASE: SQL Server 2016
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/datediff-big-transact-sql?view=sql-server-2017
-- DEFINITION: This function returns the count (as a signed big integer value) of the specified datepart boundaries crossed between the specified startdate and enddate.
-- SYNTAX: DATEDIFF_BIG ( datepart , startdate , enddate )  


DECLARE @StartDate DATETIME = '20190714', @EndDate DATETIME = '20190814'
SELECT DATEDIFF(MILLISECOND, @StartDate, @EndDate) AS DiffInMilliSecond
GO

DECLARE @StartDate DATETIME = '20190714', @EndDate DATETIME = '20190814'
SELECT DATEDIFF_BIG(MILLISECOND, @StartDate, @EndDate) AS DiffInMilliSecond
GO 