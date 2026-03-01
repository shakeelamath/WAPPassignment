# CosmoQuest Project Structure

## Complete Folder Organization

```
WAPPAssignment/
?
??? ?? Account/                         # Authentication Pages
?   ??? Login.aspx                      # User login page
?   ??? Login.aspx.cs                   # Login code-behind
?   ??? Register.aspx                   # Registration page
?   ??? Register.aspx.cs                # Registration code-behind
?
??? ?? Admin/                           # Administrator Pages
?   ??? Dashboard.aspx                  # Admin dashboard with stats
?   ??? Dashboard.aspx.cs
?   ??? ManageContent.aspx              # Content management hub
?   ??? ManageContent.aspx.cs
?   ??? ManageUsers.aspx                # User CRUD operations
?   ??? ManageUsers.aspx.cs
?   ??? ManagePlanets.aspx              # Planet management (to be created)
?   ??? ManageStars.aspx                # Stars/Galaxies management (to be created)
?   ??? ManageMissions.aspx             # Mission management (to be created)
?   ??? ManageQuizzes.aspx              # Quiz management (to be created)
?   ??? ManageForum.aspx                # Forum moderation (to be created)
?
??? ?? Member/                          # Member-Only Pages
?   ??? Dashboard.aspx                  # Member dashboard
?   ??? Dashboard.aspx.cs
?   ??? Quizzes.aspx                    # Available quizzes
?   ??? Quizzes.aspx.cs
?   ??? TakeQuiz.aspx                   # Quiz interface (to be created)
?   ??? Discussion.aspx                 # Forum main page
?   ??? Discussion.aspx.cs
?   ??? ViewTopic.aspx                  # View discussion topic (to be created)
?
??? ?? Content/                         # Stylesheets
?   ??? Site.css                        # Default Bootstrap styles
?   ??? CosmoQuest.css                  # Custom space theme
?
??? ?? Scripts/                         # JavaScript Files
?   ??? jquery.js                       # jQuery library
?   ??? bootstrap.js                    # Bootstrap JS
?   ??? cosmoquest.js                   # Custom JS functions
?
??? ?? Database/                        # Database Scripts
?   ??? CosmoQuestDB.sql                # Complete DB schema with sample data
?
??? ?? Helpers/                         # Utility Classes
?   ??? AuthHelper.cs                   # Authentication utilities
?   ??? DatabaseHelper.cs               # Database connection helper
?
??? ?? Images/                          # Image Assets (to be created)
?   ??? planets/                        # Planet images
?   ??? stars/                          # Star/galaxy images
?   ??? missions/                       # Mission images
?
??? ?? App_Data/                        # Database Files
?   ??? CosmoQuestDB.mdf                # LocalDB database file (auto-created)
?
??? ?? App_Start/                       # Application Configuration
?   ??? BundleConfig.cs                 # Bundle and minification config
?   ??? RouteConfig.cs                  # Routing configuration
?
??? ?? Properties/                      # Project Properties
?   ??? AssemblyInfo.cs                 # Assembly information
?
??? ?? Default.aspx                     # Home page
??? ?? Default.aspx.cs
??? ?? SolarSystem.aspx                 # Planets overview
??? ?? SolarSystem.aspx.cs
??? ?? PlanetDetails.aspx               # Individual planet page
??? ?? PlanetDetails.aspx.cs
??? ?? StarsGalaxies.aspx               # Stars & Galaxies page
??? ?? StarsGalaxies.aspx.cs
??? ?? SpaceMissions.aspx               # Space missions page
??? ?? SpaceMissions.aspx.cs
??? ?? Site.Master                      # Master page layout
??? ?? Site.Master.cs                   # Master page code-behind
??? ?? Global.asax                      # Application events
??? ?? Global.asax.cs                   # Global application logic
??? ?? Web.config                       # Application configuration
??? ?? README.md                        # Project documentation
??? ?? WAPPAssignment.csproj            # Project file

```

## Page Access Matrix

| Page Type | Guest | Member | Admin |
|-----------|-------|--------|-------|
| Home | ? | ? | ? |
| Solar System | ? | ? | ? |
| Planet Details | ? | ? | ? |
| Stars & Galaxies | ? | ? | ? |
| Space Missions | ? | ? | ? |
| Login/Register | ? | ? | ? |
| Member Dashboard | ? | ? | ? |
| Quizzes | ? | ? | ? |
| Discussion Forum | ? | ? | ? |
| Admin Dashboard | ? | ? | ? |
| User Management | ? | ? | ? |
| Content Management | ? | ? | ? |

## Navigation Flow

### Guest User Flow
```
Home Page
    ??? Solar System ? Planet Details
    ??? Stars & Galaxies
    ??? Space Missions
    ??? Login ? [Redirect to Dashboard based on role]
    ??? Register ? Login
```

### Member User Flow
```
Home Page
    ??? Member Dashboard
    ?       ??? Recent Quizzes
    ?       ??? Forum Activity
    ??? Quizzes ? Take Quiz ? Results
    ??? Discussion Forum
    ?       ??? Create Topic
    ?       ??? View Topic ? Post Reply
    ??? Logout ? Home
```

### Admin User Flow
```
Home Page
    ??? Admin Dashboard
    ?       ??? System Statistics
    ?       ??? Recent Activity
    ??? Manage Users
    ?       ??? View All Users
    ?       ??? Edit User
    ?       ??? Delete User
    ??? Manage Content
    ?       ??? Manage Planets (CRUD)
    ?       ??? Manage Stars (CRUD)
    ?       ??? Manage Missions (CRUD)
    ?       ??? Manage Quizzes (CRUD)
    ?       ??? Moderate Forum
    ??? Logout ? Home
```

## Database Tables

1. **Users** - User accounts and authentication
2. **Planets** - Solar system planets
3. **StarsGalaxies** - Celestial objects
4. **SpaceMissions** - Space missions data
5. **Quizzes** - Quiz metadata
6. **QuizQuestions** - Questions for each quiz
7. **QuizAttempts** - User quiz history
8. **DiscussionTopics** - Forum topics
9. **DiscussionPosts** - Forum posts
10. **UserActivityLog** - Activity tracking

## File Naming Conventions

- **Pages**: PascalCase (e.g., `SolarSystem.aspx`)
- **Classes**: PascalCase (e.g., `AuthHelper.cs`)
- **CSS Files**: kebab-case (e.g., `cosmoquest.css`)
- **JS Files**: kebab-case (e.g., `cosmoquest.js`)
- **Folders**: PascalCase (e.g., `Admin/`, `Member/`)

## Key Features by Folder

### `/Account`
- User registration with validation
- Login with Forms Authentication
- Session management
- Remember me functionality

### `/Member`
- Personal dashboard with statistics
- Interactive quizzes
- Discussion forum participation
- Progress tracking

### `/Admin`
- System administration
- User management (CRUD)
- Content management (CRUD)
- Quiz creation and management
- Forum moderation

### `/Helpers`
- Authentication utilities (IsLoggedIn, IsAdmin, etc.)
- Database connection management
- Role-based access helpers
- Common utility functions

### `/Content`
- Space-themed CSS with animations
- Responsive design
- Bootstrap customization
- Dark mode with cosmic colors

### `/Scripts`
- Form validation
- Quiz timer
- Character counters
- Table filtering
- Loading overlays
