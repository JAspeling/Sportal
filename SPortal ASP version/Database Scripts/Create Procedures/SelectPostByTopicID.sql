USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectPostsByTopicID]    Script Date: 09/30/2013 14:11:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectPostsByTopicID]
@TopicID INT
AS

SELECT TP.PostID
	FROM TopicPost TP INNER JOIN Post P
		ON TP.PostID = P.PostID
			WHERE TopicID = @TopicID 
			
GO

