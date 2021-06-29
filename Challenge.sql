/* Joy Ambrose 103620582 */

-- SELECT name
-- FROM
-- sys.databases

-- SUBJECT(SubjCode, Description)
-- PK - SubjCode

-- STUDENT(StudentID, Surname, GivenName, Gender)
-- PK - StudentID

-- SUBJECTOFFERING(SubjCode, Year, Semester, Fee, StaffID)
-- PK - SubjCode, Year, Semester
-- FK - SubjCode REFERENCES SUBJECT
-- FK - StaffID REFERENCES TEACHER

-- ENROLEMENT(StudentID, SubjCode, Year, Semester, Grade, DateEnrolled)
-- PK - StudentID, SubjCode, Year, Semester
-- FK - StudentID REFERENCES STUDENT
-- FK - SubjCode, Year, Semester REFERENCES SUBJECTOFFERING

-- TEACHER(StaffID, Surname, GivenName)
-- PK - StaffID

/*
SELECT name, database_id, create_date 
FROM sys.databases ;
*/

USE S103620582;


DROP TABLE IF EXISTS ENROLEMENT;
DROP TABLE IF EXISTS SUBJECTOFFERING;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS SUBJECT;
DROP TABLE IF EXISTS TEACHER;

GO

CREATE TABLE SUBJECT(
    SubjCode NVARCHAR(100)
,   Description NVARCHAR(500)
,   PRIMARY KEY (SubjCode)
);

CREATE TABLE STUDENT(
    StudentID NVARCHAR(10)
,   Surname NVARCHAR(100) NOT NULL
,   GivenName NVARCHAR(100) NOT NULL
,   Gender NVARCHAR(1) CHECK (Gender IN ('M', 'F', 'I'))
,   PRIMARY KEY (StudentID)
);

CREATE TABLE TEACHER(
    StaffID INT 
,   Surname NVARCHAR(100) NOT NULL
,   GivenName NVARCHAR(100) NOT NULL
,   PRIMARY KEY (StaffID)
);

CREATE TABLE SUBJECTOFFERING(
    SubjCode NVARCHAR (100)
,   Year INT CHECK (Year IN (Len(4)))
,   Semester INT CHECK (Semester IN (1, 2))
,   Fee MONEY NOT NULL CHECK (Fee > 0)
,   StaffID INT 
,   PRIMARY KEY (SubjCode, Year, Semester)
,   FOREIGN KEY (SubjCode) REFERENCES SUBJECT (SubjCode)
,   FOREIGN KEY (StaffID) REFERENCES TEACHER (StaffID)
);

CREATE TABLE ENROLEMENT(
    StudentID NVARCHAR(10)
,   SubjCode NVARCHAR(100)
,   Year INT CHECK (Year IN (Len(4)))
,   Semester INT CHECK (Semester IN (1, 2))
,   Grade NVARCHAR(2) CHECK (Grade IN ('N', 'P,', 'C', 'D', 'HD')) DEFAULT NULL
,   DateEnrolled DATE
,   PRIMARY KEY (StudentID, SubjCode, Year, Semester)
,   FOREIGN KEY (StudentID) REFERENCES STUDENT (StudentID)
,   FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SUBJECTOFFERING (SubjCode, Year, Semester)
);


SELECT *
FROM INFORMATION_SCHEMA.TABLES

SELECT *
FROM STUDENT

INSERT INTO SUBJECT (SubjCode, Description) VALUES ('ICTPRG418', 'Apply SQL to extract & manipulate data');
INSERT INTO SUBJECT (SubjCode, Description) VALUES ('ICTBSB430', 'Create Basic Databases');
INSERT INTO SUBJECT (SubjCode, Description) VALUES ('ICTDBS205', 'Design a Database');

INSERT INTO STUDENT (StudentID, Surname, GivenName, Gender) VALUES ('S12233445', 'Baird', 'Tim', 'M');
INSERT INTO STUDENT (StudentID, Surname, GivenName, Gender) VALUES ('s23344556', 'Nguyen', 'Anh', 'M');
INSERT INTO STUDENT (StudentID, Surname, GivenName, Gender) VALUES ('s34455667', 'Hallinan', 'James', 'M');
INSERT INTO STUDENT (StudentID, Surname, GivenName, Gender) VALUES ('s103620582', 'Ambrose', 'Joy', 'F');

INSERT INTO TEACHER (StaffID, Surname, GivenName) VALUES (98776655,	'Young', 'Angus');
INSERT INTO TEACHER (StaffID, Surname, GivenName) VALUES (87665544,	'Scott', 'Bon');
INSERT INTO TEACHER (StaffID, Surname, GivenName) VALUES (76554433,	'Slade', 'Chris');

INSERT INTO SUBJECTOFFERING (SubjCode, Year, Semester, Fee, StaffID) VALUES ('ICTPRG418', 2019, 1, 200, 98776655);
INSERT INTO SUBJECTOFFERING (SubjCode, Year, Semester, Fee, StaffID) VALUES ('ICTPRG418', 2020, 1, 225, 98776655);
INSERT INTO SUBJECTOFFERING (SubjCode, Year, Semester, Fee, StaffID) VALUES ('ICTBSB430',2020, 1, 200, 87665544);
INSERT INTO SUBJECTOFFERING (SubjCode, Year, Semester, Fee, StaffID) VALUES ('ICTBSB430', 2020, 2, 200, 76554433);
INSERT INTO SUBJECTOFFERING (SubjCode, Year, Semester, Fee, StaffID) VALUES ('ICTDBS205', 2019, 2, 225, 87665544);

INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s12233445', 'ICTPRG418', 2019, 1, 'D', 20190225);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s12233445', 'ICTPRG418', 2019, 1, 'D', 20190225);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s23344556', 'ICTPRG418', 2019, 1, 'P', 20190215);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s23344556', 'ICTPRG418',	2020,	1,	'HD', 20200226);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s34455667', 'ICTPRG418',	2020,	1,	'P',	20200128);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s12233445', 'ICTBSB430', 2020,	1,	'C', 20200208);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s23344556', 'ICTBSB430',	2020,	2,	20200630);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s34455667', 'ICTBSB430',	2020,	2,	20200703);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s23344556', 'ICTDBS205',	2019,	2,	'P', 20190701);
INSERT INTO ENROLEMENT (StudentID, SubjCode, Year, Semester, Grade, DateEnrolled) VALUES ('s34455667', 'ICTDBS205',	2019,	2,	'N', 20190713);





