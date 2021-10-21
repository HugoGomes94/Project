
CREATE PROCEDURE sp_CREATE_FK_SOURCE_TABLES
as
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusicAlbumID_AlbumAlbumID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[AlbumMusic]'))
BEGIN
		ALTER TABLE [AlbumMusic] WITH CHECK ADD CONSTRAINT [AlbumMusicAlbumID_AlbumAlbumID] FOREIGN KEY ([AlbumID])
        REFERENCES [dbo].[Album] ([AlbumID])
END
;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[AlbumMusicMusicID_MusicMusicID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[AlbumMusic]'))
BEGIN
		ALTER TABLE [AlbumMusic] WITH CHECK ADD CONSTRAINT [AlbumMusicMusicID_MusicMusicID] FOREIGN KEY (MusicID)
        REFERENCES [dbo].[Music] ([MusicID])
END
;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[ArtistCountryID_CountryCountryID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Artist]'))
BEGIN
		ALTER TABLE [Artist] WITH CHECK ADD CONSTRAINT [ArtistCountryID_CountryCountryID] FOREIGN KEY (CountryID)
        REFERENCES [dbo].[Country] ([CountryID])
END
;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbumAlbumID_AlbumAlbumID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]'))
BEGIN
		ALTER TABLE [ArtistAlbum] WITH CHECK ADD CONSTRAINT [ArtistAlbumAlbumID_AlbumAlbumID] FOREIGN KEY([AlbumID])
		REFERENCES [dbo].[Album] ([AlbumID])

END

;
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[ArtistAlbumArtistID_ArtistArtistID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistAlbum]'))
BEGIN
		ALTER TABLE [ArtistAlbum] WITH CHECK ADD CONSTRAINT [ArtistAlbumArtistID_ArtistArtistID] FOREIGN KEY([ArtistID])
		REFERENCES [dbo].[Artist] ([ArtistID])
END
;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusicArtistID_ArtistArtistID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistMusic]'))
BEGIN
		ALTER TABLE [ArtistMusic]  WITH CHECK ADD CONSTRAINT [ArtistMusicArtistID_ArtistArtistID] FOREIGN KEY([ArtistID])
		REFERENCES [dbo].[Artist] ([ArtistID])
