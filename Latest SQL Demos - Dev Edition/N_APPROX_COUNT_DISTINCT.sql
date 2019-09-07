-- COMMAND: APPROX_COUNT_DISTINCT
-- RELEASE: Azure SQL DB, SQL Server 2019
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/functions/approx-count-distinct-transact-sql?view=sql-server-2017
-- DEFINITION: This function returns the approximate number of unique non-null values in a group with 
--			   up to a 2% error rate and 97% accuracy
-- SYNTAX: APPROX_COUNT_DISTINCT ( expression )   

/* Create table and load random values */
CREATE TABLE DBAdb.dbo.BaselineTest
(id int not null primary key,
randomnumber int);

with randowvalues
as(select 1 id, CAST(RAND(CHECKSUM(NEWID()))*25000000 as int) randomnumber
union all
select id + 1, CAST(RAND(CHECKSUM(NEWID()))*25000000 as int) randomnumber
from randowvalues
where id < 100000000)

Insert into DBAdb.dbo.BaselineTest
select id, randomnumber
from randowvalues
OPTION(MAXRECURSION 0)

Set statistics io on 
Set statistics time on 

--Select count(*) from DBAdb.dbo.BaselineTest -- 100,000,000

Select count(DISTINCT randomnumber) from DBAdb.dbo.BaselineTest -- 24,542,168

SELECT APPROX_COUNT_DISTINCT(randomnumber) from DBAdb.dbo.BaselineTest -- 25,138,927

Set statistics io off 
Set statistics time off
