-- COMMAND: xp_copy_file, xp_copy_files and xp_delete_files
-- RELEASE: SQL Server 2019
-- LINK: N/A

/* Copy single file, NO wildcard allowed */
exec master.sys.xp_copy_file 'C:\Demos\New\SomeText.txt' -- source
, 'C:\Demos\Old\SomeText_old.txt' -- destination
 
/* Copy multiple files, Wildcard allowed */
exec master.sys.xp_copy_files 'C:\Demos\New\Some*.txt' -- source
, 'C:\Demos\Old\' -- destination
 
/* Delete files, Wildcard allowed */
exec master.sys.xp_delete_files 'C:\Demos\New\Some*.txt' -- source