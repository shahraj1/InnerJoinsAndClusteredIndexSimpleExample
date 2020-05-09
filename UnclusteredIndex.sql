-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbSQL1		-- Get out of the master database
SET NOCOUNT ON	-- Report only errors

-- --------------------------------------------------------------------------------
-- Step #1.1: Drop Tables
-- --------------------------------------------------------------------------------
-- Drop Table
IF OBJECT_ID( 'TTeamPlayers' ) IS NOT NULL DROP TABLE TTeamPlayers
IF OBJECT_ID( 'TTeams' ) IS NOT NULL DROP TABLE TTeams
IF OBJECT_ID( 'TPlayers' ) IS NOT NULL DROP TABLE TPlayers

-- Drop View	
IF OBJECT_ID( 'VTeamPlayers' ) IS NOT NULL DROP VIEW VTeamPlayers

-- --------------------------------------------------------------------------------
-- Step #1.2: Create Tables
-- --------------------------------------------------------------------------------
CREATE TABLE TTeams
(
	 intTeamID				INTEGER				NOT NULL
	,strTeam				VARCHAR(50)			NOT NULL
	,chrFiller				CHAR(900)			NOT NULL
	,CONSTRAINT	TTeams_PK PRIMARY KEY (intTeamID)

)

CREATE TABLE TPlayers
(
	 intPlayerID			INTEGER				NOT NULL
	,strFirstName			VARCHAR(50)			NOT NULL
	,strLastName			VARCHAR(50)			NOT NULL
	,chrFiller				CHAR(900)			NOT NULL
	,CONSTRAINT	TPlayers_PK	PRIMARY KEY(intPlayerID)
)

CREATE TABLE TTeamPlayers
(
	 intTeamID				INTEGER				NOT NULL
	,intPlayerID			INTEGER				NOT NULL
	,chrFiller				CHAR(900)			NOT NULL
	,CONSTRAINT TTeamPlayers_PK	PRIMARY KEY(intTeamID,intPlayerID)
)


-- --------------------------------------------------------------------------------
-- Step #1.3: Identify & Create Foreign Keys
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
-- Step #1.3:Create a non-clustered Index for TTeams on strTeam
-- --------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX TTeams_strTeam_NI
ON TTeams(strTeam)

-- --------------------------------------------------------------------------------
-- Step #1.3:Create a non-clustered Index for TPlayers on strLastName,strFirstName
-- --------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX TTeams_strFullName_NI
ON TPlayers(strLastName,strFirstName)

