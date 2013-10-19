--Tested
USE SPortalDb
GO

CREATE PROCEDURE [dbo].[RegisterUser]
@Username VARCHAR(50),
@Password VARCHAR(50),
@Email VARCHAR(50),
@Name VARCHAR(50),
@Surname VARCHAR(50),
@DOB Date,
@Picture VARCHAR(50),
@UserTypeID INT
AS
BEGIN
OPEN SYMMETRIC KEY Login_Cert DECRYPTION BY CERTIFICATE Login_Cert
INSERT INTO Users
(Username,UserPassword,Email,Name,Surname,DOB,JoinDate,UserTypeID,InstitutionID,Picture)
VALUES (@Username,encryptbykey(key_guid('Login_Cert'),@Password),encryptbykey(key_guid('Login_Cert'),@Email),@Name,@Surname,@DOB,CONVERT(DATE,GETDATE()),@UserTypeID,1,@Picture)
CLOSE SYMMETRIC KEY login_key
END