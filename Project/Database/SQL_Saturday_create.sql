-- Kai He
-- Project£ºSQL Saturday
-- Comp 440
-- Last modification date: 2017-05-18 02:48:32.233

-- tables
-- Table: EvenTable
CREATE TABLE EvenTable (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    number int NOT NULL,
    Event_id int  NOT NULL,
    CONSTRAINT EvenTable_ak_1 UNIQUE (number, Event_id),
);

-- Table: Event
CREATE TABLE Event (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    eName varchar(255) NOT NULL,
    eDate varchar(50) NOT NULL,
    regin varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    CONSTRAINT Event_ak_1 UNIQUE (eName),  
);

-- Table: Gift
CREATE TABLE Gift (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Person_id int  NOT NULL,
    Event_id int  NOT NULL,
    CONSTRAINT Gift_ak_1 UNIQUE (Person_id, Event_id),
);

-- Table: Person
CREATE TABLE Person (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    name varchar(50),
    first_name varchar(50),
    last_name varchar(50),
    street varchar(50),
    city varchar(50),
    state varchar(50),
    zipcode varchar(50),
    email varchar(225),
);

-- Table: PersonRoles
CREATE TABLE PersonRoles (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Person_id int  NOT NULL,
    Roles_id int  NOT NULL,
    CONSTRAINT PersonRoles_ak_1 UNIQUE (Person_id, Roles_id),
);

-- Table: PersonTable
CREATE TABLE PersonTable (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Person_id int  NOT NULL,
    EvenTable_id int  NOT NULL,
    CONSTRAINT PersonTable_ak_1 UNIQUE (Person_id, EvenTable_id),
);

-- Table: Presentation
CREATE TABLE Presentation (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    title varchar(225)  NULL,
    difficulty varchar(50)  NOT NULL,
);

-- Table: PresentationEvent
CREATE TABLE PresentationEvent (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Presentation_id int  NOT NULL,
    Event_id int  NOT NULL,
    CONSTRAINT PresentationEvent_ak_1 UNIQUE (Presentation_id, Event_id),
);

-- Table: PresentationPerson
CREATE TABLE PresentationPerson (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Presentation_id int  NOT NULL,
    Person_id int  NOT NULL,
    Roles_id int  NOT NULL,
    CONSTRAINT PresentationPerson_ak_1 UNIQUE (Presentation_id, Person_id, Roles_id),
);

-- Table: PresentationTrack
CREATE TABLE PresentationTrack (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Presentation_id int  NOT NULL,
    Track_id int  NOT NULL,
    CONSTRAINT PresentationTrack_ak_1 UNIQUE (Presentation_id, Track_id),
);

-- Table: Roles
CREATE TABLE Roles (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    role varchar(50)  NULL,
    CONSTRAINT Roles_ak_1 UNIQUE (role),
);

-- Table: Room
CREATE TABLE Room (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    room varchar(50)  NULL,
    CONSTRAINT Room_ak_1 UNIQUE (room),
);

-- Table: Schedule
CREATE TABLE Schedule (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Presentation_id int  NOT NULL,
    Room_id int  NOT NULL,
    start datetime  NOT NULL,
    "end" datetime  NOT NULL,
    CONSTRAINT Schedule_ak_1 UNIQUE (Presentation_id, Room_id, start),
);

-- Table: Sponsor
CREATE TABLE Sponsor (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    sName varchar(50)  NULL,
    sLevel varchar(50)  NULL,
);

-- Table: SponsorPerson
CREATE TABLE SponsorPerson (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    Person_id int  NOT NULL,
    Sponsor_id int  NOT NULL,
    CONSTRAINT SponsorPerson_ak_1 UNIQUE (Person_id, Sponsor_id),
);

-- Table: Track
CREATE TABLE Track (
    ID INT IDENTITY  PRIMARY KEY NOT NULL,
    tName varchar(225)  NULL,
    CONSTRAINT Track_ak_1 UNIQUE (tName),
);