-- --------------------------------------------------------------------------------
-- Step #1.4:INSERT INTO TTeams
-- --------------------------------------------------------------------------------
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 94,  'The Valuable Rams',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 31,  'The Unequaled Chimpanzees',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 20,  'The Limping Moles',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 33,  'The Left Sheep',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 77,  'The Lethal Jackals',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 17,  'The Best Hedgehogs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 88,  'The Naughty Pelicans',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 11,  'The Festive Seals',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 39,  'The Strange Louses',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 12,  'The Like Worms',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 87,  'The Valuable Rams',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 48,  'The Impartial Whales',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 60,  'The Icy Chickens',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 99,  'The Madly Dogs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 75,  'The Serious Lyrebirds',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 82,  'The Full Toads',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 89,  'The Cowardly Armadillos',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 58,  'The Curious Dugongs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 49,  'The Profuse Anteaters',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 2,  'The Willing Zebras',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 10,  'The Fuzzy Apes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 40,  'The Fragile Monkeys',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 1,  'The Eight Sharks',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 8,  'The Seemly Frogs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 16,  'The Light Porcupines',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 28,  'The Abstracted Antelopes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 4,  'The Real Bison',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 35,  'The Lumpy Dogfishes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 68,  'The Familiar Seastars',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 67,  'The Careless Squids',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 37,  'The Repulsive Turkeys',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 65,  'The Slow Oysters',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 78,  'The Hapless Echidnas',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 30,  'The Oafish Turtles',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 76,  'The Depressed Ravens',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 22,  'The Insidious Donkeys',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 5,  'The Nifty Kangaroos',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 34,  'The Terrific Eagles',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 61,  'The Previous Minks',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 19,  'The Confused Bears',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 100,  'The Languid Cranes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 38,  'The Lopsided Stinkbugs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 90,  'The Sharp Pandas',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 96,  'The Cowardly Armadillos',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 53,  'The Public Gooses',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 18,  'The One Crabs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 47,  'The Tame Penguins',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 44,  'The Knowing Jellyfishes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 63,  'The Early Hares',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 14,  'The Abaft Panthers',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 83,  'The Aware Butterflys',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 55,  'The Superficial Baboons',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 72,  'The Optimal Humans',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 73,  'The Omniscient Cobras',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 13,  'The Spectacular Guineapigs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 85,  'The Glorious Falcons',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 92,  'The Glorious Falcons',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 74,  'The Crowded Eels',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 59,  'The Calculating Ants',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 57,  'The Ablaze Ferrets',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 79,  'The Adhoc Coyotes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 7,  'The Tense Elks',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 52,  'The Abashed Meerkats',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 64,  'The Ill-fated Donkies',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 27,  'The Bawdy Gazelles',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 25,  'The Quack Squirrels',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 50,  'The Curly Crocodiles',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 21,  'The Decisive Salamanders',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 29,  'The Nervous Wolves',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 98,  'The Actually Lions',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 23,  'The Tricky Buffalos',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 95,  'The Naughty Pelicans',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 69,  'The Handsomely Camels',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 43,  'The Erratic Mules',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 15,  'The Nappy Hippopotamuss',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 71,  'The Material Rhinoceroses',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 56,  'The Gabby Horses',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 91,  'The Devilish Cats',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 51,  'The Wide-eyed Pigs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 6,  'The Level Nightingales',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 93,  'The Amusing Snakes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 9,  'The Shaky Larks',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 3,  'The Extra-large Owls',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 86,  'The Amusing Snakes',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 32,  'The Keen Koalas',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 81,  'The Victorious Lemurs',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 66,  'The Helpless Spiders',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 97,  'The Sharp Pandas',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 42,  'The Clean Lobsters',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 45,  'The Alike Walruses',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 54,  'The Flimsy Hyenas',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 26,  'The Responsible Shrews',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 46,  'The Makeshift Magpies',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 62,  'The Pushy Deers',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 36,  'The Harsh Hamsters',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 41,  'The Groovy Flys',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 24,  'The Descriptive Elephants',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 84,  'The Devilish Cats',  ''  ) 
INSERT INTO TTeams ( intTeamID, strTeam, chrFiller ) VALUES ( 80,  'The Cool Llamas',  ''  ) 

