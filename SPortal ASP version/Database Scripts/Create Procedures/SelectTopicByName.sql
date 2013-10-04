-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
USE SPortalDb
GO

CREATE PROCEDURE SelectTopicByName
	@TopicName varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TopicID, TopicName, TopicBody, TopicDescription, CreationDate, Upvotes, Downvotes, tt.[Type] AS [TopicType]
	FROM Topic t INNER JOIN TopicType tt
	ON t.TopicTypeID = tt.TopicTypeID
	WHERE TopicName = @TopicName;
END
GO
