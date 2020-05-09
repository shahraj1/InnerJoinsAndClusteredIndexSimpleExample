-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbSQL1		-- Get out of the master database
SET NOCOUNT ON	-- Report only errors

-- --------------------------------------------------------------------------------
-- Step #1: Drop Tables
-- --------------------------------------------------------------------------------
-- Problem #1 
-- Drop Table
IF OBJECT_ID( 'TTeamPlayers' ) IS NOT NULL DROP TABLE TTeamPlayers
IF OBJECT_ID( 'TTeams' ) IS NOT NULL DROP TABLE TTeams
IF OBJECT_ID( 'TPlayers' ) IS NOT NULL DROP TABLE TPlayers

-- Drop View	
IF OBJECT_ID( 'VTeamPlayers' ) IS NOT NULL DROP VIEW VTeamPlayers

-- Problem #2
-- Drop Table
IF OBJECT_ID( 'TUserFavouriteSongs' ) IS NOT NULL DROP TABLE TUserFavouriteSongs
IF OBJECT_ID( 'TSongs' ) IS NOT NULL DROP TABLE TSongs
IF OBJECT_ID( 'TUsers' ) IS NOT NULL DROP TABLE TUsers
IF OBJECT_ID( 'TArtists' ) IS NOT NULL DROP TABLE TArtists

-- Drop View
IF OBJECT_ID( 'VUserFavoriteSongs' ) IS NOT NULL DROP VIEW VUserFavoriteSongs

-- Problem #3
-- Drop Tables
IF OBJECT_ID( 'TCourseBooks' ) IS NOT NULL DROP TABLE TCourseBooks
IF OBJECT_ID( 'TBooks' ) IS NOT NULL DROP TABLE TBooks
IF OBJECT_ID( 'TCourseStudents' ) IS NOT NULL DROP TABLE TCourseStudents
IF OBJECT_ID( 'TGrades' ) IS NOT NULL DROP TABLE TGrades
IF OBJECT_ID( 'TStudents' ) IS NOT NULL DROP TABLE TStudents
IF OBJECT_ID( 'TCourses' ) IS NOT NULL DROP TABLE TCourses
IF OBJECT_ID( 'TRooms' ) IS NOT NULL DROP TABLE TRooms
IF OBJECT_ID( 'TInstructors' ) IS NOT NULL DROP TABLE TInstructors

-- Drop Views
IF OBJECT_ID( 'VCourses' ) IS NOT NULL DROP VIEW VCourses
IF OBJECT_ID( 'VCourseStudentGrades' ) IS NOT NULL DROP VIEW VCourseStudentGrades


-- Problem #4 
-- Drop Tables
IF OBJECT_ID( 'TFlightPassengers' ) IS NOT NULL DROP TABLE TFlightPassengers
IF OBJECT_ID( 'TPassengers' ) IS NOT NULL DROP TABLE TPassengers
IF OBJECT_ID( 'TFlightFlightAttendants' ) IS NOT NULL DROP TABLE TFlightFlightAttendants
IF OBJECT_ID( 'TFlightAttendants' ) IS NOT NULL DROP TABLE TFlightAttendants
IF OBJECT_ID( 'TFlightPilots' ) IS NOT NULL DROP TABLE TFlightPilots
IF OBJECT_ID( 'TPilots' ) IS NOT NULL DROP TABLE TPilots
IF OBJECT_ID( 'TFlights' ) IS NOT NULL DROP TABLE TFlights
IF OBJECT_ID( 'TAirplanes' ) IS NOT NULL DROP TABLE TAirplanes

-- Drop Views
IF OBJECT_ID( 'VFlights' ) IS NOT NULL DROP VIEW VFlights
IF OBJECT_ID( 'VFlightPassengers' ) IS NOT NULL DROP VIEW VFlightPassengers



-- Problem #5
-- Drop Tables
IF OBJECT_ID( 'TCustomerOrderItems' ) IS NOT NULL DROP TABLE TCustomerOrderItems
IF OBJECT_ID( 'TItems' ) IS NOT NULL DROP TABLE TItems
IF OBJECT_ID( 'TCustomerOrders' ) IS NOT NULL DROP TABLE TCustomerOrders
IF OBJECT_ID( 'TCustomers' ) IS NOT NULL DROP TABLE TCustomers

-- Drop Views
IF OBJECT_ID( 'VCustomerOrderItems' ) IS NOT NULL DROP VIEW VCustomerOrderItems

