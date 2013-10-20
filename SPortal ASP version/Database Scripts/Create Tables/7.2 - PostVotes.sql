USE [SPortalDb]
GO

/****** Object:  Table [dbo].[PostVotes]    Script Date: 2013-10-20 03:06:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PostVotes](
	[PostVotesID] [int] IDENTITY(1,1) NOT NULL,
	[Upvote] [smallint] NULL,
	[Downvote] [smallint] NULL,
	[PostID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_PostVotes] PRIMARY KEY CLUSTERED 
(
	[PostVotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PostVotes]  WITH CHECK ADD  CONSTRAINT [FK_PostVotes_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO

ALTER TABLE [dbo].[PostVotes] CHECK CONSTRAINT [FK_PostVotes_Post]
GO

ALTER TABLE [dbo].[PostVotes]  WITH CHECK ADD  CONSTRAINT [FK_PostVotes_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[PostVotes] CHECK CONSTRAINT [FK_PostVotes_Users]
GO


