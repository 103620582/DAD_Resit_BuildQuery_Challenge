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