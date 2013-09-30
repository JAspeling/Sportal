USE [SPortalDb]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 09/30/2013 14:05:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[JoinDate] [date] NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[InstitutionID] [int] NOT NULL,
	[Picture] [varchar](50) NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_Users_Institution] FOREIGN KEY([InstitutionID])
REFERENCES [dbo].[Institution] ([InstitutionID])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_Users_Institution]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_Users_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([UserTypeID])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_Users_UserType]
GO

