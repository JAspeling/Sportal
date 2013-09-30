USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 09/30/2013 14:09:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterUser]
@Username VARCHAR(50),
@Password VARCHAR(50),
@Email VARCHAR(50),
@Name VARCHAR(50),
@Surname VARCHAR(50),
@DOB Date,
@Picture VARCHAR(50),
@UserTypeID INT
AS
BEGIN
INSERT INTO Users
(Username,UserPassword,Email,Name,Surname,DOB,JoinDate,UserTypeID,InstitutionID,Picture)
VALUES (@Username,@Password,@Email,@Name,@Surname,@DOB,CONVERT(DATE,GETDATE()),@UserTypeID,1,@Picture)
END


GO

