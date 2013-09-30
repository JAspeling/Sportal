USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectUserInfo]    Script Date: 09/30/2013 14:11:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectUserInfo]
@Username VARCHAR(30)
AS
SELECT Username, Email, Name, Surname, DOB, Institution, Rating, JoinDate
FROM Users U INNER JOIN Institution I
	ON U.InstitutionID = I.InstitutionID
WHERE Username = @Username
GO

