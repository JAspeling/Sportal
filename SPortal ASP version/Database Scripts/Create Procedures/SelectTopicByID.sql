USE [SPortalDb]
GO
/****** Object:  StoredProcedure [dbo].[SelectTopicByID]    Script Date: 10/12/2013 14:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectTopicByID]
	@TopicID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TopicID, TopicName, TopicBody, TopicDescription, CreationDate, Upvotes, Downvotes, tt.[Type] AS [TopicType], u.Username
	FROM Topic t INNER JOIN TopicType tt
	ON t.TopicTypeID = tt.TopicTypeID INNER JOIN Users u
	ON t.CreatedBy = u.UserID
	WHERE t.TopicID = @TopicID;
END

GO