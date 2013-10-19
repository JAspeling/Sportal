USE SPortalDb
GO

CREATE VIEW UserDetails
AS
SELECT Username, Email, Name, Surname, DOB as [Date of Birth],
		Institution, Picture
	FROM Users , Institution
	
	