-- --------------------------------------------------------------------------------
-- Step #1.1: CREATE Tables
-- --------------------------------------------------------------------------------
CREATE TABLE TTeams
(
	 intTeamID					INTEGER				NOT NULL 
	,strTeam					VARCHAR(50)			NOT NULL
	,CONSTRAINT TTeams_PK PRIMARY KEY (intTeamID)
)	

CREATE TABLE TTeamPlayers
(
	 intTeamID					INTEGER				NOT NULL
	,intPlayerID				INTEGER				NOT NULL 
	,CONSTRAINT TTeamPlayers_PK PRIMARY KEY(intTeamID,intPlayerID)
)

CREATE TABLE TPlayers
(
	 intPlayerID				INTEGER				NOT NULL
	,strFirstName				VARCHAR(50)			NOT NULL
	,strLastName				VARCHAR(50)			NOT NULL
	,CONSTRAINT TPlayers_PK PRIMARY KEY(intPlayerID)
)

-- --------------------------------------------------------------------------------
-- Step #1.2: Identify & Create Foreign Keys
-- --------------------------------------------------------------------------------
--	#				Child					Parent					Column(s)
--	--				-----					------					-------
--	1				TTeamPlayers			TTeams					intTeamID					
--	2				TTeamPlayers			TPlayers				intPlayerID

-- 1
ALTER TABLE TTeamPlayers ADD CONSTRAINT TTeamPlayers_TTeams_FK 	
	FOREIGN KEY ( intTeamID ) REFERENCES TTeams ( intTeamID )

-- 2 
ALTER TABLE TTeamPlayers ADD CONSTRAINT TTeamPlayers_TPlayers_FK 	
	FOREIGN KEY ( intPlayerID ) REFERENCES TPlayers ( intPlayerID )

-- --------------------------------------------------------------------------------
-- Step #1.3: Insert Statements
-- --------------------------------------------------------------------------------
INSERT INTO TTeams(intTeamID,strTeam)
VALUES		 (1,'Team1')
			,(2,'Team2')
			,(3,'Team3')

INSERT INTO TPlayers(intPlayerID,strFirstName,strLastName)
VALUES		 (1,'PlayerFirstName1','PlayerLastName1')
			,(2,'PlayerFirstName2','PlayerLastName2')
			,(3,'PlayerFirstName3','PlayerLastName3')
			

INSERT INTO TTeamPlayers(intTeamID,intPlayerID)
VALUES		 (1,1)
			,(1,2)
			
			,(2,1)
			,(2,3)

			,(3,2)
			,(3,3)
			
-- --------------------------------------------------------------------------------
-- Step #1.4:JOIN STATEMENT
-- --------------------------------------------------------------------------------
GO
CREATE VIEW VTeamPlayers
AS 
SELECT 
	 TT.intTeamID
	,TT.strTeam
	,TP.intPlayerID
	,TP.strLastName  + ', ' + TP.strFirstName AS strFullName 
FROM 
	 TTeams			AS TT
			INNER JOIN TTeamPlayers AS TTP
				INNER JOIN TPlayers AS TP
				ON (TTP.intPlayerID=TP.intPlayerID)
			ON (TT.intTeamID=TTP.intTeamID)	 

GO

SELECT 
	*
FROM 
	VTeamPlayers
ORDER BY 
	 strTeam
	,strFullName



-- --------------------------------------------------------------------------------
-- Step 2.1: CREATE TABLES
-- --------------------------------------------------------------------------------
CREATE TABLE TUsers
(
	 intUserID				INTEGER			NOT NULL 
	,strUserName			VARCHAR(50)		NOT NULL
	,strEmailAddress		VARCHAR(50)		NOT NULL
	,CONSTRAINT TUsers_PK PRIMARY KEY ( intUserID)
)	

CREATE TABLE TUserFavouriteSongs
(
	 intUserID				INTEGER			NOT NULL 
	,intSongID				INTEGER			NOT NULL
	,intSortOrder			INTEGER			NOT NULL
	,CONSTRAINT TUserFavouriteSongs_PK PRIMARY KEY (intUserID,intSongID)
)
CREATE TABLE TSongs
(
	 intSongID				INTEGER			NOT NULL 
	,strName				VARCHAR(50)		NOT NULL
	,intArtistID			INTEGER			NOT NULL
	,CONSTRAINT TSongs_PK PRIMARY KEY(intSongID)
)	

CREATE TABLE TArtists
(
	 intArtistID			INTEGER			NOT NULL
	,strArtist				VARCHAR(50)		NOT NULL
	,CONSTRAINT TArtists_PK PRIMARY KEY(intArtistID)
)


