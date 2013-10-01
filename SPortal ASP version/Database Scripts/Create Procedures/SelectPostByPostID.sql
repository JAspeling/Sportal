USE [SPortalDb]
GO
/****** Object:  StoredProcedure [dbo].[SelectPostByPostID]    Script Date: 10/01/2013 01:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SelectPostByPostID]
@PostID INT
AS

SELECT [Type] AS [PostTypeID], PostID, CommentID, [Text], Username, Upvotes, DownVotes, SubmissionDate
FROM Post P INNER JOIN PostType PT
	ON P.PostTypeID = PT.PostTypeID
		INNER JOIN Users U
			ON U.UserID = P.UserID
			WHERE PostID = @PostID
