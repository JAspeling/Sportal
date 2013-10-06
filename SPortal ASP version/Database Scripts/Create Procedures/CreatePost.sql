USE [SPortalDb]
GO
/****** Object:  StoredProcedure [dbo].[CreatePost]    Script Date: 10/06/2013 11:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CreatePost]
@PostTypeID INT,
@Text VARCHAR(MAX),
@Username VARCHAR(50)
AS
DECLARE @UserID INT;
DECLARE @PostID INT;
SET @UserID = 0;

SELECT @UserID = [UserID]
	FROM Users
		WHERE Username = @Username
		
IF @UserID > 0
BEGIN

INSERT INTO Post (Text, UserID, UpVotes, DownVotes, SubmissionDate)
	VALUES (@Text, @UserID, 0, 0, CONVERT(DATETIME2,GETDATE()));
	
SET @PostID = SCOPE_IDENTITY();

INSERT INTO PostViews (PostID, UserID, VoteUp, VoteDown)
	VALUES (@PostID, @UserID, 0, 0);

END