-- --------------------------------------------------------------------------------
-- Step #2.2: Identify & Create Foreign Keys
-- --------------------------------------------------------------------------------
--	#				Child					Parent					Column(s)
--	--				-----					------					-------
--	1				TUserFavouriteSongs		TUsers					intUserID					
--	2				TUserFavouriteSongs		TSongs					intSongID
--	3				TSongs					TArtists				intArtistID	

--	1
ALTER TABLE TUserFavouriteSongs ADD CONSTRAINT TUserFavouriteSongs_TUsers_FK 	
	FOREIGN KEY ( intUserID ) REFERENCES TUsers ( intUserID )

--	2
ALTER TABLE TUserFavouriteSongs ADD CONSTRAINT TUserFavouriteSongs_TSongs_FK 	
	FOREIGN KEY ( intSongID ) REFERENCES TSongs ( intSongID )

--	3
ALTER TABLE TSongs ADD CONSTRAINT TSongs_TArtists_FK 	
	FOREIGN KEY ( intArtistID ) REFERENCES TArtists ( intArtistID )

-- --------------------------------------------------------------------------------
-- Step #2.3: INSERT Statements
-- --------------------------------------------------------------------------------
INSERT INTO TUsers(intUserID,strUserName,strEmailAddress)
VALUES		 (1,'UserName1','EmailAddress1')
			,(2,'UserName2','EmailAddress2')
			,(3,'UserName3','EmailAddress3')

INSERT INTO TArtists(intArtistID,strArtist)
VALUES		 (1,'Artist1')
			,(2,'Artist2')
			,(3,'Artist3')

INSERT INTO TSongs(intSongID,strName,intArtistID )
VALUES		 (1,'Song1',2)
			,(2,'Song2',3)
			,(3,'Song3',1)

INSERT INTO TUserFavouriteSongs(intUserID,intSongID,intSortOrder)
VALUES		 (1,1,1)
			,(1,2,2)
			
			,(2,3,1)
			,(2,1,2)
			
			,(3,3,1)
			,(3,2,2)
-- --------------------------------------------------------------------------------
-- Step #2.2: JOIN Statements
-- --------------------------------------------------------------------------------
GO
CREATE VIEW VUserFavoriteSongs
AS
SELECT 
	 TU.intUserID
	,TU.strUserName
	,TUFS.intSortOrder
	,TS.intSongID
	,TS.strName
FROM 
	 TUsers					AS TU
		INNER JOIN TUserFavouriteSongs	AS TUFS
				INNER JOIN TSongs	AS TS
				ON	(TUFS.intSongID	= TS.intSongID)
		ON	(TU.intUserID=TUFS.intUserID)
GO

SELECT 
	* 
FROM 
	VUserFavoriteSongs
ORDER BY 
	 strUserName
	,intSortOrder

DROP VIEW VTeamPlayers
DROP VIEW VUserFavoriteSongs
-- --------------------------------------------------------------------------------
-- Step #3.1: Create Statements
-- --------------------------------------------------------------------------------

CREATE TABLE TCourses
(
	 intCourseID				INTEGER				NOT NULL
	,strCourse					VARCHAR(50)			NOT NULL
	,strDescription				VARCHAR(50)			NOT NULL
	,intInstructorID			INTEGER				NOT NULL
	,intRoomID					INTEGER				NOT NULL
	,strMeetingTimes			VARCHAR(50)			NOT NULL
	,CONSTRAINT TCourses_PK PRIMARY KEY(intCourseID)
)
CREATE TABLE TInstructors
(
	 intInstructorID			INTEGER				NOT NULL
	,strFirstName				VARCHAR(50)			NOT NULL
	,strLastName				VARCHAR(50)			NOT NULL
	,strPhoneNumber				VARCHAR(50)			NOT NULL
	,CONSTRAINT TInstructors_PK PRIMARY KEY(intInstructorID)
)	
CREATE TABLE TRooms
(
	 intRoomID					INTEGER				NOT NULL 
	,strNumber					VARCHAR(50)			NOT NULL
	,intCapacity				INTEGER				NOT NULL
	,CONSTRAINT TRooms_PK PRIMARY KEY(intRoomID)
)	
CREATE TABLE TCourseStudents
(
	 intCourseID				INTEGER				NOT NULL
	,intStudentID				INTEGER				NOT NULL
	,intGradeID					INTEGER				NOT NULL
	,CONSTRAINT TCourseStudents_PK PRIMARY KEY(intCourseID,intStudentID)
)
CREATE TABLE TGrades
(
	 intGradeID					INTEGER				NOT NULL
	,strGrade					VARCHAR(50)			NOT NULL
	,CONSTRAINT TGrades_PK PRIMARY KEY(intGradeID)
)
CREATE TABLE TStudents
(
	 intStudentID				INTEGER				NOT NULL 
	,strFirstName				VARCHAR(50)			NOT NULL
	,strLastName				VARCHAR(50)			NOT NULL
	,strStudentNumber			VARCHAR(50)			NOT NULL
	,strPhoneNumber				VARCHAR(50)			NOT NULL
	,CONSTRAINT TStudents_PK PRIMARY KEY(intStudentID)
)
CREATE TABLE TCourseBooks
(
	 intCourseID				INTEGER				NOT NULL
	,intBookID					INTEGER				NOT NULL
	,CONSTRAINT TCourseBooks_PK PRIMARY KEY(intCourseID,intBookID)
)
CREATE TABLE TBooks
(
	 intBookID					INTEGER				NOT NULL 
	,strBookName				VARCHAR(50)			NOT NULL
	,strAuthor					VARCHAR(50)			NOT NULL
	,strISBN					VARCHAR(50)			NOT NULL
	,CONSTRAINT TBooks_PK PRIMARY KEY(intBookID)
)	

