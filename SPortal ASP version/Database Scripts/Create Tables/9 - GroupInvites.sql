USE [SPortalDb]
GO

/****** Object:  Table [dbo].[GroupInvites]    Script Date: 2013-10-21 07:29:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GroupInvites](
	[InviteID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InviteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[GroupInvites]  WITH CHECK ADD  CONSTRAINT [FK_Group_UserInvites] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Topic] ([TopicID])
GO

ALTER TABLE [dbo].[GroupInvites] CHECK CONSTRAINT [FK_Group_UserInvites]
GO


