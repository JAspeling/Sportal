USE [SPortalDb]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 09/30/2013 14:12:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUser]
@Username VARCHAR(50), 
@Email VARCHAR(50), 
@Name VARCHAR(50), 
@Surname VARCHAR(50), 
@DOB DATETIME2, 
@Picture VARCHAR(50),
@Institution VARCHAR(50), 
@Rating INT
AS

DECLARE @InstitutionID INT;
SET @InstitutionID = 0;
	SELECT @InstitutionID = [InstitutionID]
		FROM Institution
			WHERE Institution = @Institution
	
	IF @InstitutionID > 0
	BEGIN
	
	UPDATE Users
		SET Username = @Username, Email = @Email, Name = @Name, Surname = @Surname, 
			DOB = @DOB, Picture = @Picture, InstitutionID = @InstitutionID, Rating = @Rating
	END
	
	ELSE
	BEGIN
	
	INSERT INTO Institution (Institution) VALUES (@Institution)
		
	UPDATE Users
		SET Username = @Username, Email = @Email, Name = @Name, Surname = @Surname, 
			DOB = @DOB, Picture = @Picture, InstitutionID = @InstitutionID, Rating = @Rating
	
	END
GO

