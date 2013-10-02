USE [SPortalDb]
GO

/****** Object:  Table [dbo].[Topic]    Script Date: 09/30/2013 14:06:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [varchar](100) NULL,
	[TopicDescription] [text] NULL,
	[TopicBody] [text] NOT NULL,
	[CreationDate] [datetime2](7) NULL,
	[Upvotes] [int] NOT NULL,
	[Downvotes] [int] NOT NULL,
	[AmountOfPosts] [int] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

