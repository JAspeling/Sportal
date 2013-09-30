USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[CreateGroup]    Script Date: 09/30/2013 14:08:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateGroup]
@GroupName VARCHAR(30),
@Description VARCHAR(300),
@Username VARCHAR(50),
@Limited SMALLINT
AS
	DECLARE @UserID INT
	SET @UserID = (SELECT UserID FROM Users WHERE Username LIKE @Username)
	
	INSERT INTO GroupHouse
		(GroupName,Description,FoundedDate,Limited)
		VALUES (@GroupName,@Description,CONVERT(DATE,GETDATE()),@Limited)
	
	

	

GO

