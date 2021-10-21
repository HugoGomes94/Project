CREATE PROCEDURE sp_DROP_FK_OUT_TABLE
as
BEGIN
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[SubMusicalGenre_out]') AND type in (N'U'))
ALTER TABLE [staging].[SubMusicalGenre_out] DROP CONSTRAINT IF EXISTS [SubMusicalGenreGenreID_MusicalGenreGenreID_out];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[MusicalHistory_out]') AND type in (N'U'))
ALTER TABLE [staging].[MusicalHistory_out] DROP CONSTRAINT IF EXISTS [MusicalHistoryUserID_UsersUserID_out];
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[MusicalHistory_out]') AND type in (N'U'))
ALTER TABLE [staging].[MusicalHistory_out] DROP CONSTRAINT IF EXISTS [MusicalHistoryMusicID_MusicMusicID_out];
END;
