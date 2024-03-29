USE [SPortalDb]
GO
/****** Object:  StoredProcedure [dbo].[SelectGroupByGroupName]    Script Date: 2013-10-21 03:37:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectGroupByGroupName]
@GroupName VARCHAR(200)
AS

	SELECT g.GroupID, t.TopicName, t.TopicDescription, g.Limited, t.CreationDate, u.Username
	FROM [Group] g INNER JOIN Topic t
	ON g.GroupID = t.TopicID INNER JOIN Users u
	ON t.CreatedBy = u.UserID
	WHERE t.TopicName LIKE @GroupName

	GO