CREATE PROCEDURE LeaveInstitution
@Name VARCHAR(30)
AS
BEGIN
	UPDATE Users SET InstitutionID = null WHERE Username = @Name
END
GO