CREATE DATABASE SEDCHOME

USE SEDCHOME

CREATE TABLE Student(
ID int NOT NULL PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NOT NULL,
EnrolledDate date NOT NULL,
Gender nchar(1) NOT NULL,
NationalIDNumber int NOT NULL,
StudentCardNumber nvarchar(50) NOT NULL
)

CREATE TABLE Teacher(
ID int NOT NULL PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NOT NULL,
AcademicRank nvarchar(100) NOT NULL,
HireDate date NOT NULL
)

CREATE TABLE Course(
ID int NOT NULL PRIMARY KEY,
[Name] nvarchar(100) NOT NULL,
Credit int NOT NULL,
AcademicYear int NOT NULL,
Semester int NOT NULL
)

CREATE TABLE Grade(
ID int NOT NULL PRIMARY KEY,
StudentID int NOT NULL FOREIGN KEY REFERENCES Student(ID),
CourseID int NOT NULL FOREIGN KEY REFERENCES Course(ID),
TeacherID int NOT NULL FOREIGN KEY REFERENCES Teacher(ID),
Grade int NOT NULL,
Comment nvarchar(100) NULL,
CreatedDate datetime NOT NULL
)

CREATE TABLE AchievementType(
ID int NOT NULL PRIMARY KEY,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(200) NULL,
ParticipationRate int NOT NULL
)

CREATE TABLE GradeDetails(
ID int NOT NULL PRIMARY KEY,
GradeID int NOT NULL FOREIGN KEY REFERENCES Grade(ID),
AchievementTypeID int NOT NULL FOREIGN KEY REFERENCES AchievementType(ID),
AchievementPoints int NOT NULL,
AchievementMaxPoints int NOT NULL,
AchievementDate datetime NOT NULL
)