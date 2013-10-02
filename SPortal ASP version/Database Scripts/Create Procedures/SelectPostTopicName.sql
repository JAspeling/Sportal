USE SPortalDb
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SelectPostTopicName
	-- Add the parameters for the stored procedure here
	@PostID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.TopicName
	FROM Post p INNER JOIN TopicPost tp 
	ON p.PostID = tp.PostID INNER JOIN Topic t
	ON tp.TopicID = t.TopicID
	WHERE p.PostID = @PostID;
END
GO