USE [SPortalDb]
GO

/****** Object:  Table [dbo].[InstitutionInvites]    Script Date: 2013-10-21 07:42:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InstitutionInvites](
	[InstitutionInviteID] [int] IDENTITY(1,1) NOT NULL,
	[InstitutionID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InstitutionInviteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InstitutionInvites]  WITH CHECK ADD  CONSTRAINT [FK_InstitutionInvites_Institution] FOREIGN KEY([InstitutionID])
REFERENCES [dbo].[Institution] ([InstitutionID])
GO

ALTER TABLE [dbo].[InstitutionInvites] CHECK CONSTRAINT [FK_InstitutionInvites_Institution]
GO

ALTER TABLE [dbo].[InstitutionInvites]  WITH CHECK ADD  CONSTRAINT [FK_InstitutionInvites_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[InstitutionInvites] CHECK CONSTRAINT [FK_InstitutionInvites_Users]
GO


