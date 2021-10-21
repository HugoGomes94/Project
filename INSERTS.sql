USE Music_DB

GO 

--MusicalGenre
--SubMusicalGenre
Insert into MusicalGenre (GenreName) values ('Electronic')
Insert into SubMusicalGenre (Name,GenreID) values ('Drum and bass',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Dub',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Electronica',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Techno',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Trance music',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('UK garage',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Video game music',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Hardcore',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Electronic rock',(select GenreId from MusicalGenre where GenreName='Electronic'))
Insert into SubMusicalGenre (Name,GenreID) values ('Downtempo',(select GenreId from MusicalGenre where GenreName='Electronic'))

Insert into MusicalGenre (GenreName) values ('African')
Insert into SubMusicalGenre (Name,GenreID) values ('Afrobeat',(select GenreId from MusicalGenre where GenreName='African'))
Insert into SubMusicalGenre (Name,GenreID) values ('Kizomba',(select GenreId from MusicalGenre where GenreName='African'))
Insert into SubMusicalGenre (Name,GenreID) values ('Kuduro',(select GenreId from MusicalGenre where GenreName='African'))
Insert into SubMusicalGenre (Name,GenreID) values ('Marabi',(select GenreId from MusicalGenre where GenreName='African'))

----Country
Insert into Country (Name) values ('AU')
Insert into Country (Name) values ('BR')
Insert into Country (Name) values ('IT') --- ITALIA
Insert into Country (Name) values ('DA') --- DINAMARCA

--Publisher
insert into Publisher (PublisherName,CountryID) values ('Sony BMG',(select CountryId from Country where Name='US'))
insert into Publisher (PublisherName,CountryID) values ('Breakbeat Kaos',(select CountryId from Country where Name='UK'))

--Music
insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Sound of Kuduro'
,'00:03:33'
,2008
,(select SubGenreID from SubMusicalGenre where Name='Kuduro')
,(select PublisherID from Publisher where PublisherName='Sony BMG'))

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Slam'
,'00:05:44'
,2005  
,(select SubGenreID from SubMusicalGenre where Name='Drum and bass')
,(select PublisherID from Publisher where PublisherName='Breakbeat Kaos'))

--Artist
insert into artist (ArtistName,CountryID) values ('Pendulum',(select CountryId from Country where Name='AU'))
insert into artist (ArtistName,CountryID) values ('Buraka Som Sistema',(select CountryId from Country where Name='PT'))

--ArtistMusic
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Buraka Som Sistema')
,(select MusicID from Music where MusicName='Sound of Kuduro'))
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Pendulum')
,(select MusicID from Music where MusicName='Slam'))

--Album
insert into Album (Name,YearRelease,Duration) values ('Hold Your Colour',2005 ,'00:00:00')
insert into Album (Name,YearRelease,Duration) values ('Black Diamond',2008,'00:00:00')

--ArtistAlbum
insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='Pendulum')
,(select AlbumID from Album where Name='Hold Your Colour'))

insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='Buraka Som Sistema')
,(select AlbumID from Album where Name='Black Diamond'))


--********************************************************************************************************************


--Users
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Tiago','Duarte','tiago.duarte@winsig.com','19891203','tiago.duarte@winsig.com',(select CountryId from Country where Name='PT'))
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Sergio','Morais','sergio.morais@winsig.com','19920902','sergio.morais@winsig.com',(select CountryId from Country where Name='PT'))

--LoginHistory
insert into LoginHistory(UserID,DatetimeHistory) values ((select UserID from Users where email='tiago.duarte@winsig.com'),'2021-02-15T16:31:48')
insert into LoginHistory(UserID,DatetimeHistory) values ((select UserID from Users where email='sergio.morais@winsig.com'),'2021-02-15T11:51:48')

--MusicalHistory
insert into MusicalHistory(UserID,MusicID,DateCreated) values ((select UserID from Users where email='tiago.duarte@winsig.com'),(select MusicID from Music where MusicName='Slam'),'2021-02-15T17:33:48')
insert into MusicalHistory(UserID,MusicID,DateCreated) values ((select UserID from Users where email='sergio.morais@winsig.com'),(select MusicID from Music where MusicName='Sound of Kuduro'),'2021-02-15T12:13:48')