-- --------------------------------------------------------------------------------
-- Step #3.2: Identify & Create Foreign Keys
-- --------------------------------------------------------------------------------
--	#				Child					Parent					Column(s)
--	--				-----					------					-------
--	1				TCourses				TInstructors			intInstructorID					
--	2				TCourses				TRooms					intRoomID
--	3				TCourseStudents			TCourses				intCourseID	
--	4				TCourseStudents			TStudents				intStudentID					
--	5				TCourseStudents			TGrades					intGradeID
--	6				TCourseBooks			TCourses				intCourseID	
--	7				TCourseBooks			TBooks					intBookID					

--	1
ALTER TABLE TCourses ADD CONSTRAINT TCourses_TInstructors_FK 	
	FOREIGN KEY ( intInstructorID ) REFERENCES TInstructors ( intInstructorID )

--	2
ALTER TABLE TCourses ADD CONSTRAINT TCourses_TRooms_FK 	
	FOREIGN KEY ( intRoomID ) REFERENCES TRooms ( intRoomID )

--	3
ALTER TABLE TCourseStudents ADD CONSTRAINT TCourseStudents_TCourses_FK 	
	FOREIGN KEY ( intCourseID ) REFERENCES TCourses ( intCourseID )

--	4
ALTER TABLE TCourseStudents ADD CONSTRAINT TCourseStudents_TStudents_FK 	
	FOREIGN KEY ( intStudentID ) REFERENCES TStudents ( intStudentID )

--	5
ALTER TABLE TCourseStudents ADD CONSTRAINT TCourseStudents_TGrades_FK 	
	FOREIGN KEY ( intGradeID ) REFERENCES TGrades ( intGradeID )

--	6
ALTER TABLE TCourseBooks ADD CONSTRAINT TCourseBooks_TCourses_FK 	
	FOREIGN KEY ( intCourseID ) REFERENCES TCourses ( intCourseID )

--	7
ALTER TABLE TCourseBooks ADD CONSTRAINT TCourseBooks_TBooks_FK 	
	FOREIGN KEY ( intBookID ) REFERENCES TBooks ( intBookID )

-- --------------------------------------------------------------------------------
-- Step #3.3: INSERT Statement
-- --------------------------------------------------------------------------------
INSERT INTO TInstructors(intInstructorID,strFirstName,strLastName,strPhoneNumber)
VALUES		 (1,'FirstName','LastName','PhoneNumber')
			,(2,'FirstName','LastName','PhoneNumber')

INSERT INTO TRooms(intRoomID,strNumber,intCapacity)
VALUES		 (1,'RoomNumber',25)
			,(2,'RoomNumber',20)

INSERT INTO TCourses(intCourseID,strCourse,strDescription,intInstructorID,intRoomID,strMeetingTimes)
VALUES		 (1,'CourseName','Description',1,2,'MeetingTime')
			,(2,'CourseName','Description',2,1,'MeetingTime')

INSERT INTO TStudents(intStudentID,strFirstName,strLastName,strStudentNumber,strPhoneNumber)
VALUES		 (1,'FirstName','LastName','StudentNumber','PhoneNumber')
			,(2,'FirstName','LastName','StudentNumber','PhoneNumber')

