CREATE DATABASE SPortalDb
ON PRIMARY
(
NAME        = SportalDb,
FILENAME    = 'C:\DATABASE\SportalDb.mdf',
SIZE        = 5MB,
MAXSIZE     = UNLIMITED,
FILEGROWTH  = 10
) 

LOG ON
(
NAME        = SportalDb_Log,
FILENAME    = 'C:\DATABASE\SportalDb_Log.ldf'
)