

DECLARE @distributor AS sysname;
DECLARE @distributionDB AS sysname;
DECLARE @publisher AS sysname;
DECLARE @directory AS nvarchar(500);
DECLARE @publicationDB AS sysname;

SET @distributor = 'C:\\inetpub\wwwroot\SPORTALSERVER\ ';
SET @distributionDB = N'SPortalDbDistributor';
SET @publisher = 'C:\\inetpub\wwwroot\SPORTALSERVER\';
SET @directory = N'\\C:\DATABASE\repldata';
SET @publicationDB = N'SPortalDb'; 


USE master
EXEC sp_adddistributor @distributor = @distributor;
--Will Auto generate the defaults and the password.


USE master
EXEC sp_adddistributiondb @database = @distributionDB, 
    @security_mode = 1;
	--Sets authentication mode to Windows authentication
GO


--enable SPortal for replication
DECLARE @distributionDB AS sysname;
DECLARE @publisher AS sysname;
SET @distributionDB = N'SportalDb';

SET @publisher = 'C:\\inetpub\wwwroot\SPORTALSERVER\';

USE [SportalDb]
EXEC sp_adddistpublisher @publisher=@publisher, 
    @distribution_db=@distributionDB, 
    @security_mode = 1;
GO 

