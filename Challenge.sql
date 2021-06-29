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
    StaffID INT CHECK (StaffID IN (Len(8)))
,   Surname NVARCHAR(100) NOT NULL
,   GivenName NVARCHAR(100) NOT NULL
,   PRIMARY KEY (StaffID)
);

CREATE TABLE SUBJECTOFFERING(
    SubjCode NVARCHAR (100)
,   Year INT CHECK (Year IN (Len(4)))
,   Semester INT CHECK (Semester IN (1, 2))
,   Fee MONEY NOT NULL CHECK (Fee > 0)
,   StaffID INT CHECK (StaffID IN (Len(8)))
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