INSERT INTO TGrades(intGradeID,strGrade)
VALUES		 (1,'A')
			,(2,'B')	
			,(3,'C')
			,(4,'D')
			,(5,'E')
			,(6,'U')		

INSERT INTO TCourseStudents(intCourseID,intStudentID,intGradeID)
VALUES		 (1,1,2)
			,(1,2,4)

			,(2,1,5)
			,(2,2,1)

INSERT INTO TBooks(intBookID,strBookName,strAuthor,strISBN)
VALUES		 (1,'BookName','AuthorName','ISBN')
			,(2,'BookName','AuthorName','ISBN')

INSERT INTO TCourseBooks(intCourseID,intBookID)
VALUES		 (1,1)
			,(1,2)

			,(2,1)
			,(2,2)
-- --------------------------------------------------------------------------------
-- Step #3.4a: Join Statements
--	Shows the CourseID, Name, Description, Meeting time along with 
--						Instructor Information and Room Information
-- --------------------------------------------------------------------------------
GO
CREATE VIEW VCourses
AS 
SELECT 
	 TC.intCourseID
	,TC.strCourse
	,TC.strDescription
	,TC.strMeetingTimes
	,TI.intInstructorID
	,TI.strLastName + ', ' + TI.strFirstName AS strFullName
	,TR.intRoomID
	,TR.strNumber
	,TR.intCapacity

FROM 
	 TCourses		AS TC
				INNER JOIN TInstructors	AS TI
				ON	( TC.intInstructorID=TI.intInstructorID)
				
				INNER JOIN 	TRooms			AS TR
				ON (TC.intRoomID=TR.intRoomID)
GO

SELECT 
	* 
FROM 
	VCourses		
ORDER BY 
	strCourse


-- --------------------------------------------------------------------------------
-- Step #3.4b: Join Statement
--			Display Course Student & Grade
-- --------------------------------------------------------------------------------
GO
CREATE VIEW VCourseStudentGrades
AS

SELECT

	 TS.intStudentID 
	,TS.strLastName + ', ' + TS.strFirstName AS strFullName
	,TC.intCourseID
	,TC.strCourse
	,TG.intGradeID
	,TG.strGrade

FROM 
	 TCourses	AS	TC 
		INNER JOIN TCourseStudents AS TCS
				INNER JOIN TStudents AS TS
				ON ( TCS.intStudentID	=	TS.intStudentID)
				
				INNER JOIN TGrades AS TG
				ON (TCS.intGradeID		=	TG.intGradeID )
		ON ( TC.intCourseID		=	TCS.intCourseID)  

GO

SELECT 
	* 
FROM 
	VCourseStudentGrades
ORDER BY 
	 strCourse
	,strFullName
	

-- --------------------------------------------------------------------------------
-- Step #4.1: Create Table Statements
-- --------------------------------------------------------------------------------
CREATE TABLE TFlights
(
	 intFlightID						INTEGER				NOT NULL
	,strFlight							VARCHAR(50)			NOT NULL
	,strDescription						VARCHAR(50)			NOT NULL
	,intAirplaneID						INTEGER				NOT NULL
	,CONSTRAINT TFlights_PK PRIMARY KEY(intFlightID)
)
CREATE TABLE TAirplanes
(
	 intAirplaneID						INTEGER				NOT NULL
	,strAirplaneNumber					VARCHAR(50)			NOT NULL
	,strAirplaneType					VARCHAR(50)			NOT NULL
	,intAirplaneCapacity				INTEGER				NOT NULL
	,CONSTRAINT TAirplanes_PK PRIMARY KEY(intAirplaneID)
)	
CREATE TABLE TFlightPilots
(
	 intFlightID						INTEGER				NOT NULL
	,intPilotID							INTEGER				NOT NULL
	,strRole							VARCHAR(50)			NOT NULL
	,CONSTRAINT TFlightPilots_PK PRIMARY KEY(intFlightID,intPilotID)
)
CREATE TABLE TPilots
(
	 intPilotID							INTEGER				NOT NULL
	,strFirstName						VARCHAR(50)			NOT NULL
	,strLastName						VARCHAR(50)			NOT NULL
	,strPhoneNumber						VARCHAR(50)			NOT NULL
	,CONSTRAINT TPilots_PK PRIMARY KEY(intPilotID)
)

