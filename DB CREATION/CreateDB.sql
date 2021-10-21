----- DB CREATION -------

CREATE DATABASE [Music_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Music_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Music_DB.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Music_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Music_DB_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Music_DB] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [Music_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Music_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Music_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Music_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Music_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Music_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Music_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Music_DB] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [Music_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Music_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Music_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Music_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Music_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Music_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Music_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Music_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Music_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Music_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Music_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Music_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Music_DB] SET  READ_WRITE 
GO
ALTER DATABASE [Music_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Music_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Music_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Music_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Music_DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Music_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [Music_DB]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [Music_DB] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO;

----- SET TABLES --------



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Album]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Album](
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AlbumMusic](
	[AlbumMusicID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumID] [int] NOT NULL,
	[MusicID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AlbumMusicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Artist](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ArtistAlbum](
	[ArtistAlbumID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistID] [int] NOT NULL,
	[AlbumID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistAlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ArtistMusic](
	[ArtistMusicID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistID] [int] NOT NULL,
	[MusicID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistMusicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[License]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[License](
	[LicenseID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseTypeID] [int] NULL,
	[UserID] [int] NULL,
	[Active] [bit] NULL,
	[ExpiredDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LicenseType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LicenseType](
	[LicenseTypeID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LicenseTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoginHistory](
	[LoginHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DatetimeHistory] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Music]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Music](
	[MusicID] [int] IDENTITY(1,1) NOT NULL,
	[MusicName] [nvarchar](50) NULL,
	[MusicDuration] [time](7) NULL,
	[MusicYear] [int] NULL,
	[SubGenreID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MusicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MusicalGenre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MusicalGenre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MusicalHistory](
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](25) NULL,
	[CardName] [nvarchar](25) NULL,
	[CVC] [varchar](7) NULL,
	[ExpirationDate] [date] NULL,
	[Amount] [numeric](14, 2) NULL,
	[CountryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicense]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaymentLicense](
	[PaymentLicenseID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentID] [int] NOT NULL,
	[LicenseID] [int] NOT NULL,
	[HistPaymentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentLicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Playlist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Playlist](
	[PlaylistID] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistName] [nvarchar](25) NOT NULL,
	[PlaylistDate] [date] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PlaylistMusic](
	[PlaylistMusicID] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistID] [int] NOT NULL,
	[MusicID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaylistMusicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publisher]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
	[CountryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubMusicalGenre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubMusicalGenre](
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) MASKED WITH (FUNCTION = 'default()') NULL,
	[LastName] [nvarchar](25) MASKED WITH (FUNCTION = 'default()') NULL,
	[Email] [nvarchar](25) MASKED WITH (FUNCTION = 'email()') NULL,
	[BirthDate] [date] NULL,
	[UserPassword] [nvarchar](25) NULL,
	[CountryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusicAlbumID_AlbumAlbumID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AlbumMusic]'))
ALTER TABLE [dbo].[AlbumMusic]  WITH CHECK ADD  CONSTRAINT [AlbumMusicAlbumID_AlbumAlbumID] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusicAlbumID_AlbumAlbumID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AlbumMusic]'))
ALTER TABLE [dbo].[AlbumMusic] CHECK CONSTRAINT [AlbumMusicAlbumID_AlbumAlbumID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusicMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AlbumMusic]'))
ALTER TABLE [dbo].[AlbumMusic]  WITH CHECK ADD  CONSTRAINT [AlbumMusicMusicID_MusicMusicID] FOREIGN KEY([MusicID])
REFERENCES [dbo].[Music] ([MusicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusicMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AlbumMusic]'))
ALTER TABLE [dbo].[AlbumMusic] CHECK CONSTRAINT [AlbumMusicMusicID_MusicMusicID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Artist]'))
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [ArtistCountryID_CountryCountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Artist]'))
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [ArtistCountryID_CountryCountryID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbumAlbumID_AlbumAlbumID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]'))
ALTER TABLE [dbo].[ArtistAlbum]  WITH CHECK ADD  CONSTRAINT [ArtistAlbumAlbumID_AlbumAlbumID] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbumAlbumID_AlbumAlbumID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]'))
ALTER TABLE [dbo].[ArtistAlbum] CHECK CONSTRAINT [ArtistAlbumAlbumID_AlbumAlbumID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbumArtistID_ArtistArtistID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]'))
ALTER TABLE [dbo].[ArtistAlbum]  WITH CHECK ADD  CONSTRAINT [ArtistAlbumArtistID_ArtistArtistID] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbumArtistID_ArtistArtistID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]'))
ALTER TABLE [dbo].[ArtistAlbum] CHECK CONSTRAINT [ArtistAlbumArtistID_ArtistArtistID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusicArtistID_ArtistArtistID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistMusic]'))
ALTER TABLE [dbo].[ArtistMusic]  WITH CHECK ADD  CONSTRAINT [ArtistMusicArtistID_ArtistArtistID] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusicArtistID_ArtistArtistID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistMusic]'))
ALTER TABLE [dbo].[ArtistMusic] CHECK CONSTRAINT [ArtistMusicArtistID_ArtistArtistID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusicMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistMusic]'))
ALTER TABLE [dbo].[ArtistMusic]  WITH CHECK ADD  CONSTRAINT [ArtistMusicMusicID_MusicMusicID] FOREIGN KEY([MusicID])
REFERENCES [dbo].[Music] ([MusicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusicMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistMusic]'))
ALTER TABLE [dbo].[ArtistMusic] CHECK CONSTRAINT [ArtistMusicMusicID_MusicMusicID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LicenseLicenseTypeID_LicenseTypeLicenseTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[License]'))
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [LicenseLicenseTypeID_LicenseTypeLicenseTypeID] FOREIGN KEY([LicenseTypeID])
REFERENCES [dbo].[LicenseType] ([LicenseTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LicenseLicenseTypeID_LicenseTypeLicenseTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[License]'))
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [LicenseLicenseTypeID_LicenseTypeLicenseTypeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LicenseUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[License]'))
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [LicenseUserID_UsersUserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LicenseUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[License]'))
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [LicenseUserID_UsersUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LoginHistoryUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoginHistory]'))
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [LoginHistoryUserID_UsersUserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LoginHistoryUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoginHistory]'))
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [LoginHistoryUserID_UsersUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicPublisherID_PublisherPublisherID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Music]'))
ALTER TABLE [dbo].[Music]  WITH CHECK ADD  CONSTRAINT [MusicPublisherID_PublisherPublisherID] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicPublisherID_PublisherPublisherID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Music]'))
ALTER TABLE [dbo].[Music] CHECK CONSTRAINT [MusicPublisherID_PublisherPublisherID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicSubGenreID_SubMusicalGenreSubGenreID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Music]'))
ALTER TABLE [dbo].[Music]  WITH CHECK ADD  CONSTRAINT [MusicSubGenreID_SubMusicalGenreSubGenreID] FOREIGN KEY([SubGenreID])
REFERENCES [dbo].[SubMusicalGenre] ([SubGenreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicSubGenreID_SubMusicalGenreSubGenreID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Music]'))
ALTER TABLE [dbo].[Music] CHECK CONSTRAINT [MusicSubGenreID_SubMusicalGenreSubGenreID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistoryMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[MusicalHistory]'))
ALTER TABLE [dbo].[MusicalHistory]  WITH CHECK ADD  CONSTRAINT [MusicalHistoryMusicID_MusicMusicID] FOREIGN KEY([MusicID])
REFERENCES [dbo].[Music] ([MusicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistoryMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[MusicalHistory]'))
ALTER TABLE [dbo].[MusicalHistory] CHECK CONSTRAINT [MusicalHistoryMusicID_MusicMusicID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistoryUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[MusicalHistory]'))
ALTER TABLE [dbo].[MusicalHistory]  WITH CHECK ADD  CONSTRAINT [MusicalHistoryUserID_UsersUserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistoryUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[MusicalHistory]'))
ALTER TABLE [dbo].[MusicalHistory] CHECK CONSTRAINT [MusicalHistoryUserID_UsersUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PaymentCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Payment]'))
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [PaymentCountryID_CountryCountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PaymentCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Payment]'))
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [PaymentCountryID_CountryCountryID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicenseLicenseID_LicenseLicenseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaymentLicense]'))
ALTER TABLE [dbo].[PaymentLicense]  WITH CHECK ADD  CONSTRAINT [PaymentLicenseLicenseID_LicenseLicenseID] FOREIGN KEY([LicenseID])
REFERENCES [dbo].[License] ([LicenseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicenseLicenseID_LicenseLicenseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaymentLicense]'))
ALTER TABLE [dbo].[PaymentLicense] CHECK CONSTRAINT [PaymentLicenseLicenseID_LicenseLicenseID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicensePaymentID_PaymentPaymentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaymentLicense]'))
ALTER TABLE [dbo].[PaymentLicense]  WITH CHECK ADD  CONSTRAINT [PaymentLicensePaymentID_PaymentPaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicensePaymentID_PaymentPaymentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaymentLicense]'))
ALTER TABLE [dbo].[PaymentLicense] CHECK CONSTRAINT [PaymentLicensePaymentID_PaymentPaymentID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Playlist]'))
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD  CONSTRAINT [PlaylistUserID_UsersUserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistUserID_UsersUserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Playlist]'))
ALTER TABLE [dbo].[Playlist] CHECK CONSTRAINT [PlaylistUserID_UsersUserID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusicMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]'))
ALTER TABLE [dbo].[PlaylistMusic]  WITH CHECK ADD  CONSTRAINT [PlaylistMusicMusicID_MusicMusicID] FOREIGN KEY([MusicID])
REFERENCES [dbo].[Music] ([MusicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusicMusicID_MusicMusicID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]'))
ALTER TABLE [dbo].[PlaylistMusic] CHECK CONSTRAINT [PlaylistMusicMusicID_MusicMusicID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusicPlaylistID_PlaylistPlaylistID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]'))
ALTER TABLE [dbo].[PlaylistMusic]  WITH CHECK ADD  CONSTRAINT [PlaylistMusicPlaylistID_PlaylistPlaylistID] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlist] ([PlaylistID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusicPlaylistID_PlaylistPlaylistID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]'))
ALTER TABLE [dbo].[PlaylistMusic] CHECK CONSTRAINT [PlaylistMusicPlaylistID_PlaylistPlaylistID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PublisherCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publisher]'))
ALTER TABLE [dbo].[Publisher]  WITH CHECK ADD  CONSTRAINT [PublisherCountryID_CountryCountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PublisherCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publisher]'))
ALTER TABLE [dbo].[Publisher] CHECK CONSTRAINT [PublisherCountryID_CountryCountryID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SubMusicalGenreGenreID_MusicalGenreGenreID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubMusicalGenre]'))
ALTER TABLE [dbo].[SubMusicalGenre]  WITH CHECK ADD  CONSTRAINT [SubMusicalGenreGenreID_MusicalGenreGenreID] FOREIGN KEY([GenreID])
REFERENCES [dbo].[MusicalGenre] ([GenreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SubMusicalGenreGenreID_MusicalGenreGenreID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubMusicalGenre]'))
ALTER TABLE [dbo].[SubMusicalGenre] CHECK CONSTRAINT [SubMusicalGenreGenreID_MusicalGenreGenreID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UsersCountryID_CountryCountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[UsersCountryID_CountryCountryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UsersCountryID_CountryCountryID]
GO
