USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[SelectUsersByInstiitution]    Script Date: 09/30/2013 14:11:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectUsersByInstiitution]
@Institution VARCHAR(50)
AS

SELECT Username
	FROM Users 
		WHERE InstitutionID = (SELECT InstitutionID FROM Institution WHERE Institution LIKE @Institution)
GO

