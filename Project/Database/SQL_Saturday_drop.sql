-- Kai He
-- Project£º SQL Saturday
-- Comp 440
-- Last modification date: 2017-05-18 02:48:32.233

-- foreign keys
ALTER TABLE EvenTable DROP CONSTRAINT EvenTable_Event;

ALTER TABLE Gift DROP CONSTRAINT Gift_Event;

ALTER TABLE Gift DROP CONSTRAINT Gift_Person;

ALTER TABLE PersonRoles DROP CONSTRAINT PersonRoles_Person;

ALTER TABLE PersonRoles DROP CONSTRAINT PersonRoles_Roles;

ALTER TABLE PersonTable DROP CONSTRAINT PersonTable_EvenTable;

ALTER TABLE PersonTable DROP CONSTRAINT PersonTable_Person;

ALTER TABLE PresentationEvent DROP CONSTRAINT PresentationEvent_Event;

ALTER TABLE PresentationEvent DROP CONSTRAINT PresentationEvent_Presentation;

ALTER TABLE PresentationPerson DROP CONSTRAINT PresentationPerson_Person;

ALTER TABLE PresentationPerson DROP CONSTRAINT PresentationPerson_Presentation;

ALTER TABLE PresentationPerson DROP CONSTRAINT PresentationPerson_Roles;

ALTER TABLE PresentationTrack DROP CONSTRAINT PresentationTrack_Presentation;

ALTER TABLE PresentationTrack DROP CONSTRAINT PresentationTrack_Track;

ALTER TABLE Schedule DROP CONSTRAINT Schedule_Presentation;

ALTER TABLE Schedule DROP CONSTRAINT Schedule_Room;

ALTER TABLE SponsorPerson DROP CONSTRAINT SponsorPerson_Person;

ALTER TABLE SponsorPerson DROP CONSTRAINT SponsorPerson_Sponsor;

-- tables
DROP TABLE EvenTable;

DROP TABLE Event;

DROP TABLE Gift;

DROP TABLE Person;

DROP TABLE PersonRoles;

DROP TABLE PersonTable;

DROP TABLE Presentation;

DROP TABLE PresentationEvent;

DROP TABLE PresentationPerson;

DROP TABLE PresentationTrack;

DROP TABLE Roles;

DROP TABLE Room;

DROP TABLE Schedule;

DROP TABLE Sponsor;

DROP TABLE SponsorPerson;

DROP TABLE Track;

DROP PROCEDURE insertAllPresentation;

-- End of file.

