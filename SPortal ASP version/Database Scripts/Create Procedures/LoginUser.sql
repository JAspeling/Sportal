USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 09/30/2013 14:09:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoginUser]
@Username VARCHAR(50),
@Password VARCHAR(50)
AS
BEGIN
SELECT Username FROM Users
WHERE Username = @Username
AND UserPassword = @Password
END

--End Registration Procedure


GO

