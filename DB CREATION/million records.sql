-- select * from MusicalHistory
Use Music_DB;

DECLARE @Id int
DECLARE @NewUserID int
DECLARE @NewMusicID int 
DECLARE @DateCreated datetime2
-- For random date between two dates 
DECLARE @FromDate datetime2 = '2020-01-01 00:00:00.0000000'
DECLARE @ToDate datetime2 = '2020-12-31 23:59:59.9999999'
DECLARE @Seconds int = DATEDIFF(SECOND, @FromDate, @ToDate)
DECLARE @Random int

Set @Id = 1
SET NOCOUNT ON
While @Id <= 1000000
Begin 
   SET @NewUserID = (SELECT TOP 1 UserID FROM Users ORDER BY newid())
   SET @NewMusicID = (SELECT TOP 1 MusicID FROM Music ORDER BY newid())
   SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
   SET @DateCreated =DATEADD(SECOND, @Random, @FromDate)
   INSERT INTO MusicalHistory (UserID,MusicID,DateCreated) VALUES (@NewUserID,@NewMusicID,@DateCreated)
   Set @Id = @Id + 1
End

GO

SET NOCOUNT OFF 
