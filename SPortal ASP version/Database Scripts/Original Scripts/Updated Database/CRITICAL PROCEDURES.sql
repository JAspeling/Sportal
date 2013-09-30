USE SPortalDb
GO

--6. SelectUserInfo @Username Returns:  Username, Email, Name, Surname, DOB, Picture, Institution, Rating, JoinDate
CREATE PROCEDURE SelectUserInfo
@Username VARCHAR(30)
AS
SELECT Username, Email, Name, Surname, DOB, Institution, Rating, JoinDate
FROM Users U INNER JOIN Institution I
	ON U.InstitutionID = I.InstitutionID
WHERE Username = @Username