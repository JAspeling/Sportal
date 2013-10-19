--Tested
USE SPortalDb
GO

CREATE TABLE [dbo].[Users](
	[UserID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[UserPassword] [varbinary](128) NOT NULL,
	[Email] [varbinary](128) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[JoinDate] [date] NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[InstitutionID] [int] NOT NULL,
	[Picture] [varchar](50) NULL,
	[Rating] [int] NULL,
)


CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'SPortalDb123Master<>'

CREATE CERTIFICATE Login_Cert with subject = 'Anti Spam Certificate'

CREATE SYMMETRIC KEY Login_Cert with algorithm =triple_des encryption by certificate Login_Cert