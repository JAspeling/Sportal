CREATE PROCEDURE CreateGroup
@GroupName VARCHAR(30),
@Description VARCHAR(300),
@Username VARCHAR(50),
@Limited SMALLINT
AS

BEGIN

INSERT INTO GroupHouse (GroupName, Description, Creator, FoundedDate, Limited) 
	VALUES ( @GropuName, @Description, 'SELECT TOP 1 UserID FROM Users WHERE Username = @Username', Date.Now(), @Limited)

END 

GO
CREATE PROCEDURE AddGroupMember
@GroupName VARCHAR(30),
@UserName VARCHAR(50)
AS

BEGIN 
	IF EXISTS (SELECT GroupID FROM Users WHERE GroupName = @GroupName)
	BEGIN
		INSERT INTO UserGroup (GroupID, UserID)
			VALUES ( 'SELECT TOP 1 GroupID FROM GroupHouse WHERE GroupName = @GroupName',
					 'SELECT TOP 1 UserID FROM Users WHERE Username = @Username')
	END
	ELSE
		BEGIN
			ROLLBACK TRANSACTION
			--RAISERROR 
		END
END 

GO
CREATE PROCEDURE RemoveGroupMember
@GroupName VARCHAR(30),
@UserName VARCHAR(50)
AS

BEGIN 
	DELETE 
	FROM UserGroup
	WHERE GroupID IN (SELECT GroupID FROM GroupHouse WHERE GroupName = @GroupName) AND
		  UserID IN (SELECT UserID FROM Users WHERE Username = @Username)
END 

GO
CREATE PROCEDURE SelectGroupsByUsername
@Username VARCHAR(50)
AS

BEGIN 
	SELECT GroupName 
	FROM GroupHouse GH INNER JOIN UserGroup UG
		ON GH.GroupID = UG.GroupID
			INNER JOIN Users U
			ON U.UserID = UG.UserID
	WHERE Username LIKE @Username

END 
