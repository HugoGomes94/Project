USE Music_DB
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
BEGIN
EXEC('CREATE SCHEMA staging')
END;

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[Album_out]') AND type in (N'U'))
BEGIN
CREATE TABLE [staging].[Album_out](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[YearRelease] [int] NULL,
	[Duration] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[MusicalHistory_out]') AND type in (N'U'))
BEGIN
CREATE TABLE [staging].[MusicalHistory_out](
	[MusicalHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[MusicID] [int] NOT NULL,
	[DateCreated] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MusicalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[SubMusicalGenre_out]') AND type in (N'U'))
BEGIN
CREATE TABLE [staging].[SubMusicalGenre_out](
	[SubGenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[GenreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

