USE myMusic;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicGroups](
	[MusicGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[EstablishedYear] [int] NULL,
	[MostSoldAlbumId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MusicGroups] ADD  CONSTRAINT [PK_MusicGroups] PRIMARY KEY CLUSTERED 
(
	[MusicGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[MusicGroupId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artists] ADD  CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artists]  WITH CHECK ADD  CONSTRAINT [FK_Artists_MusicGroups] FOREIGN KEY([MusicGroupId])
REFERENCES [dbo].[MusicGroups] ([MusicGroupId])
GO
ALTER TABLE [dbo].[Artists] CHECK CONSTRAINT [FK_Artists_MusicGroups]
GO



CREATE TABLE [dbo].[Albums](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[ReleaseYear] [int] NULL,
	[MusicGroupId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Albums] ADD  CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_MusicGroups] FOREIGN KEY([MusicGroupId])
REFERENCES [dbo].[MusicGroups] ([MusicGroupId])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Albums_MusicGroups]
GO

ALTER TABLE [dbo].[MusicGroups]  WITH CHECK ADD  CONSTRAINT [FK_MusicGroups_Albums] FOREIGN KEY([MostSoldAlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
ALTER TABLE [dbo].[MusicGroups] CHECK CONSTRAINT [FK_MusicGroups_Albums]
GO
