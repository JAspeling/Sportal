CREATE PROCEDURE JoinInstitutionRequest
@Name VARCHAR(30),
@Username VARCHAR(50)
AS
DECLARE @UserID INT
DECLARE @InstitutionID INT
BEGIN
	SELECT @UserID = UserID FROM Users WHERE Username = @Username
	SELECT @InstitutionID = InstitutionID FROM Institution WHERE Institution = @Name
	if (NOT @UserID = null AND @InstitutionID = null)
	BEGIN
		INSERT INTO InstitutionInvites (InstitutionID,UserID) VALUES (@InstitutionID, @UserID)
	END
END
GO