-- --------------------------------------------------------------------------------
-- Step #1.5:INSERT INTO TPlayers
-- --------------------------------------------------------------------------------
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 31,  'Thomas',  'Washington',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 14,  'Gerald',  'Wright',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 84,  'Douglas',  'Rodriguez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 81,  'James',  'Cox',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 92,  'Shirley',  'Thompson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 22,  'Frances',  'Gonzalez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 72,  'Bobby',  'Garcia',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 6,  'Jennifer',  'Kelly',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 20,  'Mark',  'Nelson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 57,  'Kathy',  'Watson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 93,  'Annie',  'Wood',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 18,  'Randy',  'Price',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 64,  'Richard',  'Martin',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 38,  'Lisa',  'Adams',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 60,  'Bruce',  'Ramirez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 39,  'Matthew',  'Rogers',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 43,  'Christopher',  'Smith',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 49,  'Alan',  'Jenkins',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 33,  'Frank',  'Bryant',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 23,  'Maria',  'Robinson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 73,  'Janet',  'Anderson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 12,  'Angela',  'Moore',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 79,  'Walter',  'Coleman',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 15,  'Carol',  'Davis',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 30,  'Marie',  'Russell',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 88,  'Jack',  'Long',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 50,  'Edward',  'Patterson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 26,  'Deborah',  'Perry',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 37,  'Lois',  'Johnson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 36,  'Stephanie',  'Morris',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 29,  'Kathleen',  'Brooks',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 65,  'Shawn',  'Perez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 53,  'Joe',  'Simmons',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 17,  'Pamela',  'Sanchez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 13,  'Sean',  'Bailey',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 47,  'Juan',  'White',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 46,  'Willie',  'Green',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 67,  'Norma',  'Brown',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 69,  'Kevin',  'Jackson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 97,  'Judy',  'Wilson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 52,  'Nancy',  'Bennett',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 19,  'Kathryn',  'Evans',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 55,  'Louis',  'Parker',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 82,  'Louise',  'Collins',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 2,  'Elizabeth',  'Phillips',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 74,  'Andrea',  'Mitchell',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 86,  'Anne',  'Griffin',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 27,  'Victor',  'Alexander',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 71,  'Sharon',  'Turner',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 9,  'Joyce',  'Campbell',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 34,  'Tammy',  'Lopez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 90,  'Teresa',  'Miller',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 3,  'Larry',  'Cook',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 1,  'Ashley',  'Flores',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 87,  'Carolyn',  'Reed',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 70,  'Christina',  'Martinez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 40,  'Terry',  'Foster',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 59,  'Brian',  'Peterson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 24,  'Michelle',  'Howard',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 78,  'Roger',  'Butler',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 63,  'Gary',  'Hernandez',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 48,  'Beverly',  'Edwards',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 56,  'Cynthia',  'Gonzales',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 95,  'Melissa',  'Thomas',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 68,  'Justin',  'Morgan',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 75,  'David',  'Baker',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 4,  'Rachel',  'Torres',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 99,  'Anthony',  'Ward',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 98,  'Julie',  'Allen',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 32,  'Steve',  'Jones',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 85,  'Ralph',  'Taylor',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 16,  'Brenda',  'Diaz',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 96,  'Sandra',  'Powell',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 10,  'Cheryl',  'Bell',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 25,  'Judith',  'Carter',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 44,  'Wanda',  'James',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 21,  'Tina',  'Lee',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 41,  'Catherine',  'Harris',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 8,  'Amy',  'Roberts',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 94,  'Linda',  'Scott',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 61,  'Adam',  'Hall',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 58,  'Donna',  'Cooper',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 54,  'Chris',  'Stewart',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 7,  'Gloria',  'Young',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 89,  'Theresa',  'Richardson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 80,  'Patrick',  'Ross',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 28,  'Phillip',  'Clark',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 91,  'Jeffrey',  'Hughes',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 42,  'Margaret',  'Hill',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 11,  'Ernest',  'Lewis',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 66,  'Lawrence',  'Walker',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 83,  'John',  'King',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 5,  'Eric',  'Barnes',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 45,  'Jason',  'Gray',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 77,  'Nicholas',  'Williams',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 76,  'Albert',  'Murphy',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 51,  'Samuel',  'Sanders',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 62,  'Ruby',  'Rivera',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 35,  'Diana',  'Henderson',  ''  ) 
INSERT INTO TPlayers ( intPlayerID, strFirstName, strLastName, chrFiller ) VALUES ( 100,  'William',  '',  ''  ) 

