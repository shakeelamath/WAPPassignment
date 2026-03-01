# ?? Quick Start Guide - CosmoQuest Learning System

## Getting Started in 5 Minutes

### Step 1: Run the Database Script ?

**Option A: Using Visual Studio Server Explorer (Recommended)**

1. Open **View** ? **Server Explorer** (Ctrl+Alt+S)
2. Right-click **Data Connections** ? **Add Connection...**
3. Select **Microsoft SQL Server Database File**
4. Click **Browse...** and navigate to your project's `App_Data` folder
5. Type filename: `CosmoQuestDB.mdf` and click **Save**
6. Click **Test Connection** ? **OK**
7. Right-click the new connection ? **New Query**
8. Open file `Database/CreateDatabase_AppData.sql`
9. Copy all content and paste into query window
10. Click **Execute** (green arrow) or press Ctrl+Shift+E
11. Wait for "Database Setup Complete!" message

**Option B: If database already exists in Server Explorer**
1. Right-click `CosmoQuestDB.mdf` in Server Explorer
2. Select **New Query**
3. Paste contents of `Database/CreateDatabase_AppData.sql`
4. Click **Execute**

**?? Detailed Instructions:** See `Database/DATABASE_SETUP_GUIDE.md`

### Step 2: Launch the Application ??
1. Open the solution in **Visual Studio**
2. Press **F5** or click **Start**
3. Your browser will open automatically

### Step 3: Login and Explore ??

#### Option 1: Login as Admin
```
Username: admin
Password: Admin@123
```
- Access all features
- Manage users and content
- View system statistics

#### Option 2: Create Member Account
1. Click **Register** in navigation
2. Fill in your details:
   - Full Name
   - Username (4-20 characters)
   - Email address
   - Password (must include: uppercase, lowercase, number, special character)
3. Click **Create Account**
4. Login with your credentials

---

## Main Features to Try

### ?? For Everyone (No Login Required)
1. **Explore Solar System**
   - Click **Solar System** in navigation
   - View all 8 planets
   - Click any planet for detailed information

2. **Discover Stars & Galaxies**
   - Click **Stars & Galaxies**
   - Learn about the Milky Way, Andromeda, and more

3. **Space Missions**
   - Click **Space Missions**
   - Read about Apollo 11, Voyager, and modern missions

### ?? For Members (Login Required)
1. **Personal Dashboard**
   - View your quiz statistics
   - See recent activities
   - Track your progress

2. **Take Quizzes**
   - Go to **Quizzes** page
   - Select "Solar System Basics" (sample quiz included)
   - Answer 5 questions
   - View your score immediately

3. **Join Discussions**
   - Visit **Discussion Forum**
   - Create a new topic
   - Share your space knowledge

### ????? For Admins (Admin Login Required)
1. **Admin Dashboard**
   - View system overview
   - See user statistics
   - Monitor quiz activity

2. **Manage Users**
   - Go to **Manage Users**
   - Edit user roles
   - Activate/deactivate accounts
   - Search for users

3. **Manage Content**
   - Click **Manage Content**
   - Access all content management features
   - Add, edit, or delete planets, stars, missions

---

## Sample Data Included ??

The database includes:
- ? **8 Planets** (Mercury to Neptune)
- ? **5 Celestial Objects** (Milky Way, Andromeda, Sirius, etc.)
- ? **5 Space Missions** (Apollo 11, Voyager, etc.)
- ? **1 Sample Quiz** (Solar System Basics with 5 questions)
- ? **1 Admin Account** (username: admin)

---

## Navigation Reference

### Guest Navigation
```
?? Home
?? Solar System
? Stars & Galaxies
?? Space Missions
?? Login
?? Register
```

### Member Navigation
```
?? Home
?? Dashboard
?? Solar System
?? Quizzes
?? Discussion
?? Logout
```

### Admin Navigation
```
?? Home
????? Admin Dashboard
?? Manage Content
?? Manage Users
?? Logout
```

---

## Common Tasks

### Task: Take Your First Quiz
1. Login as member
2. Click **Quizzes** in navigation
3. Click **Start Quiz** on "Solar System Basics"
4. Answer 5 questions
5. Click **Submit Quiz**
6. View your results

