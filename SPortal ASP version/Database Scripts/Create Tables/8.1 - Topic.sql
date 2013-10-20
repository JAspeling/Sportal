USE [SPortalDb]
GO

/****** Object:  Table [dbo].[Topic]    Script Date: 2013-10-20 03:14:32 PM ******/
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
	[TopicTypeID] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK__Topic__022E0F7D286302EC] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_TopicType] FOREIGN KEY([TopicTypeID])
REFERENCES [dbo].[TopicType] ([TopicTypeID])
GO

ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_TopicType]
GO