-- foreign keys
-- Reference: EvenTable_Event (table: EvenTable)
ALTER TABLE EvenTable ADD CONSTRAINT EvenTable_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: Gift_Event (table: Gift)
ALTER TABLE Gift ADD CONSTRAINT Gift_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: Gift_Person (table: Gift)
ALTER TABLE Gift ADD CONSTRAINT Gift_Person
    FOREIGN KEY (Person_id)
    REFERENCES Person (id);

-- Reference: PersonRoles_Person (table: PersonRoles)
ALTER TABLE PersonRoles ADD CONSTRAINT PersonRoles_Person
    FOREIGN KEY (Person_id)
    REFERENCES Person (id);

-- Reference: PersonRoles_Roles (table: PersonRoles)
ALTER TABLE PersonRoles ADD CONSTRAINT PersonRoles_Roles
    FOREIGN KEY (Roles_id)
    REFERENCES Roles (id);

-- Reference: PersonTable_EvenTable (table: PersonTable)
ALTER TABLE PersonTable ADD CONSTRAINT PersonTable_EvenTable
    FOREIGN KEY (EvenTable_id)
    REFERENCES EvenTable (id);

-- Reference: PersonTable_Person (table: PersonTable)
ALTER TABLE PersonTable ADD CONSTRAINT PersonTable_Person
    FOREIGN KEY (Person_id)
    REFERENCES Person (id);

-- Reference: PresentationEvent_Event (table: PresentationEvent)
ALTER TABLE PresentationEvent ADD CONSTRAINT PresentationEvent_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: PresentationEvent_Presentation (table: PresentationEvent)
ALTER TABLE PresentationEvent ADD CONSTRAINT PresentationEvent_Presentation
    FOREIGN KEY (Presentation_id)
    REFERENCES Presentation (id);

-- Reference: PresentationPerson_Person (table: PresentationPerson)
ALTER TABLE PresentationPerson ADD CONSTRAINT PresentationPerson_Person
    FOREIGN KEY (Person_id)
    REFERENCES Person (id);

-- Reference: PresentationPerson_Presentation (table: PresentationPerson)
ALTER TABLE PresentationPerson ADD CONSTRAINT PresentationPerson_Presentation
    FOREIGN KEY (Presentation_id)
    REFERENCES Presentation (id);

-- Reference: PresentationPerson_Roles (table: PresentationPerson)
ALTER TABLE PresentationPerson ADD CONSTRAINT PresentationPerson_Roles
    FOREIGN KEY (Roles_id)
    REFERENCES Roles (id);

-- Reference: PresentationTrack_Presentation (table: PresentationTrack)
ALTER TABLE PresentationTrack ADD CONSTRAINT PresentationTrack_Presentation
    FOREIGN KEY (Presentation_id)
    REFERENCES Presentation (id);

-- Reference: PresentationTrack_Track (table: PresentationTrack)
ALTER TABLE PresentationTrack ADD CONSTRAINT PresentationTrack_Track
    FOREIGN KEY (Track_id)
    REFERENCES Track (id);

-- Reference: Schedule_Presentation (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Presentation
    FOREIGN KEY (Presentation_id)
    REFERENCES Presentation (id);

-- Reference: Schedule_Room (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Room
    FOREIGN KEY (Room_id)
    REFERENCES Room (id);

-- Reference: SponsorPerson_Person (table: SponsorPerson)
ALTER TABLE SponsorPerson ADD CONSTRAINT SponsorPerson_Person
    FOREIGN KEY (Person_id)
    REFERENCES Person (id);

-- Reference: SponsorPerson_Sponsor (table: SponsorPerson)
ALTER TABLE SponsorPerson ADD CONSTRAINT SponsorPerson_Sponsor
    FOREIGN KEY (Sponsor_id)
    REFERENCES Sponsor (id);

-- End of file.

