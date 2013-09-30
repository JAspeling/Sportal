USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[AddGroupMember]    Script Date: 09/30/2013 14:08:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddGroupMember]
@GroupName VARCHAR(30),
@Username VARCHAR(50)
AS

	DECLARE @UserID INT
	SET @UserID = (SELECT UserID FROM Users WHERE Username = @Username)
	DECLARE @GroupID INT
	SET @GroupID = (SELECT COUNT(GroupID) FROM GroupHouse WHERE GroupName = @GroupName)
	
	IF @GroupID > 0
		BEGIN
			INSERT INTO UserGoup (GroupID, UserID)
			VALUES (@GroupID, @UserID)
		END

GO

