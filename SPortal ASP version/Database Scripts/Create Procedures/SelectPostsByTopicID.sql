USE [SPortalDb]
GO
/****** Object:  StoredProcedure [dbo].[SelectPostsByTopicID]    Script Date: 10/06/2013 14:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectPostsByTopicID]
	@TopicID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pt.[Type] AS [PostType], p.PostID, p.CommentID, u.Username, p.[Text], p.Upvotes, p.DownVotes, p.SubmissionDate
	FROM PostType pt INNER JOIN Post p
	ON pt.PostTypeID = p.PostTypeID INNER JOIN TopicPost tp
	ON p.PostID = tp.PostID INNER JOIN Topic t
	ON tp.TopicID = t.TopicID INNER JOIN Users u
	ON p.UserID = u.UserID
	WHERE t.TopicID = @TopicID
END
