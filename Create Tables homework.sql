CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE Students(
Id int NOT NULL PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NOT NULL,
Gender nchar(1) NOT NULL,
Email nvarchar(150) NULL
)

CREATE TABLE Teachers(
Id int NOT NULL PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NOT NULL,
Gender nchar(1) NOT NULL,
Email nvarchar(150) NULL,
Course nvarchar(50) NOT NULL
)

CREATE TABLE Courses(
Id int NOT NULL PRIMARY KEY,
[Name] nvarchar(100) NOT NULL,
TeacherId int NOT NULL FOREIGN KEY REFERENCES Teachers(Id)
)

CREATE TABLE Grades(
Id int NOT NULL PRIMARY KEY,
StudentId int NOT NULL FOREIGN KEY REFERENCES Students(Id),
TeacherId int NOT NULL FOREIGN KEY REFERENCES Teachers(Id),
CourseId int NOT NULL FOREIGN KEY REFERENCES Courses(Id)
)

CREATE TABLE AchievementTypes(
Id int NOT NULL PRIMARY KEY,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(200) NULL
)

CREATE TABLE GradeDetails(
Id int NOT NULL PRIMARY KEY,
Score int NOT NULL,
GradeId int NOT NULL FOREIGN KEY REFERENCES Grades(Id),
AchievementTypeId int NOT NULL FOREIGN KEY REFERENCES AchievementTypes(Id)
)