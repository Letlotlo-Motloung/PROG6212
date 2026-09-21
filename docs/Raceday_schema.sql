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
