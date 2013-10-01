USE SPortalDb
GO
BEGIN
INSERT INTO Institution (Institution) VALUES ('Unspecified')
INSERT INTO Institution (Institution) VALUES ('Belgium Campus');
INSERT INTO Institution (Institution) VALUES ('Tuks');
INSERT INTO Institution (Institution) VALUES ('Potch');

INSERT INTO UserType ([Type]) VALUES ('Admin');
INSERT INTO UserType ([Type]) VALUES ('User');
INSERT INTO UserType ([Type]) VALUES ('Staff');
INSERT INTO UserType ([Type]) VALUES ('Moderator');

INSERT INTO Users (Username, Email, UserPassword, Name, Surname, DOB, JoinDate, UserTypeID, InstitutionID, Picture, Rating)
	VALUES ('Admin', 'admin@SPortal.com', '11ed88537bed5fdef126d800ec715ee4', 'John', 'Doe', CONVERT(DATE,GETDATE()), CONVERT(DATE,GETDATE()), 1, 1, 'testPath.png', 0);
INSERT INTO Users (Username, Email, UserPassword, Name, Surname, DOB, JoinDate, UserTypeID, InstitutionID, Picture, Rating)
	VALUES ('THE LEG', 'Leg@SPortal.com', '11ed88537bed5fdef126d800ec715ee4', 'Carel', 'de Bruyn', CONVERT(DATE,GETDATE()), CONVERT(DATE,GETDATE()), 2, 2, 'testPath.png', 0);
INSERT INTO Users (Username, Email, UserPassword, Name, Surname, DOB, JoinDate, UserTypeID, InstitutionID, Picture, Rating)
	VALUES ('XcyTheR', 'xcyther@SPortal.com', '11ed88537bed5fdef126d800ec715ee4', 'Johan', 'Aspeling', CONVERT(DATE,GETDATE()), CONVERT(DATE,GETDATE()), 2, 2, 'testPath.png', 0);
INSERT INTO Users (Username, Email, UserPassword, Name, Surname, DOB, JoinDate, UserTypeID, InstitutionID, Picture, Rating)
	VALUES ('Razor', 'razor@SPortal.com', '11ed88537bed5fdef126d800ec715ee4', 'Gerhard', 'Nel', CONVERT(DATE,GETDATE()), CONVERT(DATE,GETDATE()), 2, 2, 'testPath.png', 0);

INSERT INTO Topic (TopicName, TopicDescription, CreationDate) VALUES ('A Multi-threading Example', 'You might have wanted to execute several codes concurrently on Windows Forms, but you may encountered the Cross-Thread Operation error or faced your application in a dead mood. There are several ways of preventing the application from hanging. Here, I just want to show a simple way to beginners of how it is easy to achieve such a goal in a very straightforward way.

A couple of months ago, I wanted to start ProgressBar while at the same time doing something else within my application. So, the idea of multi-threading came up. Surely you have to separate the tasks using thread philosophy and also get the application away from hanging. I found some useful articles on the net that allowed me to complete my task successfully. Now I just want to disclose this little experience with those who have the same problem....', CONVERT(DATE,GETDATE()));
INSERT INTO Topic (TopicName, TopicDescription, CreationDate) VALUES ('A Beginner''s Tutorial for Understanding Windows Communication Foundation (WCF)', 'This article is an introduction to the Windows Communication Foundation (WCF). We will try to see the basic concepts behind WCF and will try to implement a small WCF service. We will also work out some small examples of how a WCF service can be consumed.', CONVERT(DATE,GETDATE()));
INSERT INTO Topic (TopicName, TopicDescription, CreationDate) VALUES ('Basic Introduction/Tutorial to writing sockets in C#', 'Is there any basic tutorial to writing sockets in c#? I have looked around for a while and still have not found a in-depth tutorial about how to go doing it..
Any help is appreciated.', CONVERT(DATE,GETDATE()));

INSERT INTO PostType ([Type]) VALUES ('Parent');
INSERT INTO PostType ([Type]) VALUES ('Child');

--- Threading topic & Posts
INSERT INTO Post (CommentID, DownVotes, Upvotes, PostTypeID, SubmissionDate, [Text], UserID) 
	VALUES (NULL, 0, 0, 1, CONVERT(DATE,GETDATE()), 'Tutorial Starts here:', 2);
INSERT INTO TopicPost (PostID, TopicID) VALUES (1, 1);

INSERT INTO Post (CommentID, DownVotes, Upvotes, PostTypeID, SubmissionDate, [Text], UserID) 
	VALUES (NULL, 0, 0, 1, CONVERT(DATE,GETDATE()), 'Tutorial continues...', 1);
INSERT INTO TopicPost (PostID, TopicID) VALUES (2, 1);

INSERT INTO Post (CommentID, DownVotes, Upvotes, PostTypeID, SubmissionDate, [Text], UserID) 
	VALUES (NULL, 0, 0, 1, CONVERT(DATE,GETDATE()), 'Tutorial Ends', 4);
INSERT INTO TopicPost (PostID, TopicID) VALUES (3, 1);

-- Wcf Topic
INSERT INTO Post (CommentID, DownVotes, Upvotes, PostTypeID, SubmissionDate, [Text], UserID) 
	VALUES (NULL, 0, 0, 1, CONVERT(DATE,GETDATE()), 'Nobody knows anything about this', 1);
INSERT INTO TopicPost (PostID, TopicID) VALUES (4, 2);

-- Sockets Topic
INSERT INTO Post (CommentID, DownVotes, Upvotes, PostTypeID, SubmissionDate, [Text], UserID) 
	VALUES (NULL, 0, 0, 1, CONVERT(DATE,GETDATE()), 'Microsoft MSDN is a great tool to help with sockets', 2);
INSERT INTO TopicPost (PostID, TopicID) VALUES (5, 3);

INSERT INTO Post (CommentID, DownVotes, Upvotes, PostTypeID, SubmissionDate, [Text], UserID) 
	VALUES (NULL, 0, 0, 1, CONVERT(DATE,GETDATE()), 'Topic Closed', 1);
INSERT INTO TopicPost (PostID, TopicID) VALUES (6, 3);
END