USE SPortalDb

GO
CREATE PROCEDURE SelectUserInfo
@Username VARCHAR(30)
AS
SELECT Username, Email, Name, Surname, DOB, Institution, Rating, JoinDate
FROM Users U INNER JOIN Institution I
	ON U.InstitutionID = I.InstitutionID
WHERE Username = @Username

GO
CREATE PROCEDURE RegisterUser
@Username VARCHAR(50),
@Password VARCHAR(50),
@Email VARCHAR(50),
@Name VARCHAR(50),
@Surname VARCHAR(50),
@DOB DATETIME2,
@Picture VARCHAR(50),
@UserTypeID INT
AS

INSERT INTO Users
(Username,UserPassword,Email,Name,Surname,DOB,JoinDate,UserTypeID,InstitutionID,Picture)
VALUES (@Username,@Password,@Email,@Name,@Surname,@DOB,CONVERT(DATE,GETDATE()),@UserTypeID,1,@Picture)


GO
CREATE PROCEDURE LoginUser
@Username VARCHAR(50),
@Password VARCHAR(50)
AS

SELECT Username FROM Users
	WHERE Username = @Username
		AND UserPassword = @Password

GO
CREATE PROCEDURE UpdateUser
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
CREATE PROCEDURE SelectUsersByInstiitution
@Institution VARCHAR(50)
AS

SELECT Username
	FROM Users 
		WHERE InstitutionID = (SELECT InstitutionID FROM Institution WHERE Institution LIKE @Institution)
		
GO
CREATE PROCEDURE SelectUsersByGroup
@GroupName VARCHAR(30)
AS

SELECT Username
	FROM Users U INNER JOIN UserGoup UG
		ON U.UserID = UG.UserID
			INNER JOIN GroupHouse GH
				ON UG.GroupID = GH.GroupID
	WHERE GroupName = @GroupName

GO
CREATE PROCEDURE SelectUserType
@Username VARCHAR(50)
AS

SELECT UserTypeID
	FROM Users
		WHERE Username = @Username