/* 
RaceDay Database Schema
   Section C - SQL Database Script
*/
 
IF DB_ID('RaceDay') IS NULL
BEGIN
    CREATE DATABASE RaceDay;
END
GO
 
USE RaceDay;
GO
 

/* 
   TABLE: Roles
*/
CREATE TABLE dbo.Roles (
    RoleID      INT IDENTITY(1,1) NOT NULL,
    RoleName    VARCHAR(20)       NOT NULL,
    CONSTRAINT PK_Roles PRIMARY KEY (RoleID),
    CONSTRAINT UQ_Roles_RoleName UNIQUE (RoleName)
);
GO

/*
   TABLE: Users
*/
CREATE TABLE dbo.Users (
    UserID          INT IDENTITY(1,1) NOT NULL,
    RoleID          INT               NOT NULL,
    FullName        VARCHAR(100)      NOT NULL,
    Email           VARCHAR(150)      NOT NULL,
    PasswordHash    VARCHAR(255)      NOT NULL,
    PhoneNumber     VARCHAR(20)       NULL,
    CreatedAt       DATETIME          NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Users PRIMARY KEY (UserID),
    CONSTRAINT UQ_Users_Email UNIQUE (Email),
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleID)
        REFERENCES dbo.Roles (RoleID)
);
GO

/*
   TABLE: Events
*/
CREATE TABLE dbo.Events (
    EventID         INT IDENTITY(1,1) NOT NULL,
    OrganiserID     INT               NOT NULL,
    EventName       VARCHAR(150)      NOT NULL,
    EventDate       DATE              NOT NULL,
    Location        VARCHAR(150)      NOT NULL,
    RouteInfo       VARCHAR(255)      NULL,
    Description     VARCHAR(MAX)      NULL,
    CreatedAt       DATETIME          NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Events PRIMARY KEY (EventID),
    CONSTRAINT FK_Events_Users FOREIGN KEY (OrganiserID)
        REFERENCES dbo.Users (UserID)
);
GO

/*
   TABLE: Categories
*/
CREATE TABLE dbo.Categories (
    CategoryID      INT IDENTITY(1,1) NOT NULL,
    EventID         INT               NOT NULL,
    CategoryName    VARCHAR(100)      NOT NULL,
    DistanceKM      DECIMAL(6,2)      NOT NULL,
    MaxParticipants INT               NOT NULL DEFAULT 100,
    EntryFee        DECIMAL(8,2)      NOT NULL DEFAULT 0,
    CONSTRAINT PK_Categories PRIMARY KEY (CategoryID),
    CONSTRAINT FK_Categories_Events FOREIGN KEY (EventID)
        REFERENCES dbo.Events (EventID)
);
GO
