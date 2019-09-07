-- Description: Bulk INSERT support from Azure BLOB \ New Arguments FORMAT,  FIELDQUOTE, and FORMATFILE
-- RELEASE: SQL 2017
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-2017 
--       http://www.sommarskog.se/bulkload.html#CSVfiles

Use TEST
GO

/* Create Master Key to Encrypt Credential */ 
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'S0me!nfo';


/* Create DATABASE SCOPED CREDENTIAL -- NOTE: Remove the ? at the beginning of the SECRET */
CREATE DATABASE SCOPED CREDENTIAL MyAzureBlobStorageCredential 
 WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
 SECRET = 'sv=2018-03-28&ss=bfqt&srt=sco&sp=rl&st=2019-09-05T15%3A41%3A07Z&se=2019-09-12T15%3A41%3A00Z&sig=XZ6VbpZ%2FGfEdCDITZjqV7iognFG3BCEAfIP%2B7PtllQk%3D';


/* Create External Data Source */ 
CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH (	TYPE = BLOB_STORAGE, 
		LOCATION = 'https://dustindemoteststorage.blob.core.windows.net/demo', 
		CREDENTIAL= MyAzureBlobStorageCredential);


/* Bulk Insert from Azure BLOB */ 

DROP TABLE IF EXISTS TEST.dbo.Locations;

CREATE TABLE TEST.dbo.Locations
(State VARCHAR(256), City VARCHAR(256))

BULK INSERT TEST.dbo.Locations
FROM 'Location.csv'
WITH (DATA_SOURCE = 'MyAzureBlobStorage',
	  FORMAT = 'CSV',
	  FIELDQUOTE= '"');

SELECT * FROM TEST.dbo.Locations