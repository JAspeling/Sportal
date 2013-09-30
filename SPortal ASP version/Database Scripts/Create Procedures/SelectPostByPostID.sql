USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectPostByPostID]    Script Date: 09/30/2013 14:10:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SelectPostByPostID]
@PostID INT
AS

SELECT Type, PostID, CommentID, Username, Upvotes, DownVotes, SubmissionDate
FROM Post P INNER JOIN PostType PT
	ON P.PostTypeID = PT.PostTypeID
		INNER JOIN Users U
			ON U.UserID = P.UserID
GO

