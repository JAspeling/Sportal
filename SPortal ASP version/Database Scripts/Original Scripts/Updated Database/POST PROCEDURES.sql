USE SPortalDb

GO
CREATE PROC CreatePost
@PostTypeID INT,
@Text VARCHAR(MAX),
@Username VARCHAR(50)
AS
DECLARE @UserID INT;
SET @UserID = 0;

SELECT @UserID = [UserID]
	FROM Users
		WHERE Username = @Username
		
IF @UserID > 0
BEGIN

INSERT INTO Post (Text, UserID, UpVotes, DownVotes, SubmissionDate)
	VALUES (@Text, @UserID, 0, 0, CONVERT(DATETIME2,GETDATE()))

END

GO
CREATE PROC SelectPostsByUser
@Username VARCHAR(50)
AS
	
SELECT PostID
FROM Post 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = @Username)

GO
CREATE PROC SelectPostByPostID
@PostID INT
AS

SELECT Type, PostID, CommentID, Username, Upvotes, DownVotes, SubmissionDate
FROM Post P INNER JOIN PostType PT
	ON P.PostTypeID = PT.PostTypeID
		INNER JOIN Users U
			ON U.UserID = P.UserID
			
GO
CREATE PROCEDURE SelectPostsByTopicID
@TopicID INT
AS

SELECT TP.PostID
	FROM TopicPost TP INNER JOIN Post P
		ON TP.PostID = P.PostID
			WHERE TopicID = @TopicID 
			