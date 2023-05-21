--Find all Students with FirstName = Antonio

SELECT *
FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’

SELECT *
FROM Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT *
FROM Student
WHERE LastName LIKE 'J%' AND EnrolledDate >= '01.01.1998' AND EnrolledDate < '01.02.1998'

--List all Students ordered by FirstName

SELECT *
FROM Student
ORDER BY FirstName

--List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates

SELECT DISTINCT t.LastName, s.LastName
FROM Teacher t
CROSS JOIN Student s

--Create Foreign key constraints from diagram or with script

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID) REFERENCES Student(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseID) REFERENCES Course(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID) REFERENCES Teacher(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID) REFERENCES Grade(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType(ID)

--List all possible combinations of Courses names and AchievementType names that can be passed by student

SELECT c.[Name] AS CourseName, [at].[Name] AS AchievementTypeName
FROM Course c
CROSS JOIN AchievementType at


--List all Teachers without exam Grade

SELECT *
FROM Teacher t
LEFT OUTER JOIN Grade g
ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL
