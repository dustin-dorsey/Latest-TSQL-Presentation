-- COMMAND: USE HINT
-- RELEASE: Starting with SQL Server 2016 
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/queries/hints-transact-sql-query?view=sql-server-2017#use_hint
         https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-valid-use-hints-transact-sql?view=sql-server-2017
-- DEFINITION: Query hints specify that the indicated hints should be used throughout the query
-- SYNTAX: See Link


/* Table and Query hints */ 
Select * from [Person].[Person]
OPTION (MAXDOP 1)

/* Query processor hints */ 

select * from sys.dm_exec_valid_use_hints

Select * from [Person].[Person]
OPTION (USE HINT ( 'FORCE_LEGACY_CARDINALITY_ESTIMATION' ))


SELECT * FROM Person.Address  
WHERE City = 'SEATTLE' AND PostalCode = 98104
OPTION (RECOMPILE, USE HINT ('QUERY_OPTIMIZER_COMPATIBILITY_LEVEL_110', 'FORCE_LEGACY_CARDINALITY_ESTIMATION')); 
GO  

-- Importance of Compatibility levels