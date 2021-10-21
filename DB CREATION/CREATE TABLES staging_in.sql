USE Music_DB
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
BEGIN
EXEC('CREATE SCHEMA staging')
END;

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[MusicalHistory_in]') AND type in (N'U'))
BEGIN
CREATE TABLE 	staging.MusicalHistory_in (
	MusicalHistoryID	 nvarchar(100) NULL,
	UserID	 nvarchar(100) NULL,
	MusicID	 nvarchar(100) NULL,
	DateCreated	 nvarchar(100) NULL	
);
END;
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[Album_in]') AND type in (N'U'))
BEGIN
CREATE TABLE staging.Album_in		(
	AlbumID	        nvarchar(100) NULL ,
	[Name]		nvarchar(100) NULL,
	YearRelease	nvarchar(100) NULL ,
	Duration	nvarchar(100) NULL
)
END;
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[SubMusicalGenre_in]') AND type in (N'U'))
BEGIN
CREATE TABLE staging.SubMusicalGenre_in	(	
	sub_GenreID nvarchar(100) NULL,
	[Name]	nvarchar(100) NULL,
	GenreID int NOT NULL
)
END;


