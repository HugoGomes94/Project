CREATE PROCEDURE sp_DROP_FK_SOURCE_TABLES
as

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [UsersCountryID_CountryCountryID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubMusicalGenre]') AND type in (N'U'))
ALTER TABLE [dbo].[SubMusicalGenre] DROP CONSTRAINT IF EXISTS [SubMusicalGenreGenreID_MusicalGenreGenreID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publisher]') AND type in (N'U'))
ALTER TABLE [dbo].[Publisher] DROP CONSTRAINT IF EXISTS [PublisherCountryID_CountryCountryID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]') AND type in (N'U'))
ALTER TABLE [dbo].[PlaylistMusic] DROP CONSTRAINT IF EXISTS [PlaylistMusicPlaylistID_PlaylistPlaylistID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]') AND type in (N'U'))
ALTER TABLE [dbo].[PlaylistMusic] DROP CONSTRAINT IF EXISTS [PlaylistMusicMusicID_MusicMusicID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Playlist]') AND type in (N'U'))
ALTER TABLE [dbo].[Playlist] DROP CONSTRAINT IF EXISTS [PlaylistUserID_UsersUserID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicense]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentLicense] DROP CONSTRAINT IF EXISTS [PaymentLicensePaymentID_PaymentPaymentID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicense]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentLicense] DROP CONSTRAINT IF EXISTS [PaymentLicenseLicenseID_LicenseLicenseID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [PaymentCountryID_CountryCountryID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[MusicalHistory] DROP CONSTRAINT IF EXISTS [MusicalHistoryUserID_UsersUserID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[MusicalHistory] DROP CONSTRAINT IF EXISTS [MusicalHistoryMusicID_MusicMusicID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Music]') AND type in (N'U'))
ALTER TABLE [dbo].[Music] DROP CONSTRAINT IF EXISTS [MusicSubGenreID_SubMusicalGenreSubGenreID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Music]') AND type in (N'U'))
ALTER TABLE [dbo].[Music] DROP CONSTRAINT IF EXISTS [MusicPublisherID_PublisherPublisherID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[LoginHistory] DROP CONSTRAINT IF EXISTS [LoginHistoryUserID_UsersUserID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[License]') AND type in (N'U'))
ALTER TABLE [dbo].[License] DROP CONSTRAINT IF EXISTS [LicenseUserID_UsersUserID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[License]') AND type in (N'U'))
ALTER TABLE [dbo].[License] DROP CONSTRAINT IF EXISTS [LicenseLicenseTypeID_LicenseTypeLicenseTypeID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusic]') AND type in (N'U'))
ALTER TABLE [dbo].[ArtistMusic] DROP CONSTRAINT IF EXISTS [ArtistMusicMusicID_MusicMusicID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusic]') AND type in (N'U'))
ALTER TABLE [dbo].[ArtistMusic] DROP CONSTRAINT IF EXISTS [ArtistMusicArtistID_ArtistArtistID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]') AND type in (N'U'))
ALTER TABLE [dbo].[ArtistAlbum] DROP CONSTRAINT IF EXISTS [ArtistAlbumArtistID_ArtistArtistID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]') AND type in (N'U'))
ALTER TABLE [dbo].[ArtistAlbum] DROP CONSTRAINT IF EXISTS [ArtistAlbumAlbumID_AlbumAlbumID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artist]') AND type in (N'U'))
ALTER TABLE [dbo].[Artist] DROP CONSTRAINT IF EXISTS [ArtistCountryID_CountryCountryID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusic]') AND type in (N'U'))
ALTER TABLE [dbo].[AlbumMusic] DROP CONSTRAINT IF EXISTS [AlbumMusicMusicID_MusicMusicID]
;
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusic]') AND type in (N'U'))
ALTER TABLE [dbo].[AlbumMusic] DROP CONSTRAINT IF EXISTS [AlbumMusicAlbumID_AlbumAlbumID]
;
