
CREATE PROCEDURE sp_CREATE_FK_OUT_TABLE
as
BEGIN
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[staging].[MusicalHistoryMusicID_MusicMusicID_out]') 
             AND parent_object_id = OBJECT_ID(N'[staging].[MusicalHistory_out]'))
BEGIN
		ALTER TABLE [staging].[MusicalHistory_out] WITH CHECK ADD CONSTRAINT [MusicalHistoryMusicID_MusicMusicID_out] FOREIGN KEY([MusicID])
		REFERENCES [staging].[Music_out] ([MusicID])
END
;


IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[staging].[MusicalHistoryUserID_UsersUserID_out]') 
             AND parent_object_id = OBJECT_ID(N'[staging].[MusicalHistory_out]'))
BEGIN
		ALTER TABLE [staging].[MusicalHistory_out] WITH CHECK ADD CONSTRAINT [MusicalHistoryUserID_UsersUserID_out] FOREIGN KEY([UserID])
		REFERENCES [staging].[Users_out] ([UserID])
END

;

IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[staging].[SubMusicalGenreGenreID_MusicalGenreGenreID_out]') 
             AND parent_object_id = OBJECT_ID(N'[staging].[SubMusicalGenre_out]'))
BEGIN
		ALTER TABLE [staging].[SubMusicalGenre_out] WITH CHECK ADD CONSTRAINT [SubMusicalGenreGenreID_MusicalGenreGenreID_out] FOREIGN KEY([GenreID])
		REFERENCES [staging].[MusicalGenre_out] ([GenreID])
END
;
END
GO
