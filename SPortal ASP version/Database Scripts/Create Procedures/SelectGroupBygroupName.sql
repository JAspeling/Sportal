USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectGroupByGroupName]    Script Date: 09/30/2013 14:10:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectGroupByGroupName]
@GroupName VARCHAR(30)
AS

	SELECT GroupName
	FROM GroupHouse
	WHERE GroupName LIKE @GroupName
GO

