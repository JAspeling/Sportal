USE [SPortalDb]
GO

/****** Object:  Table [dbo].[TopicViews]    Script Date: 2013-10-04 05:57:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TopicViews](
	[TopicViewsID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[VoteUp] [smallint] NOT NULL,
	[VoteDown] [smallint] NOT NULL,
 CONSTRAINT [PK_TopicViews] PRIMARY KEY CLUSTERED 
(
	[TopicViewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TopicViews]  WITH CHECK ADD  CONSTRAINT [FK_TopicViews_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([TopicID])
GO

ALTER TABLE [dbo].[TopicViews] CHECK CONSTRAINT [FK_TopicViews_Topic]
GO

ALTER TABLE [dbo].[TopicViews]  WITH CHECK ADD  CONSTRAINT [FK_TopicViews_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[TopicViews] CHECK CONSTRAINT [FK_TopicViews_Users]
GO