CREATE TABLE TFlightPassengers
(
	 intFlightID						INTEGER				NOT NULL
	,intPassengerIndex					INTEGER				NOT NULL
	,intPassengerID						INTEGER				NOT NULL
	,strSeatNumber						VARCHAR(50)			NOT NULL
	,CONSTRAINT TFlightPassengers_PK PRIMARY KEY(intFlightID,intPassengerIndex)
)
CREATE TABLE TPassengers
(
	 intPassengerID						INTEGER				NOT NULL
	,strFirstName						VARCHAR(50)			NOT NULL
	,strLastName						VARCHAR(50)			NOT NULL
	,strPhoneNumber						VARCHAR(50)			NOT NULL
	,CONSTRAINT TPassengers_PK PRIMARY KEY(intPassengerID)
)
CREATE TABLE TFlightFlightAttendants
(
	 intFlightID 						INTEGER				NOT NULL
	,intFlightAttendantID				INTEGER				NOT NULL
	,CONSTRAINT TFlightFlightAttendants_PK PRIMARY KEY(intFlightID,intFlightAttendantID)
)
CREATE TABLE TFlightAttendants
(
	 intFlightAttendantID				INTEGER				NOT NULL
	,strFirstName						VARCHAR(50)			NOT NULL
	,strLastName						VARCHAR(50)			NOT NULL
	,strPhoneNumber						VARCHAR(50)			NOT NULL
	,CONSTRAINT TFlightAttendants_PK PRIMARY KEY(intFlightAttendantID)
)	
-- --------------------------------------------------------------------------------
-- Step 4.2: Identify & Create Foreign Keys
-- --------------------------------------------------------------------------------
--	#				Child						Parent					Column(s)
--	--				-----						------					-------
--	1				TFlights					TAirplanes				intAirplaneID					
--	2				TFlightPilots				TFlights				intFlightID
--	3				TFlightPilots				TPilots					intPilotID	
--	4				TFlightPassengers			TFlights				intFlightID					
--	5				TFlightPassengers			TPassengers				intPassengerID
--	6				TFlightFlightAttendances	TFlights				intFlightID	
--	7				TFlightFlightAttendances	TFlightAttendants		intFLightAttendantID					

--	1
ALTER TABLE TFlights ADD CONSTRAINT TCourses_TAirplanes_FK 	
	FOREIGN KEY ( intAirplaneID ) REFERENCES TAirplanes ( intAirplaneID )

--	2
ALTER TABLE TFlightPilots ADD CONSTRAINT TFlightPilots_TFlights_FK 	
	FOREIGN KEY ( intFlightID ) REFERENCES TFlights ( intFlightID )

--	3
ALTER TABLE TFlightPilots ADD CONSTRAINT TFlightPilots_TPilots_FK 	
	FOREIGN KEY ( intPilotID ) REFERENCES TPilots ( intPilotID )

--	4
ALTER TABLE TFlightPassengers ADD CONSTRAINT TFlightPassengers_TFlights_FK 	
	FOREIGN KEY ( intFlightID ) REFERENCES TFlights ( intFlightID )

--	5
ALTER TABLE TFlightPassengers ADD CONSTRAINT TFlightPassengers_TPassengers_FK 	
	FOREIGN KEY ( intPassengerID ) REFERENCES TPassengers ( intPassengerID )

--	6
ALTER TABLE TFlightFlightAttendants ADD CONSTRAINT TFlightFlightAttendants_TFlights_FK 	
	FOREIGN KEY ( intFlightID ) REFERENCES TFlights ( intFlightID )

--	7
ALTER TABLE TFlightFlightAttendances ADD CONSTRAINT TFlightFlightAttendances_TFlightAttendants_FK 	
	FOREIGN KEY ( intFLightAttendantID ) REFERENCES TFlightAttendants ( intFLightAttendantID )

-- --------------------------------------------------------------------------------
-- Step #4.3: Insert Statements
-- --------------------------------------------------------------------------------
INSERT INTO TAirplanes(intAirplaneID,strAirplaneNumber,strAirplaneType,intAirplaneCapacity)
VALUES			 (1,'AirplaneNumber','AirplanType',500)
				,(2,'AirplaneNumber','AirplanType',400)

INSERT INTO TFlights(intFlightID,strFlight,strDescription,intAirplaneID)
VALUES			 (1,'FirghtName','Description',2)
				,(2,'FlightName','Description',1)

INSERT INTO TPilots(intPilotID,strFirstName,strLastName,strPhoneNumber)
VALUES			 (1,'FirstName','LastName','PhoneNumber')
				,(2,'FirstName','LastName','PhoneNumber')

