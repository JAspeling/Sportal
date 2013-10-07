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
CREATE PROCEDURE CreateTopic
	@TopicName varchar(100),
	@Description text,
	@Text text,
	@Username varchar(100),
	@Type int
AS
BEGIN

	DECLARE @UserID INT
	SET @UserID = (SELECT UserID FROM Users WHERE Username = @Username)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Topic (TopicName, TopicDescription, TopicBody, CreationDate, Upvotes, Downvotes, TopicTypeID, CreatedBy)
		VALUES (@TopicName, @Description, @Text, CONVERT(DATE,GETDATE()), 0, 0, @Type, @UserID);
END
GO
