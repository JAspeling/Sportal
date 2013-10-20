CREATE DATABASE SPortalDb
ON PRIMARY
(
NAME        = SPortalDb,
FILENAME    = 'C:\DATABASE\SPortalDb.mdf',
SIZE        = 5MB,
MAXSIZE     = UNLIMITED,
FILEGROWTH  = 10
),
FILEGROUP SECONDARY 
(
	NAME        = SPortalDb2,
	FILENAME    = 'C:\DATABASE\SPortalDb2.ndf',
	SIZE        = 5MB,
	MAXSIZE     = UNLIMITED,
	FILEGROWTH  = 10
),
(
	NAME        = SPortalDb4,
	FILENAME    = 'C:\DATABASE\SPortalDb3.ndf',
	SIZE        = 5MB,
	MAXSIZE     = UNLIMITED,
	FILEGROWTH  = 10
),
(
	NAME        = SportDb3,
	FILENAME    = 'C:\DATABASE\SportDb4.ndf',
	SIZE        = 5MB,
	MAXSIZE     = UNLIMITED,
	FILEGROWTH  = 10
)


LOG ON
(
NAME        = SPortalDb_Log,
FILENAME    = 'C:\DATABASE\SPortal_Log.ldf'
)