--Playlist
insert into Playlist (PlaylistName,PlaylistDate,UserID) values ('Tiago list','20210215',(select UserID from Users where email='tiago.duarte@winsig.com'))
insert into Playlist (PlaylistName,PlaylistDate,UserID) values ('Sergio list','20210215',(select UserID from Users where email='sergio.morais@winsig.com'))

------------------------------------------------------------------------------------------------------------------------------------
--Playlist Music
insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='Tiago list')
,(select MusicID from Music where MusicName='Slam'))

insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='Tiago list')
,(select MusicID from Music where MusicName='Sound of Kuduro'))

insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='Sergio list')
,(select MusicID from Music where MusicName='Slam'))

insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='Sergio list')
,(select MusicID from Music where MusicName='Sound of Kuduro'))
--********************************************************************************************************************

-- License
Insert into License (LicenseTypeID,UserID,Active,ExpiredDate) values 
((select LicenseTypeID from LicenseType where LicenseName='Perpetual for one')
,(select UserID from Users where email='tiago.duarte@winsig.com')
,1
,'20221231')

Insert into License (LicenseTypeID,UserID,Active,ExpiredDate) values 
((select LicenseTypeID from LicenseType where LicenseName='Perpetual for two')
,(select UserID from Users where email='sergio.morais@winsig.com')
,1
,'20221231')

-- Payment
insert into Payment (CardNumber,CardName,CVC,ExpirationDate,Amount,CountryId) VALUES
('1234567890981111','Tiago Duarte','123','20230101',9.99
,(select CountryId from Country where Name='PT'))

insert into Payment (CardNumber,CardName,CVC,ExpirationDate,Amount,CountryId) VALUES
('1234567890981111','Sergio Morais','123','20230101',9.99
,(select CountryId from Country where Name='PT'))

-- PaymentLicense
insert into PaymentLicense (PaymentID,LicenseID,HistPaymentDate) VALUES
((select PaymentID from Payment where CardName='Tiago Duarte')
,(select LicenseID from License where UserID=(select UserID from Users where email='tiago.duarte@winsig.com'))
,'20210215')

insert into PaymentLicense (PaymentID,LicenseID,HistPaymentDate) VALUES
((select PaymentID from Payment where CardName='Sergio Morais')
,(select LicenseID from License where UserID=(select UserID from Users where email='sergio.morais@winsig.com'))
,'20210215')



--MusicalGenre
--SubMusicalGenre
Insert into MusicalGenre (GenreName) values ('Rock')
Insert into SubMusicalGenre (Name,GenreID) values ('Rockabilly',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Psychedelic Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Progressive Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Glam Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Folk Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Hard Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Heavy Metal',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Punk Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('New Wave',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Alternative Rock',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Grunge',(select GenreId from MusicalGenre where GenreName='Rock'))
Insert into SubMusicalGenre (Name,GenreID) values ('Pop Rock',(select GenreId from MusicalGenre where GenreName='Rock'))

Insert into MusicalGenre (GenreName) values ('Rap')
Insert into SubMusicalGenre (Name,GenreID) values ('Old School',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Boom-bap',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Jazz Rap',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Trap',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Mumble Rap',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Rap Rock',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Country Trap',(select GenreId from MusicalGenre where GenreName='Rap'))
Insert into SubMusicalGenre (Name,GenreID) values ('Gangsta Rap',(select GenreId from MusicalGenre where GenreName='Rap'))

--Country
Insert into Country (Name) values ('FR')
Insert into Country (Name) values ('BR')
Insert into Country (Name) values ('IT') --- ITALIA
Insert into Country (Name) values ('DA') --- DINAMARCA

--Publisher
insert into Publisher (PublisherName,CountryID) values ('GuettoStressados',(select CountryId from Country where Name='PT'))
insert into Publisher (PublisherName,CountryID) values ('Death Row',(select CountryId from Country where Name='US'))

--Music
insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Vida Marginal'
,'00:04:53'
,2002
,(select SubGenreID from SubMusicalGenre where Name='Gangsta Rap')
,(select PublisherID from Publisher where PublisherName='GuettoStressados'))

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Big Poppa'
,'00:04:23'
,1996
,(select SubGenreID from SubMusicalGenre where Name='Old School')
,(select PublisherID from Publisher where PublisherName='Death Row'))

