-- CosmoQuest Database Schema for App_Data MDF File
-- Run this script AFTER creating the empty database in Visual Studio Server Explorer
-- This script creates all tables and inserts sample data

-- Users Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE Users (
        UserID INT PRIMARY KEY IDENTITY(1,1),
        Username NVARCHAR(50) NOT NULL UNIQUE,
        Email NVARCHAR(100) NOT NULL UNIQUE,
        Password NVARCHAR(255) NOT NULL,
        FullName NVARCHAR(100) NOT NULL,
        Role NVARCHAR(20) NOT NULL DEFAULT 'Member',
        DateRegistered DATETIME NOT NULL DEFAULT GETDATE(),
        LastLogin DATETIME NULL,
        IsActive BIT NOT NULL DEFAULT 1
    );
    PRINT 'Users table created';
END
GO

-- Planets Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Planets')
BEGIN
    CREATE TABLE Planets (
        PlanetID INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(50) NOT NULL,
        Description NVARCHAR(MAX),
        DistanceFromSun DECIMAL(18,2),
        Diameter DECIMAL(18,2),
        Mass DECIMAL(18,2),
        OrbitalPeriod DECIMAL(18,2),
        RotationPeriod DECIMAL(18,2),
        Moons INT,
        ImageURL NVARCHAR(255),
        InterestingFacts NVARCHAR(MAX),
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        CreatedBy INT FOREIGN KEY REFERENCES Users(UserID)
    );
    PRINT 'Planets table created';
END
GO

-- Stars and Galaxies Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'StarsGalaxies')
BEGIN
    CREATE TABLE StarsGalaxies (
        StarGalaxyID INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(100) NOT NULL,
        Type NVARCHAR(50),
        Description NVARCHAR(MAX),
        Distance DECIMAL(18,2),
        Mass NVARCHAR(100),
        Temperature NVARCHAR(100),
        Size NVARCHAR(100),
        ImageURL NVARCHAR(255),
        Discovery NVARCHAR(MAX),
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        CreatedBy INT FOREIGN KEY REFERENCES Users(UserID)
    );
    PRINT 'StarsGalaxies table created';
END
GO

-- Space Missions Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SpaceMissions')
BEGIN
    CREATE TABLE SpaceMissions (
        MissionID INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(100) NOT NULL,
        Agency NVARCHAR(100),
        LaunchDate DATE,
        EndDate DATE NULL,
        Status NVARCHAR(50),
        Description NVARCHAR(MAX),
        Objectives NVARCHAR(MAX),
        Achievements NVARCHAR(MAX),
        ImageURL NVARCHAR(255),
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        CreatedBy INT FOREIGN KEY REFERENCES Users(UserID)
    );
    PRINT 'SpaceMissions table created';
END
GO

-- Quizzes Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Quizzes')
BEGIN
    CREATE TABLE Quizzes (
        QuizID INT PRIMARY KEY IDENTITY(1,1),
        Title NVARCHAR(100) NOT NULL,
        Description NVARCHAR(MAX),
        Category NVARCHAR(50),
        DifficultyLevel NVARCHAR(20),
        TimeLimit INT,
        PassingScore INT,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        CreatedBy INT FOREIGN KEY REFERENCES Users(UserID)
    );
    PRINT 'Quizzes table created';
END
GO

-- Quiz Questions Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'QuizQuestions')
BEGIN
    CREATE TABLE QuizQuestions (
        QuestionID INT PRIMARY KEY IDENTITY(1,1),
        QuizID INT NOT NULL FOREIGN KEY REFERENCES Quizzes(QuizID) ON DELETE CASCADE,
        QuestionText NVARCHAR(MAX) NOT NULL,
        QuestionType NVARCHAR(20),
        OptionA NVARCHAR(255),
        OptionB NVARCHAR(255),
        OptionC NVARCHAR(255),
        OptionD NVARCHAR(255),
        CorrectAnswer NVARCHAR(10),
        Points INT NOT NULL DEFAULT 1,
        OrderNumber INT
    );
    PRINT 'QuizQuestions table created';
END
GO

-- Quiz Attempts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'QuizAttempts')
BEGIN
    CREATE TABLE QuizAttempts (
        AttemptID INT PRIMARY KEY IDENTITY(1,1),
        QuizID INT NOT NULL FOREIGN KEY REFERENCES Quizzes(QuizID),
        UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
        Score INT NOT NULL,
        TotalQuestions INT NOT NULL,
        Percentage DECIMAL(5,2),
        IsPassed BIT,
        AttemptDate DATETIME NOT NULL DEFAULT GETDATE(),
        TimeSpent INT
    );
    PRINT 'QuizAttempts table created';
