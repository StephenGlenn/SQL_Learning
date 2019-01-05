USE[Movies]     /* This Line forces the Queries Below to Use the Database "Movies" */


IF NOT EXISTS (SELECT * from sysobjects where name='Movie' and xtype='U')      /* This Checks the Master Database if a database Object Called "Movie"  IN "MOVIES Database Because we USED the USE command above"   does NOT exist and that It is Xtype= "U"  which is a User Definded Table */
BEGIN                                                                          /* If the Condition is True  Then it Begins this part of the Query , If it is False it Goes to the END Statement and continues from there on */
    CREATE TABLE [dbo].[Movie]
	(																	       /* The code between the Begin and the End is called a "Begin End Block"   These Can be Nested ! */
		 [MovieID] int PRIMARY KEY NOT NULL
		,[Movie] varchar(255) NULL
		,[Description] VARCHAR(1000) NULL
		,[GenreID] CHAR(1) NULL
		,[StarID] int NULL
		,[ClassRating] int NULL
		,[ReleaseDate] date NULL
	)
END                                                                            /* When the query completes sucessfully it Ends this part of the Query an moves onto the Next line of code   */



IF NOT EXISTS (SELECT * FROM sysobjects where name ='MovieToActors' and xtype='U') 
BEGIN
	CREATE TABLE [dbo].[MovieToActors]         /* This Table will allow us to Add any number of actors to a movie ! we often refer to this as an Intermediate Table */
	(
		 [MovieID] INT NOT NULL        /*This will be a FK related to the Movie Table*/
		,[ActorID] INT NOT NULL        /*This will be a FK relared to the Actor Table*/
	) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * from sysobjects where name='Actors' and xtype='U')
BEGIN 

	CREATE TABLE dbo.Actors 
	(
		 [ActorID] INT PRIMARY KEY NOT NULL
		,[FirstName] varchar(50) NULL
		,[MiddleName] VARCHAR(50) NULL
		,[Surname] VARCHAR(50) NULL	
		,[DOB] DATE NULL
		,[SEX] VARCHAR(6) NULL
	) ON [PRIMARY]
END

IF NOT EXISTS (SELECT * from sysobjects where name='MediaType' and xtype='U')
BEGIN 
	CREATE TABLE [dbo].[MediaType]
	(
		 [TypeID] int NOT NULL
		,[Type]  VARCHAR(25) NULL
	) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * from sysobjects where name='MovieToMediaType' and xtype='U')
BEGIN 
	CREATE TABLE [dbo].[MovieToMediaType]      /* Like the MovieToActors table because the movies can be release on more than one media type  */
	(										   /* Using a table like this allows us to creates a 1 to Many relationhip between the Movie Table and the MediaType */	
		 [MovieID] INT NOT NULL
		,[TypeID] INT PRIMARY KEY NOT NULL 
	) ON [PRIMARY]
END



IF NOT EXISTS (SELECT * from sysobjects where name='ClassRating' and xtype='U')
BEGIN 
	CREATE TABLE [dbo].[ClassRating]
	(
		   [ClassID] INT PRIMARY KEY NOT NULL
		  ,[Classification] CHAR(4) NULL
		  ,[Discription] VARCHAR(255) NULL
	) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * from sysobjects where name='Genre' and xtype='U')
BEGIN 
	CREATE TABLE [dbo].[Genre]
	(
		 [GenreID] CHAR(1) PRIMARY KEY
		,[Genre] VARCHAR(50) NULL
	) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * from sysobjects where name='StarRating' and xtype='U')
BEGIN 
	CREATE TABLE [dbo].[StarRating]
	(
		 [StarID] INT PRIMARY KEY
		,[Value] INT NULL
		,[Symbol] CHAR(5) NULL
	) ON [PRIMARY]
END


/* This Section Populates the tables with Data  */

INSERT INTO dbo.Actors([ActorID],[FirstName],[MiddleName],[Surname],[DOB],[SEX])
VALUES 
	(1,'Robert', NULL, 'Downey Jr', '1965-04-04','Male'),
	(2,'Gwyneth', NULL, 'Paltrow', '1972-09-27' ,'Female'),
	(3,'Chris', NULL, 'Evans', '1981-06-13','Male'),
	(4,'Hayley','Elizabeth', 'Atwell','1982-04-05','Female'),
	(5,'Denzel','Hayes','Washington','1954-12-28','Male'),
	(6,'Tom','Jeffrey','Hanks','1956-0709','Male'),
	(7,'Jude','Hayworth','Law','1972-12-29','Male'),
	(8,'Ashley','Tyler','Judd','1968-04-19','Female'),
	(9,'Morgan',NULL,'Freeman','1937-0601','Male'),
	(10,'Matt','Paige','Damon','1970-10-08','Male'),
	(11,'Tommy','Lee','Jones','1946-09-15','Male'),
	(12,'Audrey','Justine','Tautou','1976-08-09','Female'),
	(13,'Christian',NULL,'Bale','1974-01-30','Male')


