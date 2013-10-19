USE SPortalDb

	
GO
CREATE PROCEDURE GetFriendsByUsername
@Username VARCHAR(50)
AS
SELECT Username
	FROM Users
		WHERE UserID = (SELECT FriendID 
							FROM Friend 
								WHERE RelationID IN (SELECT RelationID
									FROM Users U INNER JOIN Friend F
										ON U.UserID = F.MeID
										WHERE Username = @Username))

			
	