### Task: Create a Discussion Topic
1. Login as member
2. Click **Discussion** in navigation
3. Click **? New Topic**
4. Fill in:
   - Topic Title
   - Select Category
   - Description
5. Click **Create Topic**

### Task: Add a New User (Admin)
1. Login as admin
2. Go to **Manage Users**
3. Users can only self-register through the Register page
4. As admin, you can:
   - Change user roles
   - Activate/Deactivate accounts
   - View user activity

### Task: View Planet Details
1. Click **Solar System**
2. Click **Learn More** on any planet
3. View detailed information:
   - Physical characteristics
   - Orbital data
   - Interesting facts

---

## Troubleshooting ??

### Database Connection Error
**Problem**: Can't connect to database

**Solution**:
1. Check `Web.config` connection string
2. Verify SQL Server is running
3. Ensure database script was executed
4. For LocalDB: Make sure it's installed with Visual Studio

### Login Not Working
**Problem**: Can't login with admin credentials

**Solution**:
1. Verify database script created the admin user
2. Check username is `admin` (case-sensitive)
3. Password is `Admin@123` (exact characters)
4. Run this SQL to verify:
   ```sql
   SELECT * FROM Users WHERE Username = 'admin'
   ```

### Page Not Found (404)
**Problem**: Clicking links shows 404 error

**Solution**:
1. Ensure you're running from Visual Studio (F5)
2. Check the URL doesn't have extra characters
3. Verify the page exists in the project

### Can't See Member/Admin Features
**Problem**: Logged in but don't see expected features

**Solution**:
1. Verify you're actually logged in (see username in nav)
2. Check your role:
   - Members see: Dashboard, Quizzes, Discussion
   - Admins see: Admin Dashboard, Manage Users, Manage Content
3. Try logging out and back in

---

## Testing Scenarios ??

### Scenario 1: Student Learning Journey
1. Register as new member
2. Browse Solar System pages
3. Take "Solar System Basics" quiz
4. View dashboard to see quiz results
5. Create a discussion topic about your favorite planet

### Scenario 2: Admin Management
1. Login as admin
2. View Admin Dashboard statistics
3. Go to Manage Users
4. Search for a user
5. Edit a user's role from Member to Admin
6. View user activity

### Scenario 3: Guest Exploration
1. Don't login (browse as guest)
2. Explore all planets
3. View Stars & Galaxies
4. Read about Space Missions
5. Try to access Quizzes (redirects to Login)
6. Register for an account

---

## Next Steps

After exploring the basic features:

1. **Customize Content**
   - Login as admin
   - Add more planets or update existing data
   - Create new quizzes

2. **Test Role-Based Access**
   - Create multiple member accounts
   - Test navigation differences
   - Verify protected pages redirect properly

3. **Explore the Code**
   - Check `Helpers/AuthHelper.cs` for authentication logic
   - Review `Site.Master.cs` for navigation logic
   - Study database queries in page code-behind files

4. **Enhance the Project** (Optional)
   - Add images for planets
   - Create more quizzes
   - Add more forum categories
   - Implement additional CRUD pages for admin

---

## Important Files

| File | Purpose |
|------|---------|
| `Web.config` | Database connection & authentication settings |
| `Database/CosmoQuestDB.sql` | Complete database with sample data |
| `Site.Master` | Navigation bar and page layout |
| `Helpers/AuthHelper.cs` | Authentication & role checking |
| `Content/CosmoQuest.css` | Space-themed styling |

---

## Support & Resources

- **README.md** - Complete project documentation
- **STRUCTURE.md** - Detailed project structure
- **Database Schema** - See comments in SQL file
- **Inline Code Comments** - Throughout C# files

---

## ?? You're Ready!

The application is fully functional with:
- ? User registration and login
- ? Role-based navigation (Guest, Member, Admin)
- ? Planet browsing system
- ? Interactive quizzes
- ? Discussion forum
- ? Admin management tools
- ? Beautiful space-themed UI
- ? Sample data for testing

**Happy exploring! ????**

---

**Need Help?**
1. Check the README.md for detailed information
2. Review the STRUCTURE.md for project organization
3. Examine the database schema in CosmoQuestDB.sql
4. Read inline comments in code files
