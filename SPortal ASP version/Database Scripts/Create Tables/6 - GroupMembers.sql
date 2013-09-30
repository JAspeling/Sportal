USE [SPortalDb]
GO

/****** Object:  Table [dbo].[GroupMembers]    Script Date: 09/30/2013 14:07:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GroupMembers](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupHouse] ([GroupID])
GO

ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[MemberRole] ([RoleID])
GO

ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

