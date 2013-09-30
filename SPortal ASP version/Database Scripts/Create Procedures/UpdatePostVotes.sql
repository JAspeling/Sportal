USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[UpdatePostVotes]    Script Date: 09/30/2013 14:12:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdatePostVotes]
@PostTypeID INT,
@PostID INT,
@CommentID INT,
@Vote SMALLINT
AS

IF @Vote = 1
BEGIN 
	
	UPDATE Post SET UpVotes = UpVotes + 1 
	WHERE PostTypeID = @PostTypeID AND PostID = @PostID AND CommentID = @CommentID

END

ELSE IF @Vote = -1
BEGIN 

	UPDATE Post SET DownVotes = DownVotes + 1 
	WHERE PostTypeID = @PostTypeID AND PostID = @PostID AND CommentID = @CommentID
END
GO

