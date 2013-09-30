USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectUserType]    Script Date: 09/30/2013 14:12:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectUserType]
@Username VARCHAR(50)
AS

SELECT UserTypeID
	FROM Users
		WHERE Username = @Username
GO

