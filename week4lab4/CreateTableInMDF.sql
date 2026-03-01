-- Script to create userTable in the attached LAB06.mdf file
-- Run this through your application to populate the database

USE [master]
GO

DECLARE @DataPath NVARCHAR(500) = N'C:\Users\CYBORG\source\repos\week4lab4\App_Data\LAB06.mdf'

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'LAB06_Attached')
BEGIN
    EXEC('CREATE DATABASE LAB06_Attached ON (FILENAME = ''' + @DataPath + ''') FOR ATTACH_REBUILD_LOG')
    PRINT 'Database attached successfully'
END
GO

USE [LAB06_Attached]
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'userTable')
BEGIN
    CREATE TABLE [dbo].[userTable] (
        [id] INT IDENTITY(1,1) PRIMARY KEY,
        [username] NVARCHAR(50) NOT NULL UNIQUE,
        [fname] NVARCHAR(100) NOT NULL,
        [lname] NVARCHAR(100) NOT NULL,
        [gender] NCHAR(1) NOT NULL CHECK (gender IN ('F', 'M')),
        [country] NVARCHAR(100) NULL,
        [email] NVARCHAR(100) NULL,
        [password] NVARCHAR(100) NOT NULL,
        [usertype] NVARCHAR(20) NOT NULL CHECK (usertype IN ('admin', 'member')),
        [created_date] DATETIME DEFAULT GETDATE()
    );
    PRINT 'userTable created successfully!';
END
GO

-- Insert sample users
IF NOT EXISTS (SELECT * FROM userTable WHERE username = 'admin')
BEGIN
    INSERT INTO userTable (username, fname, lname, gender, country, email, password, usertype)
    VALUES ('admin', 'Admin', 'User', 'M', 'USA', 'admin@example.com', 'admin123', 'admin');
END
GO

IF NOT EXISTS (SELECT * FROM userTable WHERE username = 'member')
BEGIN
    INSERT INTO userTable (username, fname, lname, gender, country, email, password, usertype)
    VALUES ('member', 'John', 'Doe', 'M', 'Canada', 'john@example.com', 'member123', 'member');
END
GO

SELECT * FROM userTable;
GO