--Artist
insert into artist (ArtistName,CountryID) values ('Biggie Smalls',(select CountryId from Country where Name='US'))
insert into artist (ArtistName,CountryID) values ('Kova M',(select CountryId from Country where Name='PT'))

--ArtistMusic
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Kova M')
,(select MusicID from Music where MusicName='Vida Marginal'))
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Biggie Smalls')
,(select MusicID from Music where MusicName='Big Poppa'))

--Album
insert into Album (Name,YearRelease,Duration) values ('Big Poppa Remastered',1946,'00:00:00')
insert into Album (Name,YearRelease,Duration) values ('Vida di Rua',2005,'00:00:00')

--ArtistAlbum
insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='Biggie Smalls')
,(select AlbumID from Album where Name='Big Poppa Remastered'))

insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='Kova M')
,(select AlbumID from Album where Name='Vida di Rua'))


--********************************************************************************************************************


--Users
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Joao','Ramos','joaomiguelramos@gmail.com','19960105','*******',(select CountryId from Country where Name='PT'))
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Emilia','Quaresma','emiliajoao@gmail.com','19500102','*******',(select CountryId from Country where Name='PT'))

--LoginHistory
insert into LoginHistory(UserID,DatetimeHistory) values ((select UserID from Users where email='joaomiguelramos@gmail.com'),'2021-02-09T16:31:48')
insert into LoginHistory(UserID,DatetimeHistory) values ((select UserID from Users where email='emiliajoao@gmail.com'),'2021-02-09T11:51:48')

--MusicalHistory
insert into MusicalHistory(UserID,MusicID,DateCreated) values ((select UserID from Users where email='joaomiguelramos@gmail.com'),(select MusicID from Music where MusicName='Big Poppa'),'2021-02-09T17:33:48')
insert into MusicalHistory(UserID,MusicID,DateCreated) values ((select UserID from Users where email='emiliajoao@gmail.com'),(select MusicID from Music where MusicName='Vida Marginal'),'2021-02-09T12:13:48')

--Playlist
insert into Playlist (PlaylistName,PlaylistDate,UserID) values ('As favoritas do Joao','20210209',(select UserID from Users where email='joaomiguelramos@gmail.com'))
insert into Playlist (PlaylistName,PlaylistDate,UserID) values ('As favoritas da Emilia','20210209',(select UserID from Users where email='emiliajoao@gmail.com'))

------------------------------------------------------------------------------------------------------------------------------------
--Playlist Music
insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='As favoritas do Joao')
,(select MusicID from Music where MusicName='Big Poppa'))

insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='As favoritas do Joao')
,(select MusicID from Music where MusicName='Vida Marginal'))

insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='As favoritas da Emilia')
,(select MusicID from Music where MusicName='Big Poppa'))

insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='As favoritas da Emilia')
,(select MusicID from Music where MusicName='Vida Marginal'))
--********************************************************************************************************************


-- LicenseType

-- License
Insert into License (LicenseTypeID,UserID,Active,ExpiredDate) values 
((select LicenseTypeID from LicenseType where LicenseName='Perpetual for one')
,(select UserID from Users where email='joaomiguelramos@gmail.com')
,1
,'20221231')

Insert into License (LicenseTypeID,UserID,Active,ExpiredDate) values 
((select LicenseTypeID from LicenseType where LicenseName='Perpetual for two')
,(select UserID from Users where email='emiliajoao@gmail.com')
,1
,'20221231')

-- Payment
insert into Payment (CardNumber,CardName,CVC,ExpirationDate,Amount,CountryId) VALUES
('1234567890981111','Joao Ramos','123','20230101',9.99
,(select CountryId from Country where Name='PT'))

--insert into Payment (CardNumber,CardName,CVC,ExpirationDate,Amount,CountryId) VALUES
--('1234567890981111','Emilia Quaresma','123','20230101',9.99
--,(select CountryId from Country where Name='DA'))

-- PaymentLicense
insert into PaymentLicense (PaymentID,LicenseID,HistPaymentDate) VALUES
((select PaymentID from Payment where CardName='Joao Ramos')
,(select LicenseID from License where UserID=(select UserID from Users where email='joaomiguelramos@gmail.com'))
,'20210209')

