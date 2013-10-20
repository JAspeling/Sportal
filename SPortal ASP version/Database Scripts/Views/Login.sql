USE SPortalDb
GO

CREATE VIEW LoginView
AS
SELECT Username, UserPassword
FROM Users
