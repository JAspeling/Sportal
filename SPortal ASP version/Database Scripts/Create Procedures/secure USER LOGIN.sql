--Tested
USE SPortalDb
GO

CREATE PROCEDURE [dbo].[LoginUser]
@Username VARCHAR(50),
@Password VARCHAR(50)
AS
BEGIN
OPEN SYMMETRIC KEY Login_Cert DECRYPTION BY CERTIFICATE Login_Cert

SELECT Username
FROM Users
WHERE  CONVERT(varchar(50),DecryptByKeyAutoCert(cert_ID('Login_Cert'), NULL,UserPassword)) = @Password 
	AND Username = @Username

CLOSE SYMMETRIC KEY login_key
END
