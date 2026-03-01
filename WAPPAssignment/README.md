# ?? CosmoQuest Learning System

A comprehensive web-based space learning platform built with ASP.NET Web Forms (.NET Framework 4.7.2).

## ?? Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Project Structure](#project-structure)
- [User Roles](#user-roles)
- [Pages Overview](#pages-overview)
- [Usage](#usage)
- [Demo Credentials](#demo-credentials)

## ? Features

### For All Users (Guests)
- ?? **Home Page**: Overview of the learning system
- ?? **Solar System**: Explore all 8 planets with detailed information
- ? **Stars & Galaxies**: Learn about celestial objects beyond our solar system
- ?? **Space Missions**: Discover historic and ongoing space missions
- ?? **Authentication**: Register and login functionality

### For Registered Members
- ?? **Personal Dashboard**: Track your learning progress
- ?? **Interactive Quizzes**: Test your space knowledge
- ?? **Discussion Forum**: Engage with other space enthusiasts
- ?? **Progress Tracking**: View quiz scores and forum activity

### For Administrators
- ????? **Admin Dashboard**: System overview and statistics
- ?? **User Management**: Manage users, roles, and permissions
- ?? **Content Management**: CRUD operations for all content
- ?? **Planet Management**: Add, edit, delete planet information
- ? **Stars Management**: Manage stars and galaxies data
- ?? **Mission Management**: Update space mission details
- ?? **Quiz Management**: Create and manage quizzes and questions
- ?? **Forum Moderation**: Moderate discussion topics and posts

## ?? Technology Stack

- **Framework**: ASP.NET Web Forms (.NET Framework 4.7.2)
- **Database**: SQL Server / LocalDB
- **Frontend**: HTML5, CSS3, Bootstrap 5
- **JavaScript**: Vanilla JS for client-side validation
- **Authentication**: Forms Authentication with role-based access control

## ?? Installation

### Prerequisites
- Visual Studio 2019 or later
- .NET Framework 4.7.2 SDK
- SQL Server or SQL Server Express with LocalDB

### Steps

1. **Clone or Download the Project**
   ```
   Extract the project to your desired location
   ```

2. **Open Solution in Visual Studio**
   ```
   Double-click WAPPAssignment.sln
   ```

3. **Restore NuGet Packages**
   ```
   Right-click solution ? Restore NuGet Packages
   ```

4. **Setup Database** (See Database Setup section)

5. **Build and Run**
   ```
   Press F5 or click Start in Visual Studio
   ```

## ?? Database Setup

### Using Visual Studio Server Explorer (Recommended)

This method creates the database file (.mdf) directly in the App_Data folder, making it portable and easy to deploy.

**Quick Setup:**

1. **Open Server Explorer**
   - View ? Server Explorer (Ctrl+Alt+S)

2. **Add Data Connection**
   - Right-click Data Connections ? Add Connection...
   - Data source: Microsoft SQL Server Database File
   - Browse to: `[ProjectFolder]\App_Data\CosmoQuestDB.mdf`
   - Click Test Connection ? OK

3. **Create Database Structure**
   - Right-click the new connection ? New Query
   - Open `Database/CreateDatabase_AppData.sql`
   - Copy all content and paste into query window
   - Execute (Ctrl+Shift+E)

4. **Verify**
   - Refresh the connection in Server Explorer
   - Expand Tables node - you should see 10 tables
   - Right-click Users table ? Show Table Data
   - Verify admin user exists

**?? Complete Step-by-Step Guide:** See `Database/DATABASE_SETUP_GUIDE.md`

### Alternative: SQL Server Management Studio (SSMS)

If you prefer using SSMS:

1. Open SQL Server Management Studio
2. Connect to your local SQL Server instance
3. Open the file: `Database/CosmoQuestDB.sql` (original script)
4. Execute the script (F5)
5. Update Web.config connection string to point to SQL Server
6. Verify the database `CosmoQuestDB` is created

**Note:** The default Web.config is configured for App_Data method (LocalDB).

### Database Schema

The database includes:
- **Users**: User accounts and authentication
- **Planets**: Solar system planet information
- **StarsGalaxies**: Stars, galaxies, and nebulae data
- **SpaceMissions**: Historic and current space missions
- **Quizzes**: Quiz metadata
- **QuizQuestions**: Individual quiz questions
- **QuizAttempts**: User quiz attempt records
- **DiscussionTopics**: Forum topics
- **DiscussionPosts**: Forum posts
- **UserActivityLog**: User activity tracking

## ?? Project Structure

```
WAPPAssignment/
?
??? Account/
?   ??? Login.aspx              # User login page
?   ??? Register.aspx           # User registration page
?
??? Admin/
?   ??? Dashboard.aspx          # Admin dashboard
?   ??? ManageUsers.aspx        # User management (CRUD)
?   ??? ManageContent.aspx      # Content management hub
?   ??? ManagePlanets.aspx      # Planet CRUD operations
?   ??? ManageStars.aspx        # Stars/galaxies CRUD
?   ??? ManageMissions.aspx     # Mission CRUD operations
?   ??? ManageQuizzes.aspx      # Quiz management
?   ??? ManageForum.aspx        # Forum moderation
?
??? Member/
?   ??? Dashboard.aspx          # Member dashboard
?   ??? Quizzes.aspx            # Available quizzes list
?   ??? TakeQuiz.aspx           # Quiz taking interface
?   ??? Discussion.aspx         # Forum topics list
?   ??? ViewTopic.aspx          # View topic and posts
?
??? Content/
?   ??? CosmoQuest.css          # Space-themed custom styles
?
??? Database/
?   ??? CosmoQuestDB.sql        # Complete database schema
?
??? Helpers/
?   ??? AuthHelper.cs           # Authentication utilities
?   ??? DatabaseHelper.cs       # Database connection helper
?
??? Scripts/
?   ??? cosmoquest.js           # Client-side JavaScript
?
??? Default.aspx                # Home page
??? SolarSystem.aspx            # Planets overview
??? PlanetDetails.aspx          # Individual planet details
??? StarsGalaxies.aspx          # Stars and galaxies page
??? SpaceMissions.aspx          # Space missions page
??? Site.Master                 # Master page with navigation
??? Web.config                  # Configuration file
??? Global.asax                 # Application events
```

## ?? User Roles

### Guest (Unauthenticated)
- View public content (planets, stars, missions)
- Register for an account
- Login to existing account

### Member (Authenticated User)
- All guest permissions
- Access personal dashboard
- Take quizzes
- Participate in discussions
- Track learning progress

### Admin (Administrator)
- All member permissions
- Manage users (CRUD, role assignment)
- Manage all content (planets, stars, missions)
- Create and manage quizzes
- Moderate forum discussions
- View system statistics

## ?? Pages Overview

### Public Pages
| Page | Description | URL |
|------|-------------|-----|
| Home | Landing page with overview | `/Default.aspx` |
| Solar System | List of all planets | `/SolarSystem.aspx` |
| Planet Details | Detailed planet information | `/PlanetDetails.aspx?id={planetId}` |
| Stars & Galaxies | Celestial objects beyond solar system | `/StarsGalaxies.aspx` |
| Space Missions | Historic and current missions | `/SpaceMissions.aspx` |
| Login | User authentication | `/Account/Login.aspx` |
| Register | New user registration | `/Account/Register.aspx` |

### Member Pages (Authentication Required)
| Page | Description | URL |
|------|-------------|-----|
| Dashboard | Personal learning dashboard | `/Member/Dashboard.aspx` |
| Quizzes | Available quizzes | `/Member/Quizzes.aspx` |
| Take Quiz | Quiz interface | `/Member/TakeQuiz.aspx?id={quizId}` |
| Discussion | Forum topics | `/Member/Discussion.aspx` |
| View Topic | Topic with posts | `/Member/ViewTopic.aspx?id={topicId}` |

### Admin Pages (Admin Role Required)
| Page | Description | URL |
|------|-------------|-----|
| Admin Dashboard | System overview | `/Admin/Dashboard.aspx` |
| Manage Users | User CRUD operations | `/Admin/ManageUsers.aspx` |
| Manage Content | Content management hub | `/Admin/ManageContent.aspx` |
| Manage Planets | Planet CRUD | `/Admin/ManagePlanets.aspx` |
| Manage Stars | Stars/galaxies CRUD | `/Admin/ManageStars.aspx` |
| Manage Missions | Mission CRUD | `/Admin/ManageMissions.aspx` |
| Manage Quizzes | Quiz CRUD | `/Admin/ManageQuizzes.aspx` |
| Manage Forum | Forum moderation | `/Admin/ManageForum.aspx` |

## ?? Usage

### For Students/Members

1. **Register an Account**
   - Click "Register" in navigation
   - Fill in your details (username, email, password)
   - Password requirements: 8+ characters, uppercase, lowercase, number, special character

2. **Explore Content**
   - Browse planets in the Solar System
   - Learn about stars and galaxies
   - Discover space missions

3. **Take Quizzes**
   - Go to Quizzes page
   - Select a quiz
   - Answer questions within time limit
   - View your results and history

4. **Join Discussions**
   - Visit Discussion Forum
   - Create new topics or reply to existing ones
   - Share your space knowledge

### For Administrators

1. **Login as Admin**
   - Use admin credentials
   - Access Admin Dashboard

2. **Manage Users**
   - View all registered users
   - Edit user roles (Member/Admin)
   - Activate/deactivate accounts
   - Search and filter users

3. **Manage Content**
   - Add new planets, stars, missions
   - Edit existing content
   - Delete outdated information
   - Keep content up-to-date

4. **Create Quizzes**
   - Design new quizzes
   - Add questions with multiple choice or true/false
   - Set difficulty level and time limits
   - Define passing scores

5. **Moderate Forum**
   - Pin important topics
   - Lock inappropriate discussions
   - Remove spam or offensive content

## ?? Demo Credentials

### Administrator Account
```
Username: admin
Password: Admin@123
```

### Creating Member Accounts
Use the registration page to create new member accounts.

## ?? Design Theme

The application features a **space-themed design** with:
- Deep space color palette (dark blues, purples)
- Animated star background
- Golden accents (cosmic gold)
- Smooth hover effects and transitions
- Responsive layout for all devices
- Modern card-based UI components

## ?? Security Features

- **Forms Authentication**: Secure login system
- **Role-Based Access Control**: Guest, Member, Admin roles
- **Protected Routes**: Admin and Member pages require authentication
- **Password Validation**: Strong password requirements
- **Input Validation**: Client and server-side validation
- **SQL Parameterization**: Protection against SQL injection

## ?? Notes

### Password Storage
?? **Important**: This is a university assignment project. In the current implementation, passwords are stored in plain text for simplicity. 

**For production use**, you MUST:
- Hash passwords using SHA256, bcrypt, or PBKDF2
- Add salt to password hashes
- Never store plain text passwords

### Future Enhancements
- Password hashing implementation
- Email verification
- Password recovery
- File upload for images
- Rich text editor for content
- Real-time quiz timer
- Leaderboard system
- Achievements and badges
- Search functionality
- Pagination for large datasets

## ?? Support

For questions or issues:
1. Check the inline code comments
2. Review the database schema
3. Ensure all NuGet packages are restored
4. Verify database connection string

## ?? License

This project is created for educational purposes as a university assignment.

## ?? Credits

Created by: [Your Name]
Course: Web Application Development
Institution: [Your University]
Year: 2024

---

**Happy Space Learning! ????**
