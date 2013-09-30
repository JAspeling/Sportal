USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[CreatePost]    Script Date: 09/30/2013 14:09:05 ******/
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
SET @UserID = 0;

SELECT @UserID = [UserID]
	FROM Users
		WHERE Username = @Username
		
IF @UserID > 0
BEGIN

INSERT INTO Post (Text, UserID, UpVotes, DownVotes, SubmissionDate)
	VALUES (@Text, @UserID, 0, 0, CONVERT(DATETIME2,GETDATE()))

END
GO