GO
INSERT INTO dbo.Genre([GenreID],[Genre])
VALUES
	('H','Horror'),
	('A','Action'),
	('D','Drama'),
	('S','Sci-Fi'),
	('R','Romance'),
	('C','Cartoon'),
	('T','Thriller'),
	('X','Crime')

GO

INSERT INTO dbo.StarRating([StarID],[Value],[Symbol])
VALUES
	(100, 1 ,'*'),
	(200, 2 ,'**'),
	(300, 3 ,'***'),
	(400, 4 ,'****'),
	(500, 5 ,'*****')

GO


INSERT INTO dbo.ClassRating([ClassID],[Classification],[Discription])
VALUES
	(1,'G','General'),
	(2,'PG','Parental Guidance'),
	(3,'M','Mature'),
	(4,'MA','15+ Mature Accompanied'),
	(5,'R','18+ Restricted'),
	(6,'X','18+ Restricted'),
	(7,'RC','Refused Classification')

GO

INSERT INTO dbo.MediaType([TypeID],[Type])
VALUES
	(700,'DVD'),
	(701,'BlueRay'),
	(702,'Netflix'),
	(703,'Stan'),
	(704,'Amazon Prime'),
	(705,'FoxTel')
	
GO

INSERT INTO dbo.MovieToMediaType([MovieID],[TypeID])
VALUES
	(888534,700),
	(888534,701),
	(888534,702),
	(888534,703),
	(998336,700),
	(998336,701),
	(998336,702),
	(998336,703),
	(112453,701),
	(112453,702),
	(112453,705),
	(554622,700),
	(554622,705),
	(994334,700),
	(994334,701),
	(994334,702),
	(994334,703),
	(994334,704),
	(994334,705),
	(778342,700),








GO

INSERT INTO dbo.MovieToActors([MovieID],[ActorID])
VALUES
	(888534,1),
	(888534,2),
	(998336,3),
	(998336,4),
	(998336,11),
	(554622,8),
	(554622,9),
	(112453,1),
	(112453,7),
	(994334,13),
	(994334,9),
	(778342,5),






GO

INSERT INTO dbo.Movie ([MovieID],[Movie],[Description],[GenreID],[StarID],[ClassRating],[ReleaseDate])
VALUES 
	(888534,'Iron Man', 'An engineering prodigy and genius who follows in his father''s footsteps to run the world''s biggest weapons manufacturer, Tony is first presented as a careless playboy only interested in making money. That all changes, however, when he is kidnapped by a deadly terrorist organization demanding his technology. With the help of a fellow hostage, Ho Yinsin (Shaun Toub), he uses his ingenuity to design a suit of armor to escape... but it''s an experience that winds up haunting him.','A',500,4,'2008-04-14'),
	(998336,'Captain America The First Avenger', 'It is 1941 and the world is in the throes of war. Steve Rogers (Chris Evans) wants to do his part and join America''s armed forces, but the military rejects him because of his small stature. Finally, Steve gets his chance when he is accepted into an experimental program that turns him into a supersoldier called Captain America. Joining forces with Bucky Barnes (Sebastian Stan) and Peggy Carter (Hayley Atwell), Captain America leads the fight against the Nazi-backed HYDRA organization','A',400,4,'2011-07-28'),
	(554622,'High Crimes','High powered lawyer Claire Kubik finds her world turned upside down when her husband, who has been living under a false name, is arrested by military police and placed on trial for the murder of villagers while he was in the Marines ','X',300,4,'2002-04-05'),
	(112453,'Sherlock Holmes','n 1890 London, private detective Sherlock Holmes and his partner Dr. John Watson prevent the ritual murder of a woman by Lord Henry Blackwood, who has killed five other young women similarly. Inspector Lestrade and the police arrest Blackwood. Three months later, Watson is engaged to Mary Morstan and moving out of 221B Baker Street; while he enjoys their adventures together.','X',300,2,'2009-12-25'),
	(994334,'Batman Begins','In the wake of his parents'' murder, disillusioned industrial heir Bruce Wayne (Christian Bale) travels the world seeking the means to fight injustice and turn fear against those who prey on the fearful. He returns to Gotham and unveils his alter-ego: Batman, a masked crusader who uses his strength, intellect and an array of high tech deceptions to fight the sinister forces that threaten the city.','A',500,4,'2005-06-05'),
	(778342,'The Equalizer','Robert McCall (Denzel Washington), a man of mysterious origin who believes he has put the past behind him, dedicates himself to creating a quiet new life. However, when he meets Teri (Chloë Grace Moretz), a teenager who has been manhandled by violent Russian mobsters, he simply cannot walk away. With his set of formidable skills, McCall comes out of self-imposed retirement and emerges as an avenging angel, ready to take down anyone who brutalizes the helpless.','A',300,4,'2014-09-25'),


	




