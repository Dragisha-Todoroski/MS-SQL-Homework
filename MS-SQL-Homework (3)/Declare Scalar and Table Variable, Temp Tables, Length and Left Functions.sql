USE SEDCHOME
GO

--Declare scalar variable for storing FirstName values
--Assign value �Antonio� to the FirstName variable
--Find all Students having FirstName same as the variable

DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students

DECLARE @FemaleStudents TABLE
(StudentId int, StudentName nvarchar(100), DateOfBirth date)

INSERT INTO @FemaleStudents
SELECT Id, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT *
FROM @FemaleStudents
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with �A�
--Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #MaleStudentsStartingWithA
(LastName nvarchar(100), EnrolledDate date)

INSERT INTO #MaleStudentsStartingWithA
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT *
FROM #MaleStudentsStartingWithA
WHERE LEN(LastName) = 7
GO

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3)
GO