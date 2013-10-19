--Only works with sql server 2012, can't test
-- The master key must be in the master database.
USE Master;
GO

-- Create the master key.
CREATE MASTER KEY ENCRYPTION
BY PASSWORD='SPortal123<>?';
GO

-- Create a certificate.
CREATE CERTIFICATE MasterSQLCert
WITH SUBJECT='DATABASE TDE';
GO

-- Use the database to enable TDE.
USE SPortalDb
GO
 
-- Associate the certificate to MyDatabase.
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE MasterSQLCert;
GO

-- Encrypt the database.
ALTER DATABASE SPortalDb
SET ENCRYPTION ON;
GO

--Backup the master key
USE Master
GO

--need the specific server location
BACKUP CERTIFICATE MasterSQLCert
TO FILE = 'C:\DATABASE\MasterSQLCert'
WITH PRIVATE KEY (file='C:\DATABASE\MsterSQLCertKey',
ENCRYPTION BY PASSWORD='SPortal321?>*<')


USE Master
GO

-- Create a new master key.
CREATE MASTER KEY ENCRYPTION
BY PASSWORD = 'Master*SPortal123<>?'
 
-- Restore the certificate.
CREATE CERTIFICATE MasterSQLCert
FROM FILE='C:\DATABASE\MySQLCert'
WITH PRIVATE KEY (
FILE = 'c:\DATABASE\MasterSQLCertKey',
DECRYPTION BY PASSWORD='SPortal321?>*<')

USE master
GO

CREATE PRODECURE MonitorTDE
BEGIN
SELECT * FROM sys.certificates

-- encryption_state = 3 is encrypted
SELECT * FROM sys.dm_database_encryption_keys
  WHERE encryption_state = 3;
END
