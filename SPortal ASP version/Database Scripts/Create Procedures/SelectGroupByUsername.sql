USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectGroupsByUsername]    Script Date: 09/30/2013 14:10:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectGroupsByUsername]
@Username VARCHAR(50)
AS

	SELECT GroupName
	FROM GroupHouse GH INNER JOIN UserGoup UG
	ON GH.GroupID = UG.GroupID
		INNER JOIN Users U
		ON UG.UserID = U.UserID
	WHERE Username = @Username
GO

