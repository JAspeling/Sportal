CREATE PROCEDURE AcceptInstitutionRequest
@Name VARCHAR(30),
@Username VARCHAR(50)
AS
DECLARE @UserID INT
DECLARE @InstitutionID INT
BEGIN
	SELECT @UserID = UserID FROM Users WHERE Username = @Username
	SELECT @InstitutionID = InstitutionID FROM Institution WHERE Institution = @Name
	if ((SELECT count(InstitutionID) FROM InstitutionInvites WHERE InstitutionID = @InstitutionID AND UserID = @UserID) = 0)
	BEGIN
		UPDATE Users SET InstitutionID = InstitutionID WHERE UserID = @UserID
		DELETE FROM InstitutionInvites WHERE InstitutionID = @InstitutionID AND UserID = @UserID
	END
END
GO