INSERT INTO TFlightPilots(intFlightID,intPilotID,strRole)
VALUES			 (1,1,'Pilot')
				,(1,2,'Co-Pilot')

				,(2,1,'Pilot')
				,(2,2,'Co-Pilot')

INSERT INTO TFlightAttendants(intFlightAttendantID,strFirstName,strLastName,strPhoneNumber)
VALUES			 (1,'FirstName','LastName','PhoneNumber')
				,(2,'FirstName','LastName','PhoneNumber')

INSERT INTO TFlightFlightAttendants(intFlightID,intFlightAttendantID)
VALUES			 (1,1)
				,(1,2)

				,(2,1)
				,(2,2)

INSERT INTO TPassengers(intPassengerID,strFirstName,strLastName,strPhoneNumber)
VALUES			 (1,'FirstName','LastName','PhoneNUmber')
				,(2,'FirstName','LastName','PhoneNUmber')

INSERT INTO TFlightPassengers(intFlightID,intPassengerIndex,intPassengerID,strSeatNumber)
VALUES			 (1,1,1,'SeatNumber')
				,(1,2,2,'SeatNumber')
				,(2,1,1,'SeatNumber')
				,(2,2,2,'SeatNumber')
-- --------------------------------------------------------------------------------
-- Step #4.4: Join Statement
-- all the flight information and all pilots (not co-pilots). 
-- Display the airplane information, too.    
-- --------------------------------------------------------------------------------
GO
CREATE VIEW VFlights
AS 
SELECT 
	 TF.intFlightID
	,TF.strFlight
	,TF.strDescription
	,TFP.intPilotID
	,TFP.strRole
	,TP.strLastName + ', ' + TP.strFirstName AS strPilot
	,TA.intAirplaneID
	,TA.strAirplaneNumber
	,TA.strAirplaneType
	,TA.intAirplaneCapacity
FROM 
	 TFlights	AS	TF
			
			INNER JOIN TFlightPilots	AS	TFP
							
							INNER JOIN	TPilots AS TP		
							ON (TFP.intPilotID=TP.intPilotID AND TFP.strRole='Pilot')
			
			ON (TF.intFlightID	=	TFP.intFlightID)
			
			INNER JOIN TAirplanes		AS	TA
			ON ( TF.intAirplaneID	=	TA.intAirplaneID)
GO
SELECT 
	* 
FROM 
	VFlights
ORDER BY 
	 strFlight



-- --------------------------------------------------------------------------------
-- Step #4.4b: JOIN Statement
-- 5)	Write the join that will show all passengers on all flights.  
--	Be sure to include an ORDER BY clause.
-- --------------------------------------------------------------------------------
GO
CREATE VIEW VFlightPassengers
AS
SELECT 
	 TF.intFlightID
	,TF.strFlight
	,TF.strDescription
	,TFP.intPassengerIndex
	,TFP.strSeatNumber
	,TP.intPassengerID
	,TP.strLastName	+ ', ' + TP.strFirstName AS strPassengers
	,TP.strPhoneNumber
FROM

	 TFlights	AS	TF
			INNER JOIN TFlightPassengers	AS	TFP
				
					INNER JOIN TPassengers	AS	TP
					ON (TFP.intPassengerID	=	TP.intPassengerID)
			
			ON (TF.intFlightID	=	TFP.intFlightID)
GO
SELECT 
	* 
FROM 
	VFlightPassengers
ORDER BY 
	 strFlight
	,strSeatNumber


-- --------------------------------------------------------------------------------
-- Step #5.1: CREATE TABLE 
-- --------------------------------------------------------------------------------
CREATE TABLE TCustomers
(
	 intCustomerID					INTEGER				NOT NULL 
	,strFirstName					VARCHAR(50)			NOT NULL
	,strLastName					VARCHAR(50)			NOT NULL
	,CONSTRAINT TCustomers_PK PRIMARY KEY (intCustomerID)
)

CREATE TABLE TCustomerOrders
(
	 intCustomerID					INTEGER				NOT NULL
	,intOrderIndex					INTEGER				NOT NULL 
	,dtmOrderDate					DATETIME			NOT NULL
	,CONSTRAINT TCustomerOrders_PK PRIMARY KEY(intCustomerID,intOrderIndex)
)

CREATE TABLE TCustomerOrderItems
(
	 intCustomerID					INTEGER				NOT NULL
	,intOrderIndex					INTEGER				NOT NULL
	,intItemID						INTEGER				NOT NULL 
	,intQuantity					INTEGER				NOT NULL 
	,CONSTRAINT TCustomerOrderItems_PK PRIMARY KEY (intCustomerID,intOrderIndex,intItemID)
)

