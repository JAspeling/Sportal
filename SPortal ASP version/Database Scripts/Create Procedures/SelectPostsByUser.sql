USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectPostsByUser]    Script Date: 09/30/2013 14:11:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SelectPostsByUser]
@Username VARCHAR(50)
AS
	
SELECT PostID
FROM Post 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = @Username)


GO

