USE [SPortalDb]
GO
/****** Object:  StoredProcedure [dbo].[CreatePostReply]    Script Date: 10/10/2013 02:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[CreatePostReply]
@PostTypeID INT,
@Text VARCHAR(MAX),
@Username VARCHAR(50),
@PostID INT
AS
DECLARE @UserID INT;
DECLARE @LatestPostID INT;

SET @UserID = 0;

SELECT @UserID = [UserID]
	FROM Users
		WHERE Username = @Username
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Post (CommentID, [Text], UserID, Upvotes, DownVotes, SubmissionDate, PostTypeID)
		VALUES (@PostID, @Text, @UserID, 0, 0, CONVERT(DATETIME2,GETDATE()), @PostTypeID);
		
SET @LatestPostID = SCOPE_IDENTITY();
	
	INSERT INTO PostViews (PostID, UserID, VoteDown, VoteUp)
	VALUES (@LatestPostID, @UserID, 0, 0);

END
