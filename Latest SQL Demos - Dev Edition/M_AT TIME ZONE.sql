-- COMMAND: AT TIME ZONE 
-- RELEASE: SQL Server 2016
-- LINK: https://docs.microsoft.com/en-us/sql/t-sql/queries/at-time-zone-transact-sql?view=sql-server-2017
-- DEFINITION: Function that allows you to convert time to different timezones
-- SYNTAX: inputdate AT TIME ZONE timezone  

/* List available time zones */
SELECT * FROM sys.time_zone_info

/*Convert current time to Eastern time */
SELECT CONVERT(datetime,GetDate())
AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'Eastern Standard Time'

SELECT  
CONVERT(datetime,GETDATE()) CST,
CONVERT(datetime,GETDATE()) AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'Eastern Standard Time' EST,
CONVERT(datetime,GETDATE()) AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'Pacific Standard Time' PST,
CONVERT(datetime,GETDATE()) AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'UTC' UTC

/* Dates stored as UTC */

SELECT GETUTCDATE() AS UTCTime,
GETUTCDATE() AT TIME ZONE 'Hawaiian Standard Time'

SELECT GETUTCDATE() AS UTCTime
,GETUTCDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Hawaiian Standard Time'