END
GO

-- Discussion Topics Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DiscussionTopics')
BEGIN
    CREATE TABLE DiscussionTopics (
        TopicID INT PRIMARY KEY IDENTITY(1,1),
        Title NVARCHAR(200) NOT NULL,
        Category NVARCHAR(50),
        Description NVARCHAR(MAX),
        CreatedBy INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        Views INT NOT NULL DEFAULT 0,
        IsLocked BIT NOT NULL DEFAULT 0,
        IsPinned BIT NOT NULL DEFAULT 0
    );
    PRINT 'DiscussionTopics table created';
END
GO

-- Discussion Posts Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DiscussionPosts')
BEGIN
    CREATE TABLE DiscussionPosts (
        PostID INT PRIMARY KEY IDENTITY(1,1),
        TopicID INT NOT NULL FOREIGN KEY REFERENCES DiscussionTopics(TopicID) ON DELETE CASCADE,
        UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
        Content NVARCHAR(MAX) NOT NULL,
        PostDate DATETIME NOT NULL DEFAULT GETDATE(),
        IsEdited BIT NOT NULL DEFAULT 0,
        EditedDate DATETIME NULL
    );
    PRINT 'DiscussionPosts table created';
END
GO

-- User Activity Log Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'UserActivityLog')
BEGIN
    CREATE TABLE UserActivityLog (
        LogID INT PRIMARY KEY IDENTITY(1,1),
        UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
        Activity NVARCHAR(255) NOT NULL,
        Details NVARCHAR(MAX),
        ActivityDate DATETIME NOT NULL DEFAULT GETDATE(),
        IPAddress NVARCHAR(50)
    );
    PRINT 'UserActivityLog table created';
END
GO

-- Insert Sample Admin User (only if not exists)
IF NOT EXISTS (SELECT * FROM Users WHERE Username = 'admin')
BEGIN
    INSERT INTO Users (Username, Email, Password, FullName, Role) 
    VALUES ('admin', 'admin@cosmoquest.com', 'Admin@123', 'System Administrator', 'Admin');
    PRINT 'Admin user created';
END
GO

-- Insert Sample Planets (only if not exists)
IF NOT EXISTS (SELECT * FROM Planets)
BEGIN
    INSERT INTO Planets (Name, Description, DistanceFromSun, Diameter, Mass, OrbitalPeriod, RotationPeriod, Moons, ImageURL, InterestingFacts, CreatedBy)
    VALUES 
    ('Mercury', 'The smallest planet in our solar system and closest to the Sun.', 57.9, 4879, 0.055, 88, 1407.6, 0, '~/Images/mercury.jpg', 'Mercury has no atmosphere and experiences extreme temperature variations.', 1),
    ('Venus', 'The hottest planet in our solar system with a toxic atmosphere.', 108.2, 12104, 0.815, 225, 5832.5, 0, '~/Images/venus.jpg', 'Venus rotates in the opposite direction to most planets.', 1),
    ('Earth', 'Our home planet, the only known planet with life.', 149.6, 12742, 1.0, 365.25, 24, 1, '~/Images/earth.jpg', 'Earth is the only planet not named after a god.', 1),
    ('Mars', 'The Red Planet, known for its iron oxide surface.', 227.9, 6779, 0.107, 687, 24.6, 2, '~/Images/mars.jpg', 'Mars has the largest volcano in the solar system, Olympus Mons.', 1),
    ('Jupiter', 'The largest planet in our solar system, a gas giant.', 778.5, 139820, 317.8, 4333, 9.9, 79, '~/Images/jupiter.jpg', 'Jupiter''s Great Red Spot is a storm that has been raging for centuries.', 1),
    ('Saturn', 'Famous for its spectacular ring system.', 1434, 116460, 95.2, 10759, 10.7, 82, '~/Images/saturn.jpg', 'Saturn is the least dense planet and could float on water.', 1),
    ('Uranus', 'An ice giant that rotates on its side.', 2871, 50724, 14.5, 30687, 17.2, 27, '~/Images/uranus.jpg', 'Uranus was the first planet discovered with a telescope.', 1),
    ('Neptune', 'The windiest planet in the solar system.', 4495, 49244, 17.1, 60190, 16.1, 14, '~/Images/neptune.jpg', 'Neptune has supersonic winds reaching 2,100 km/h.', 1);
    PRINT 'Planets inserted';