CREATE TABLE TItems
(
	 intItemID						INTEGER				NOT NULL 
	,strItemName					VARCHAR(50)			NOT NULL 
	,monItemPrice					MONEY				NOT NULL 
	,CONSTRAINT TItems_PK PRIMARY KEY(intItemID)
)
-- --------------------------------------------------------------------------------
-- Step #5.2: Identify and Create Foreign Keys
-- --------------------------------------------------------------------------------
--	#				Child						Parent					Column(s)
--	--				-----						------					-------
--	1				TCustomerOrders				TCustomers				intCustomerID					
--	2				TCustomerOrderItems			TCustomerOrders			intCustomerID,intOrderIndex
--	3				TCustomerOrderItems			TItems					intItemID

-- 1 
ALTER TABLE TCustomerOrders ADD CONSTRAINT TCustomerOrders_TCustomers_FK
	FOREIGN KEY ( intCustomerID ) REFERENCES TCustomers ( intCustomerID )


-- 2 
ALTER TABLE TCustomerOrderItems ADD CONSTRAINT TCustomerOrderItems_TCustomerOrders_FK
	FOREIGN KEY ( intCustomerID,intOrderIndex ) REFERENCES TCustomerOrders ( intCustomerID,intOrderIndex )


-- 3 
ALTER TABLE TCustomerOrderItems ADD CONSTRAINT TCustomerOrderItems_TItems_FK
	FOREIGN KEY ( intItemID ) REFERENCES TItems ( intItemID )

-- --------------------------------------------------------------------------------
-- Step #5.3: Insert Statements
-- --------------------------------------------------------------------------------
INSERT INTO TCustomers(intCustomerID,strFirstName,strLastName)
VALUES		 (1,'FirstName','LastName')
			,(2,'FirstName','LastName')
			,(3,'FirstName','LastName')

INSERT INTO TCustomerOrders(intCustomerID,intOrderIndex,dtmOrderDate)
VALUES		 (1,1,'2002/02/02')
			,(1,2,'2001/01/01')
			,(1,3,'2003/03/03')

			,(2,1,'2004/04/04')
			,(2,2,'2005/05/05')
			,(2,3,'2006/06/06')

			,(3,1,'2007/07/07')
			,(3,2,'2008/08/08')
			,(3,3,'2009/09/09')


INSERT INTO TItems(intItemID,strItemName,monItemPrice)
VALUES		 (1,'ItemName',1000)
			,(2,'ItemName',2000)
			,(3,'ItemName',3000)

INSERT INTO TCustomerOrderItems(intCustomerID,intOrderIndex,intItemID,intQuantity)
VALUES		 (1,1,1,20)
			,(1,1,2,40)
			
			,(1,2,2,20)
			,(1,2,3,40)
			
			,(1,3,1,20)
			,(1,3,3,40)
			
			,(2,1,1,20)
			,(2,1,3,40)
			
			,(2,2,1,40)
			,(2,2,2,20)

			,(2,3,1,40)
			,(2,3,3,20)
						
			,(3,1,2,20)
			,(3,1,3,40)
			
			,(3,2,2,20)
			,(3,2,3,20)
			
			,(3,3,1,20)
			,(3,3,3,20)

-- --------------------------------------------------------------------------------
-- Step #5.3: Join Statements
-- --------------------------------------------------------------------------------
GO
CREATE VIEW	VCustomerOrderItems
AS
SELECT 
	 TC.intCustomerID
	,TC.strLastName + ', ' + TC.strFirstName AS strCustomer
	,TCO.intOrderIndex
	,TCO.dtmOrderDate
	,TI.intItemID
	,TI.strItemName
	,TI.monItemPrice
	,TCOI.intQuantity

FROM 

	 TCustomers	AS	TC
		
		INNER JOIN TCustomerOrders	AS	TCO
				
					INNER JOIN TCustomerOrderItems	AS	TCOI

								INNER JOIN 	TItems	AS	TI
								ON (TCOI.intItemID	=	TI.intItemID)

					ON (TCO.intCustomerID	=	TCOI.intCustomerID AND	
						TCO.intOrderIndex	=	TCOI.intOrderIndex)

		ON (TC.intCustomerID	=	TCO.intCustomerID)
GO

SELECT 
	*
FROM 
	VCustomerOrderItems
ORDER BY 
	 strCustomer
	,dtmOrderDate
	,strItemName