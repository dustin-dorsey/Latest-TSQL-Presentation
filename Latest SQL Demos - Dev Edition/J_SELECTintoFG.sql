-- Description: Select into filegroups
-- RELEASE: SQL 2016 SP2 / SQL 2017
-- Link: https://docs.microsoft.com/en-us/sql/t-sql/queries/select-into-clause-transact-sql?view=sql-server-2017


/* Cleanup */

DROP TABLE IF EXISTS Test.dbo.TempDBList;

ALTER DATABASE TEST REMOVE FILE [AdhocStuff];
ALTER DATABASE TEST REMOVE FILEGROUP [AdhocFilegroup];

/* Create File and Filegroups */ 

USE master
GO
ALTER DATABASE TEST  
ADD FILEGROUP AdhocFilegroup;  
GO  
ALTER DATABASE TEST   
ADD FILE   
(  
    NAME = AdhocStuff,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdhocStuff.ndf',  
    SIZE = 10MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 25MB
)
TO FILEGROUP AdhocFilegroup;  
GO

/* Insert into filegroup */

SELECT [name], database_id, create_date
INTO TEST.dbo.TempDBList ON [AdhocFilegroup]
FROM master.sys.databases;

/* Verify table is on specified Filegroup */ 
USE TEST
GO
SELECT O.[name] as 'Tablename', FG.[name] as 'Filegroup'
FROM sys.indexes I
INNER JOIN sys.filegroups FG ON I.data_space_id = FG.data_space_id
INNER JOIN sys.all_objects O ON I.[object_id] = O.[object_id] 
AND O.type = 'U';