END
;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[ArtistMusicMusicID_MusicMusicID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[ArtistMusic]'))
BEGIN
		ALTER TABLE [ArtistMusic]  WITH CHECK ADD CONSTRAINT [ArtistMusicMusicID_MusicMusicID] FOREIGN KEY([MusicID])
		REFERENCES [dbo].[Music] ([MusicID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[LicenseLicenseTypeID_LicenseTypeLicenseTypeID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[License]'))
BEGIN
		ALTER TABLE [License]  WITH CHECK ADD CONSTRAINT [LicenseLicenseTypeID_LicenseTypeLicenseTypeID] FOREIGN KEY([LicenseTypeID])
		REFERENCES [dbo].[LicenseType] ([LicenseTypeID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[LicenseUserID_UsersUserID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[License]'))
BEGIN
		ALTER TABLE [License] WITH CHECK ADD CONSTRAINT [LicenseUserID_UsersUserID] FOREIGN KEY([UserID])
		REFERENCES [dbo].[Users] ([UserID])
END
;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[LoginHistoryUserID_UsersUserID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[LoginHistory]'))
BEGIN
		ALTER TABLE [LoginHistory] WITH CHECK ADD CONSTRAINT [LoginHistoryUserID_UsersUserID] FOREIGN KEY([UserID])
		REFERENCES [dbo].[Users] ([UserID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[MusicPublisherID_PublisherPublisherID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Music]'))
BEGIN
		ALTER TABLE [Music] WITH CHECK ADD CONSTRAINT [MusicPublisherID_PublisherPublisherID] FOREIGN KEY([PublisherID])
		REFERENCES [dbo].[Publisher] ([PublisherID])
END


;


IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[MusicSubGenreID_SubMusicalGenreSubGenreID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Music]'))
BEGIN
		ALTER TABLE [Music] WITH CHECK ADD CONSTRAINT [MusicSubGenreID_SubMusicalGenreSubGenreID] FOREIGN KEY([SubGenreID])
		REFERENCES [dbo].[SubMusicalGenre] ([SubGenreID])
END


;


IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistoryMusicID_MusicMusicID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[MusicalHistory]'))
BEGIN
		ALTER TABLE [MusicalHistory] WITH CHECK ADD CONSTRAINT [MusicalHistoryMusicID_MusicMusicID] FOREIGN KEY([MusicID])
		REFERENCES [dbo].[Music] ([MusicID])
END
;


IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[MusicalHistoryUserID_UsersUserID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[MusicalHistory]'))
BEGIN
		ALTER TABLE [MusicalHistory] WITH CHECK ADD CONSTRAINT [MusicalHistoryUserID_UsersUserID] FOREIGN KEY([UserID])
		REFERENCES [dbo].[Users] ([UserID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PaymentCountryID_CountryCountryID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Payment]'))
BEGIN
		ALTER TABLE [Payment] WITH CHECK ADD CONSTRAINT [PaymentCountryID_CountryCountryID] FOREIGN KEY([CountryID])
		REFERENCES [dbo].[Country] ([CountryID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicenseLicenseID_LicenseLicenseID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[PaymentLicense]'))
BEGIN
		ALTER TABLE [PaymentLicense]  WITH CHECK ADD CONSTRAINT [PaymentLicenseLicenseID_LicenseLicenseID] FOREIGN KEY([LicenseID])
		REFERENCES [dbo].[License] ([LicenseID])
END

;
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PaymentLicensePaymentID_PaymentPaymentID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[PaymentLicense]'))
BEGIN
		ALTER TABLE [PaymentLicense]  WITH CHECK ADD CONSTRAINT [PaymentLicensePaymentID_PaymentPaymentID] FOREIGN KEY([PaymentID])
		REFERENCES [dbo].[Payment] ([PaymentID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistUserID_UsersUserID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Playlist]'))
BEGIN
		ALTER TABLE [Playlist]  WITH CHECK ADD CONSTRAINT [PlaylistUserID_UsersUserID] FOREIGN KEY([UserID])
		REFERENCES [dbo].[Users] ([UserID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusicMusicID_MusicMusicID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]'))
BEGIN
		ALTER TABLE [PlaylistMusic]  WITH CHECK ADD CONSTRAINT [PlaylistMusicMusicID_MusicMusicID] FOREIGN KEY([MusicID])
		REFERENCES [dbo].[Music] ([MusicID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PlaylistMusicPlaylistID_PlaylistPlaylistID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[PlaylistMusic]'))
BEGIN
		ALTER TABLE [PlaylistMusic]  WITH CHECK ADD CONSTRAINT [PlaylistMusicPlaylistID_PlaylistPlaylistID] FOREIGN KEY([PlaylistID])
		REFERENCES [dbo].[Playlist] ([PlaylistID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[PublisherCountryID_CountryCountryID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Publisher]'))
BEGIN
		ALTER TABLE [Publisher] WITH CHECK ADD CONSTRAINT [PublisherCountryID_CountryCountryID] FOREIGN KEY([CountryID])
		REFERENCES [dbo].[Country] ([CountryID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[SubMusicalGenreGenreID_MusicalGenreGenreID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[SubMusicalGenre]'))
BEGIN
		ALTER TABLE [SubMusicalGenre] WITH CHECK ADD CONSTRAINT [SubMusicalGenreGenreID_MusicalGenreGenreID] FOREIGN KEY([GenreID])
		REFERENCES [dbo].[MusicalGenre] ([GenreID])
END
;
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[UsersCountryID_CountryCountryID]') 
             AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
BEGIN
		ALTER TABLE [Users] WITH CHECK ADD CONSTRAINT [UsersCountryID_CountryCountryID] FOREIGN KEY([CountryID])
		REFERENCES [dbo].[Country] ([CountryID])
END
;
