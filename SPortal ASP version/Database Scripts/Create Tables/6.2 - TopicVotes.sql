USE [SPortalDb]
GO

/****** Object:  Table [dbo].[TopicVotes]    Script Date: 2013-10-20 03:05:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TopicVotes](
	[TopicVotesID] [int] IDENTITY(1,1) NOT NULL,
	[Upvote] [smallint] NULL,
	[Downvote] [smallint] NULL,
	[UserID] [int] NULL,
	[TopicID] [int] NULL,
 CONSTRAINT [PK_TopicVotes] PRIMARY KEY CLUSTERED 
(
	[TopicVotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TopicVotes]  WITH CHECK ADD  CONSTRAINT [FK_TopicVotes_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([TopicID])
GO

ALTER TABLE [dbo].[TopicVotes] CHECK CONSTRAINT [FK_TopicVotes_Topic]
GO

ALTER TABLE [dbo].[TopicVotes]  WITH CHECK ADD  CONSTRAINT [FK_TopicVotes_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[TopicVotes] CHECK CONSTRAINT [FK_TopicVotes_Users]
GO