--insert into PaymentLicense (PaymentID,LicenseID,HistPaymentDate) VALUES
--((select PaymentID from Payment where CardName='Emilia Quaresma')
--,(select LicenseID from License where UserID=(select UserID from Users where email='emiliajoao@gmail.com'))
--,'20210209')



--MusicalGenre
--SubMusicalGenre
Insert into MusicalGenre (GenreName) values ('Jazz')
Insert into SubMusicalGenre (Name,GenreID) values ('Acid Jazz',(select GenreId from MusicalGenre where GenreName='Jazz'))
Insert into SubMusicalGenre (Name,GenreID) values ('Chamber Jazz',(select GenreId from MusicalGenre where GenreName='Jazz'))
Insert into SubMusicalGenre (Name,GenreID) values ('Dixieland',(select GenreId from MusicalGenre where GenreName='Jazz'))
Insert into SubMusicalGenre (Name,GenreID) values ('Free Jazz',(select GenreId from MusicalGenre where GenreName='Jazz'))
Insert into SubMusicalGenre (Name,GenreID) values ('Latin Jazz',(select GenreId from MusicalGenre where GenreName='Jazz'))
Insert into SubMusicalGenre (Name,GenreID) values ('West Coast Jazz',(select GenreId from MusicalGenre where GenreName='Jazz'))
Insert into MusicalGenre (GenreName) values ('Polka')
Insert into SubMusicalGenre (Name,GenreID) values ('Creole polka',(select GenreId from MusicalGenre where GenreName='Polka'))
Insert into SubMusicalGenre (Name,GenreID) values ('Paraguayan polka',(select GenreId from MusicalGenre where GenreName='Polka'))
Insert into SubMusicalGenre (Name,GenreID) values ('Polka-mazurka',(select GenreId from MusicalGenre where GenreName='Polka'))
Insert into SubMusicalGenre (Name,GenreID) values ('Slovenian-style polka',(select GenreId from MusicalGenre where GenreName='Polka'))

--Country
Insert into Country (Name) values ('US')
Insert into Country (Name) values ('UK')
Insert into Country (Name) values ('PT')
Insert into Country (Name) values ('ES')

--Publisher
insert into Publisher (PublisherName,CountryID) values ('Davis Records',(select CountryId from Country where Name='US'))

--Music
insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Creole Polka'
,'00:03:43'
,1946
,(select SubGenreID from SubMusicalGenre where Name='Creole polka')
,(select PublisherID from Publisher where PublisherName='Davis Records'))
insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Brightest Eyes Polka'
,'00:04:33'
,1946
,(select SubGenreID from SubMusicalGenre where Name='Creole polka')
,(select PublisherID from Publisher where PublisherName='Davis Records'))

--Artist
insert into artist (ArtistName,CountryID) values ('The Alpiners',(select CountryId from Country where Name='US'))

--ArtistMusic
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='The Alpiners')
,(select MusicID from Music where MusicName='Creole Polka'))
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='The Alpiners')
,(select MusicID from Music where MusicName='Brightest Eyes Polka'))

--Album
insert into Album (Name,YearRelease,Duration) values ('Polka dance',1946,'00:00:00')

--ArtistAlbum
insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='The Alpiners')
,(select AlbumID from Album where Name='Polka dance'))


--********************************************************************************************************************


--Users
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Hugh','Grant','hugh.grant@test.com','19660101','*******',(select CountryId from Country where Name='UK'))
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Maria','Rueff','maria.rueff@test.com','19660102','*******',(select CountryId from Country where Name='PT'))

--LoginHistory
insert into LoginHistory(UserID,DatetimeHistory) values ((select UserID from Users where email='hugh.grant@test.com'),'2021-02-09T16:31:48')

--MusicalHistory
insert into MusicalHistory(UserID,MusicID,DateCreated) values ((select UserID from Users where email='hugh.grant@test.com'),(select MusicID from Music where MusicName='Creole Polka'),'2021-02-09T17:33:48')

--Playlist
insert into Playlist (PlaylistName,PlaylistDate,UserID) values ('As favoritas do Hugh','20210209',(select UserID from Users where email='hugh.grant@test.com'))

