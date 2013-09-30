USE SPortalDb
GO

--Registration Procedure
CREATE TABLE UserType(
UserTypeID INT PRIMARY KEY IDENTITY(1,1),
Type VARCHAR(20) NOT NULL)

GO
INSERT INTO UserType (Type) VALUES ('User')

GO
INSERT INTO UserType (Type) VALUES ('Staff')

GO
INSERT INTO UserType (Type) VALUES ('Admin')

GO
CREATE TABLE Institution(
InstitutionID INT PRIMARY KEY IDENTITY(1,1),
Institution VARCHAR(50) NOT NULL)

GO
INSERT INTO Institution
(Institution) VALUES ('Unspecified')

GO
CREATE TABLE Users(
UserID INT PRIMARY KEY IDENTITY(1,1),
Username VARCHAR(50) UNIQUE NOT NULL,
UserPassword VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Name VARCHAR(50) NOT NULL,
Surname VARCHAR(50) NOT NULL,
DOB DATETIME2 NOT NULL,
JoinDate DATETIME2 NOT NULL,
UserTypeID INT NOT NULL,
InstitutionID INT NOT NULL,
Picture VARCHAR(50))

GO
ALTER TABLE Users
ADD CONSTRAINT fk_Users_Institution
FOREIGN KEY (InstitutionID)
REFERENCES Institution(InstitutionID)

GO
ALTER TABLE Users
ADD CONSTRAINT fk_Users_UserType
FOREIGN KEY (UserTypeID)
REFERENCES UserType(UserTypeID)

GO
CREATE PROCEDURE RegisterUser
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
INSERT INTO Users
(Username,UserPassword,Email,Name,Surname,DOB,JoinDate,UserTypeID,InstitutionID,Picture)
VALUES (@Username,@Password,@Email,@Name,@Surname,@DOB,CONVERT(DATE,GETDATE()),@UserTypeID,1,@Picture)
END

GO
INSERT INTO Users
(Username,UserPassword,Email,Name,Surname,DOB,JoinDate,UserTypeID,InstitutionID,Picture)
VALUES ('Admin','f30aa7a662c728b7407c54ae6bfd27d1','admin@something.com','John','Doe','1990/01/01',CONVERT(DATE,GETDATE()),3,1,'')

GO
CREATE PROCEDURE LoginUser
@Username VARCHAR(50),
@Password VARCHAR(50)
AS
BEGIN
SELECT Username FROM Users
WHERE Username = @Username
AND UserPassword = @Password
END

--End Registration Procedure

GO
CREATE TABLE EventNoter(
EventID INT PRIMARY KEY IDENTITY(1,1),
UserID INT FOREIGN KEY(UserID) REFERENCES Users(UserID),
NotificatiobType VARCHAR(30) NOT NULL,
EventDate DATETIME2 NOT NULL
)

GO
CREATE TABLE IMChat(
IMChatID INT PRIMARY KEY IDENTITY(1,1),
SentDate DATETIME NOT NULL,
ReceiptDate DATETIME NOT NULL,
IMessage VARCHAR NOT NULL,
Sender INT NOT NULL,
Receipient INT NOT NULL,
)

--Group Tables
GO
CREATE TABLE GroupHouse(
GroupID INT  PRIMARY KEY IDENTITY(1,1),
GroupName VARCHAR(30),
Description VARCHAR(300) NOT NULL,
Creator INT FOREIGN KEY (Creator) REFERENCES Users(UserID)NOT NULL,
FoundedDate DATETIME2 NOT NULL,
Limited SMALLINT NOT NULL,
)

GO 
CREATE TABLE GroupWall(
WallID INT PRIMARY KEY IDENTITY(1,1),
WallData VARCHAR,
)

GO 
CREATE TABLE GroupPost(
PostID INT PRIMARY KEY IDENTITY(1,1),
GroupID INT FOREIGN KEY (GroupID) REFERENCES GroupHouse(GroupID),
Sender INT FOREIGN KEY (Sender) REFERENCES Users(UserID),
)


GO
CREATE TABLE UserGoup(
UsergroupID INT PRIMARY KEY IDENTITY(1,1),
GroupID INT FOREIGN KEY (GroupID) REFERENCES GroupHouse(GroupID),
UserID INT FOREIGN KEY (UserID) REFERENCES Users(UserID)
)

--End Group Tables 

--Post & Topic Tables

GO 
CREATE TABLE PostType(
PostTypeID INT PRIMARY KEY IDENTITY(1,1),
Type VARCHAR(30) -- PARENT OR CHILD POST
)

GO
CREATE TABLE Post(
PostID INT PRIMARY KEY IDENTITY(1,1),
CommentID INT FOREIGN KEY (PostID) REFERENCES Post (PostID),
Text VARCHAR(MAX),
UserID INT FOREIGN KEY(UserID) REFERENCES Users(UserID),
Upvotes SMALLINT,
DownVotes SMALLINT,
SubmissionDate DATETIME
)

GO 
CREATE TABLE Topic(
TopicID INT PRIMARY KEY IDENTITY(1,1),
TopicName VARCHAR(30),
Description VARCHAR(100),
CreationDate DATETIME2
)

GO 
CREATE TABLE TopicPost(
TPID INT PRIMARY KEY IDENTITY(1,1),
TopicID INT FOREIGN KEY (TopicID) REFERENCES Topic (TopicID),
PostID INT FOREIGN KEY (PostID) REFERENCES Post (PostID)
)

--End of Post Tables

GO
CREATE TABLE CollaborativeProject(
ProjectID INT PRIMARY KEY IDENTITY(1,1),
Heading varchar(30) NOT NULL,
Project XML NOT NULL,
Creator INT FOREIGN KEY (Creator) REFERENCES Users(UserID), 
IsPublic BINARY, 
CreationDate DATETIME2
)

GO
CREATE TABLE Moderator(
ModeratorID INT PRIMARY KEY IDENTITY(1,1),
Moderator INT FOREIGN KEY (Moderator) REFERENCES Users(UserID)NOT NULL,
InitialisationDate DATETIME2 NOT NULL,
)



