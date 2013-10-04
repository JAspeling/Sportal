USE [SPortalDb]
GO

/****** Object:  Table [dbo].[PostViews]    Script Date: 2013-10-04 05:57:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PostViews](
	[ViewsID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[VoteUp] [smallint] NULL,
	[VoteDown] [smallint] NULL,
 CONSTRAINT [PK_Post Views] PRIMARY KEY CLUSTERED 
(
	[ViewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PostViews]  WITH CHECK ADD  CONSTRAINT [FK_Post Views_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO

ALTER TABLE [dbo].[PostViews] CHECK CONSTRAINT [FK_Post Views_Post]
GO

ALTER TABLE [dbo].[PostViews]  WITH CHECK ADD  CONSTRAINT [FK_Post Views_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[PostViews] CHECK CONSTRAINT [FK_Post Views_Users]
GO