--Playlist Music
insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='As favoritas do Hugh')
,(select MusicID from Music where MusicName='Creole Polka'))
insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='As favoritas do Hugh')
,(select MusicID from Music where MusicName='Brightest Eyes Polka'))


--********************************************************************************************************************


-- LicenseType
Insert into LicenseType (LicenseName) values ('Perpetual for one')
Insert into LicenseType (LicenseName) values ('Perpetual for two')

-- License
Insert into License (LicenseTypeID,UserID,Active,ExpiredDate) values 
((select LicenseTypeID from LicenseType where LicenseName='Perpetual for one')
,(select UserID from Users where email='hugh.grant@test.com')
,1
,'20221231')

-- Payment
insert into Payment (CardNumber,CardName,CVC,ExpirationDate,Amount,CountryId) VALUES
('1234567890981111','Hugh Grant','123','20230101',9.99
,(select CountryId from Country where Name='UK'))

-- PaymentLicense
insert into PaymentLicense (PaymentID,LicenseID,HistPaymentDate) VALUES
((select PaymentID from Payment where CardName='Hugh Grant')
,(select LicenseID from License where UserID=(select UserID from Users where email='hugh.grant@test.com'))
,'20210209')

--MusicalGenre
--SubMusicalGenre
Insert into MusicalGenre (GenreName) values ('Blues')
Insert into SubMusicalGenre (Name,GenreID) values ('Boogie-woogie',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into SubMusicalGenre (Name,GenreID) values ('Classic female blues',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into SubMusicalGenre (Name,GenreID) values ('Country blues',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into SubMusicalGenre (Name,GenreID) values ('Electric blues',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into SubMusicalGenre (Name,GenreID) values ('Fife and drum blues',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into SubMusicalGenre (Name,GenreID) values ('Hokum',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into MusicalGenre (GenreName) values ('Country')
Insert into SubMusicalGenre (Name,GenreID) values ('Country Pop',(select GenreId from MusicalGenre where GenreName='Blues'))
Insert into MusicalGenre (GenreName) values ('R&B')
Insert into SubMusicalGenre (Name,GenreID) values ('Contemporary R&B',(select GenreId from MusicalGenre where GenreName='R&B'))
Insert into SubMusicalGenre (Name,GenreID) values ('Disco',(select GenreId from MusicalGenre where GenreName='R&B'))
Insert into SubMusicalGenre (Name,GenreID) values ('Funk',(select GenreId from MusicalGenre where GenreName='R&B'))
Insert into SubMusicalGenre (Name,GenreID) values ('Motown',(select GenreId from MusicalGenre where GenreName='R&B'))
Insert into SubMusicalGenre (Name,GenreID) values ('Neo-Soul',(select GenreId from MusicalGenre where GenreName='R&B'))
Insert into SubMusicalGenre (Name,GenreID) values ('Quiet Storm',(select GenreId from MusicalGenre where GenreName='R&B'))
Insert into SubMusicalGenre (Name,GenreID) values ('Soul',(select GenreId from MusicalGenre where GenreName='R&B'))


--Publisher
insert into Publisher (PublisherName,CountryID) values ('J Records',(select CountryId from Country where Name='US'))
insert into Publisher (PublisherName,CountryID) values ('RCA Nashville',(select CountryId from Country where Name='US'))

--Music R&B
insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('A Womans Worth'
,'00:05:03'
,2001
,(select SubGenreID from SubMusicalGenre where Name='Soul')
,(select PublisherID from Publisher where PublisherName='J Records'))

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Piano & I'
,'00:01:51'
,2001
,(select SubGenreID from SubMusicalGenre where Name='Soul')
,(select PublisherID from Publisher where PublisherName='J Records'))

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Girlfriend'
,'00:03:34'
,2001
,(select SubGenreID from SubMusicalGenre where Name='Soul')
,(select PublisherID from Publisher where PublisherName='J Records'))


insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('How Come You Dont Call Me'
,'00:03:57'
,2001
,(select SubGenreID from SubMusicalGenre where Name='Soul')
,(select PublisherID from Publisher where PublisherName='J Records'))


--Music Country

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('What Ifs'
,'00:03:08'
,2016
,(select SubGenreID from SubMusicalGenre where Name='Country Pop')
,(select PublisherID from Publisher where PublisherName='RCA Nashville'))

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Hometown'
,'00:03:23'
,2016
,(select SubGenreID from SubMusicalGenre where Name='Country Pop')
,(select PublisherID from Publisher where PublisherName='RCA Nashville'))

insert into Music (MusicName,MusicDuration,MusicYear,SubGenreID,PublisherId) VALUES
('Rockstars'
,'00:03:20'
,2016
,(select SubGenreID from SubMusicalGenre where Name='Country Pop')
,(select PublisherID from Publisher where PublisherName='RCA Nashville'))


--Artist
insert into artist (ArtistName,CountryID) values ('Kane Brown',(select CountryId from Country where Name='US'))

insert into artist (ArtistName,CountryID) values ('Alicia Keys',(select CountryId from Country where Name='US'))

--ArtistMusic
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Alicia Keys')
,(select MusicID from Music where MusicName='A Womans Worth'))
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Alicia Keys')
,(select MusicID from Music where MusicName='Piano & I'))
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Alicia Keys')
,(select MusicID from Music where MusicName='Girlfriend'))
insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Alicia Keys')
,(select MusicID from Music where MusicName='How Come You Dont Call Me'))

insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Kane Brown')
,(select MusicID from Music where MusicName='What Ifs'))

insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Kane Brown')
,(select MusicID from Music where MusicName='Hometown'))


insert into artistMusic (ArtistID,MusicID) values 
((select ArtistID from Artist where ArtistName='Kane Brown')
,(select MusicID from Music where MusicName='Rockstars'))

--Album
insert into Album (Name,YearRelease,Duration) values ('Songs in A Minor',2001,'00:00:00')
--Album
insert into Album (Name,YearRelease,Duration) values ('Kane Brown',2016,'00:00:00')

--ArtistAlbum
insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='Alicia Keys')
,(select AlbumID from Album where Name='Songs in A Minor'))

insert into artistAlbum (ArtistID,AlbumID) values 
((select ArtistID from Artist where ArtistName='Kane Brown')
,(select AlbumID from Album where Name='Kane Brown'))


--********************************************************************************************************************


--Users
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Luisa','Antunes','luisa.antunes@test.com','19910101','*******',(select CountryId from Country where Name='PT'))
insert into Users (Firstname,lastname,email,BirthDate,UserPassword,CountryID) values ('Joseph','Stuart','joseph.stuart@test.com','19660102','*******',(select CountryId from Country where Name='US'))

--LoginHistory
insert into LoginHistory(UserID,DatetimeHistory) values ((select UserID from Users where email='luisa.antunes@test.com'),'2021-02-17T10:58:02')

--MusicalHistory
insert into MusicalHistory(UserID,MusicID,DateCreated) values ((select UserID from Users where email='luisa.antunes@test.com'),(select MusicID from Music where MusicName='What Ifs'),'2021-02-17T10:59:48')

--Playlist
insert into Playlist (PlaylistName,PlaylistDate,UserID) values ('Lista Country','20210217',(select UserID from Users where email='luisa.antunes@test.com'))

--Playlist Music
insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='Lista Country')
,(select MusicID from Music where MusicName='What Ifs'))
insert into PlaylistMusic (PlaylistID,MusicID) values 
((select PlaylistID from Playlist where PlaylistName='Lista Country')
,(select MusicID from Music where MusicName='Hometown'))


--********************************************************************************************************************


-- LicenseType
Insert into LicenseType (LicenseName) values ('Monthly for one')
Insert into LicenseType (LicenseName) values ('Monthly family')

-- License
Insert into License (LicenseTypeID,UserID,Active,ExpiredDate) values 
((select LicenseTypeID from LicenseType where LicenseName='Monthly for one')
,(select UserID from Users where email='luisa.antunes@test.com')
,1
,'20210317')

-- Payment
insert into Payment (CardNumber,CardName,CVC,ExpirationDate,Amount,CountryId) VALUES
('1234567890981115','Luisa Antunes','999','20220501',1.5
,(select CountryId from Country where Name='PT'))

-- PaymentLicense
insert into PaymentLicense (PaymentID,LicenseID,HistPaymentDate) VALUES
((select PaymentID from Payment where CardName='Luisa Antunes')
,(select LicenseID from License where UserID=(select UserID from Users where email='luisa.antunes@test.com'))
,'20210217')