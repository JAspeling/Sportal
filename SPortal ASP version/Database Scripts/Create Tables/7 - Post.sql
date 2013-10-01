USE [SPortalDb]
GO

/****** Object:  Table [dbo].[Post]    Script Date: 09/30/2013 14:06:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NULL,
	[Text] text NULL,
	[UserID] [int] NULL,
	[Upvotes] [smallint] NULL,
	[DownVotes] [smallint] NULL,
	[SubmissionDate] [datetime2](7) NULL,
	[PostTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO

ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([PostTypeID])
REFERENCES [dbo].[PostType] ([PostTypeID])
GO

ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