END
GO

-- Insert Sample Stars and Galaxies (only if not exists)
IF NOT EXISTS (SELECT * FROM StarsGalaxies)
BEGIN
    INSERT INTO StarsGalaxies (Name, Type, Description, Distance, ImageURL, CreatedBy)
    VALUES 
    ('Milky Way', 'Galaxy', 'Our home galaxy, a barred spiral galaxy.', 0, '~/Images/milkyway.jpg', 1),
    ('Andromeda Galaxy', 'Galaxy', 'The nearest major galaxy to the Milky Way.', 2537000, '~/Images/andromeda.jpg', 1),
    ('Sirius', 'Star', 'The brightest star in the night sky.', 8.6, '~/Images/sirius.jpg', 1),
    ('Betelgeuse', 'Star', 'A red supergiant star in the constellation Orion.', 642.5, '~/Images/betelgeuse.jpg', 1),
    ('Orion Nebula', 'Nebula', 'A diffuse nebula situated in the Milky Way.', 1344, '~/Images/orion-nebula.jpg', 1);
    PRINT 'Stars and Galaxies inserted';
END
GO

-- Insert Sample Space Missions (only if not exists)
IF NOT EXISTS (SELECT * FROM SpaceMissions)
BEGIN
    INSERT INTO SpaceMissions (Name, Agency, LaunchDate, Status, Description, ImageURL, CreatedBy)
    VALUES 
    ('Apollo 11', 'NASA', '1969-07-16', 'Completed', 'First crewed mission to land on the Moon.', '~/Images/apollo11.jpg', 1),
    ('Voyager 1', 'NASA', '1977-09-05', 'Active', 'The most distant human-made object from Earth.', '~/Images/voyager1.jpg', 1),
    ('Mars Perseverance', 'NASA', '2020-07-30', 'Active', 'Mars rover searching for signs of ancient life.', '~/Images/perseverance.jpg', 1),
    ('James Webb Space Telescope', 'NASA/ESA/CSA', '2021-12-25', 'Active', 'The most powerful space telescope ever built.', '~/Images/jwst.jpg', 1),
    ('International Space Station', 'NASA/ESA/Roscosmos', '1998-11-20', 'Active', 'A habitable artificial satellite in low Earth orbit.', '~/Images/iss.jpg', 1);
    PRINT 'Space Missions inserted';
END
GO

-- Insert Sample Quiz (only if not exists)
IF NOT EXISTS (SELECT * FROM Quizzes)
BEGIN
    INSERT INTO Quizzes (Title, Description, Category, DifficultyLevel, TimeLimit, PassingScore, CreatedBy)
    VALUES ('Solar System Basics', 'Test your knowledge of our solar system!', 'Solar System', 'Easy', 15, 70, 1);
    PRINT 'Sample Quiz inserted';
END
GO

-- Insert Sample Quiz Questions (only if not exists)
IF NOT EXISTS (SELECT * FROM QuizQuestions)
BEGIN
    INSERT INTO QuizQuestions (QuizID, QuestionText, QuestionType, OptionA, OptionB, OptionC, OptionD, CorrectAnswer, OrderNumber)
    VALUES 
    (1, 'How many planets are in our solar system?', 'Multiple Choice', '7', '8', '9', '10', 'B', 1),
    (1, 'Which planet is known as the Red Planet?', 'Multiple Choice', 'Venus', 'Mars', 'Jupiter', 'Saturn', 'B', 2),
    (1, 'Is the Sun a star?', 'True/False', 'True', 'False', NULL, NULL, 'A', 3),
    (1, 'Which planet is largest in our solar system?', 'Multiple Choice', 'Saturn', 'Neptune', 'Jupiter', 'Uranus', 'C', 4),
    (1, 'Earth has only one natural satellite.', 'True/False', 'True', 'False', NULL, NULL, 'A', 5);
    PRINT 'Quiz Questions inserted';
END
GO

PRINT '========================================';
PRINT 'CosmoQuest Database Setup Complete!';
PRINT '========================================';
PRINT 'Tables created: 10';
PRINT 'Sample data loaded successfully';
PRINT '';
PRINT 'Admin Login Credentials:';
PRINT 'Username: admin';
PRINT 'Password: Admin@123';
PRINT '========================================';