-- --------------------------------------------------------------------------------
-- Step #1.6:TTeamPlayers Insert
-- --------------------------------------------------------------------------------
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (62,76,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (41,84,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (57,89,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (65,98,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (53,18,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (39,92,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (85,72,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (84,16,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (80,62,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (24,18,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (78,79,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (94,49,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (18,8,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (47,39,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (14,98,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (63,67,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (13,55,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (75,36,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (91,80,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,48,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (14,49,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (39,11,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (91,90,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (33,17,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (58,32,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (43,53,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (20,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (40,22,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (22,71,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (7,100,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (78,19,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (36,54,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (49,63,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (44,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (72,32,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (56,32,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (65,3,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (88,24,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (84,21,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (99,99,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (17,46,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (8,64,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (65,65,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (18,17,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (82,66,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (98,88,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (58,98,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (39,74,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (94,41,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (72,69,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (14,9,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (33,15,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (15,16,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (34,50,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (90,22,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (57,14,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (2,32,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (40,90,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (56,79,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (90,95,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (99,100,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (57,95,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (74,92,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (80,52,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (22,75,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (46,10,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (3,56,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (11,15,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (22,42,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (95,75,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (84,5,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (6,88,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (63,3,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (44,37,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (66,27,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (24,54,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (57,85,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (37,31,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (34,63,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (21,41,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (23,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (31,13,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (31,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (31,10,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (77,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (87,71,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,7,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (11,19,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (55,58,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,62,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (11,1,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (30,58,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (38,69,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (13,60,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (14,68,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (56,55,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (42,67,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (6,87,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (26,14,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,10,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (45,64,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (23,65,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (71,34,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (26,28,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (13,80,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (76,41,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (42,90,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,99,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (64,55,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (46,73,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (35,30,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (7,60,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (95,42,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (74,58,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (64,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (95,27,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (24,59,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (35,97,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (74,91,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (91,11,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (59,7,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (68,51,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (79,54,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (35,21,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (24,98,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (89,52,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (62,55,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (87,20,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (28,66,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (5,64,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,83,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (90,47,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (67,49,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (92,39,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (6,89,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (8,74,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (92,17,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (55,91,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (59,32,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (50,65,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (83,24,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (100,62,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (55,36,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (9,92,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (86,27,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (23,79,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (23,85,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (37,42,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (29,82,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (44,57,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (19,93,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (17,97,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (29,65,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (30,20,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (51,15,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (80,31,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (99,84,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (47,6,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (56,66,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (36,40,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (51,14,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (7,48,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (9,81,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (90,21,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (82,37,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (7,6,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (4,9,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (22,10,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (63,15,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (68,19,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (45,23,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (99,55,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (51,51,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (17,96,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (67,38,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (55,59,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (77,84,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (14,35,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (87,18,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (5,63,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (72,61,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (53,5,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (86,41,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (44,53,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (33,90,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (6,86,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (39,45,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (87,65,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (35,15,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (11,83,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (12,76,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (38,41,'')
INSERT INTO TTeamPlayers(intTeamID,intPlayerID,chrFiller) VALUES (16,100,'')



-- --------------------------------------------------------------------------------
-- Step #1.7:Look at the fragmentation levels
-- --------------------------------------------------------------------------------

DBCC SHOWCONTIG

SELECT
	 OBJECT_NAME( object_id )
	,avg_fragmentation_in_percent	-- Lower % = good, Higher % = bad
FROM
	sys.dm_db_index_physical_stats ( DB_ID ( ), NULL, NULL, NULL, 'DETAILED' )


-- Table: 'TTeams' (1272755987); index ID: 1, database ID: 7
-- Scan Density [Best Count:Actual Count].......: 20.00% [3:15]

-- Table: 'TPlayers' (1304756101); index ID: 1, database ID: 7
-- Scan Density [Best Count:Actual Count].......: 21.43% [3:14]

-- Table: 'TTeamPlayers' (1336756215); index ID: 1, database ID: 7
-- Scan Density [Best Count:Actual Count].......: 13.89% [5:36]


-- --------------------------------------------------------------------------------
-- Step #1.8:Look at the fragmentation levels
-- --------------------------------------------------------------------------------

ALTER INDEX ALL ON TTeams REORGANIZE
ALTER INDEX ALL ON TPLayers REORGANIZE 
ALTER INDEX	ALL ON TTeamPlayers REORGANIZE 

ALTER INDEX ALL ON TTeams REBUILD
ALTER INDEX ALL ON TPLayers REBUILD
ALTER INDEX ALL ON TTeamPlayers REBUILD

-- Table: 'TTeams' (1272755987); index ID: 1, database ID: 7
-- Scan Density [Best Count:Actual Count].......: 50.00% [2:4]

-- Table: 'TPlayers' (1304756101); index ID: 1, database ID: 7
-- Scan Density [Best Count:Actual Count].......: 50.00% [2:4]

-- Table: 'TTeamPlayers' (1336756215); index ID: 1, database ID: 7
-- Scan Density [Best Count:Actual Count].......: 80.00% [4:5]

