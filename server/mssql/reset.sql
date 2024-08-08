use master

IF EXISTS (SELECT 1
FROM sys.databases
WHERE name = 'comm')
BEGIN
    ALTER DATABASE comm SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE comm
END

create database comm