USE [SPortalDb]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SelectPostTopicName]
		@PostID = 1

SELECT	'Return Value' = @return_value

GO
