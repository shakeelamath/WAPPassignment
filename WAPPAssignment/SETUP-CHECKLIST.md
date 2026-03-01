# ? Setup Checklist - CosmoQuest

Follow these steps to get CosmoQuest running on your machine.

---

## Prerequisites

### Required Software
- [ ] Visual Studio 2019 or later
- [ ] .NET Framework 4.7.2 SDK (included with Visual Studio)
- [ ] SQL Server 2016 or later / SQL Server Express / LocalDB

### Recommended (Optional)
- [ ] SQL Server Management Studio (SSMS) - For database management
- [ ] Modern web browser (Chrome, Edge, Firefox)

---

## Step-by-Step Setup

### ?? Step 1: Extract Project
- [ ] Extract the project ZIP file
- [ ] Note the location: `C:\Users\CYBORG\source\repos\WAPPAssignment`

### ?? Step 2: Open in Visual Studio
- [ ] Launch Visual Studio
- [ ] File ? Open ? Project/Solution
- [ ] Navigate to project folder
- [ ] Open `WAPPAssignment.sln`
- [ ] Wait for solution to load completely

### ?? Step 3: Restore NuGet Packages
- [ ] Right-click on Solution in Solution Explorer
- [ ] Click "Restore NuGet Packages"
- [ ] Wait for restoration to complete
- [ ] Check Output window for success message

### ?? Step 4: Setup Database

#### Recommended: Using Visual Studio Server Explorer

**Create Database in App_Data Folder:**
- [ ] Open Visual Studio Server Explorer (View ? Server Explorer)
- [ ] Right-click Data Connections ? Add Connection
- [ ] Choose Data Source: Microsoft SQL Server Database File
- [ ] Click Browse button
- [ ] Navigate to your project's App_Data folder
- [ ] Type filename: `CosmoQuestDB.mdf`
- [ ] Click Save, then OK
- [ ] Database connection appears in Server Explorer

**Create Tables and Data:**
- [ ] Right-click on CosmoQuestDB.mdf connection
- [ ] Select New Query
- [ ] Open file: `Database/CreateDatabase_AppData.sql`
- [ ] Copy ALL content (Ctrl+A, Ctrl+C)
- [ ] Paste into query window (Ctrl+V)
- [ ] Click Execute button (green arrow) or press Ctrl+Shift+E
- [ ] Wait for "Database Setup Complete!" message
- [ ] Check Messages tab for success confirmations

**Verify Database Creation:**
- [ ] In Server Explorer, right-click CosmoQuestDB.mdf
- [ ] Click Refresh
- [ ] Expand Tables node
- [ ] Count tables: Should see 10 tables
- [ ] Right-click Users table ? Show Table Data
- [ ] Verify admin user exists (Username: admin)
- [ ] Right-click Planets table ? Show Table Data
- [ ] Verify 8 planets exist (Mercury through Neptune)

#### Alternative: Using SQL Server Management Studio (SSMS)

**Only if you prefer SSMS over Server Explorer:**
- [ ] Open SQL Server Management Studio
- [ ] Connect to (LocalDB)\MSSQLLocalDB or your SQL Server instance
- [ ] File ? Open ? File ? Select `Database/CosmoQuestDB.sql`
- [ ] Press F5 to execute
- [ ] Verify "CosmoQuestDB" appears in databases list
- [ ] Update Web.config connection string if needed

**?? Need detailed help?** See `Database/DATABASE_SETUP_GUIDE.md` for complete instructions with troubleshooting.

### ?? Step 5: Verify Database Connection
- [ ] Open `Web.config` in Visual Studio
- [ ] Locate `<connectionStrings>` section
- [ ] Verify connection string matches your SQL Server setup
- [ ] Default is configured for LocalDB

**Current connection string:**
```xml
<add name="CosmoQuestDB" 
     connectionString="Data Source=(LocalDB)\MSSQLLocalDB;
                      AttachDbFilename=|DataDirectory|\CosmoQuestDB.mdf;
                      Integrated Security=True" 
     providerName="System.Data.SqlClient" />
```

**For SQL Server, change to:**
```xml
<add name="CosmoQuestDB" 
     connectionString="Data Source=YOUR_SERVER_NAME;
                      Initial Catalog=CosmoQuestDB;
                      Integrated Security=True" 
     providerName="System.Data.SqlClient" />
```

### ?? Step 6: Build Solution
- [ ] Build ? Rebuild Solution
- [ ] Wait for build to complete
- [ ] Check Output window: Should say "Build succeeded"
- [ ] Check Error List: Should show 0 errors

### ?? Step 7: Run Application
- [ ] Press **F5** or click **Start** button
- [ ] Wait for browser to open automatically
- [ ] Application should load at `http://localhost:XXXXX/`

### ?? Step 8: Verify Installation

#### Test 1: Home Page Loads
- [ ] Home page displays with space theme
- [ ] Navigation bar visible
- [ ] "Welcome to CosmoQuest" heading shown
- [ ] Three feature cards visible

#### Test 2: Guest Navigation Works
- [ ] Click "Solar System" - Should show planets
- [ ] Click "Stars & Galaxies" - Should show celestial objects
- [ ] Click "Space Missions" - Should show missions
- [ ] All pages load without errors

#### Test 3: Admin Login Works
- [ ] Click "Login" in navigation
- [ ] Enter credentials:
  - Username: `admin`
  - Password: `Admin@123`
- [ ] Click "Login" button
- [ ] Should redirect to Admin Dashboard
- [ ] Navigation should change to show Admin options

#### Test 4: Database Connection Works
- [ ] After logging in as admin
- [ ] Click "Admin Dashboard"
- [ ] Should see statistics (Total Users, Quizzes, etc.)
- [ ] Numbers should be greater than 0
- [ ] Recent users table should show admin user

#### Test 5: Registration Works
- [ ] Logout from admin account
- [ ] Click "Register"
- [ ] Fill in form with test data:
  - Full Name: `Test User`
  - Username: `testuser`
  - Email: `test@example.com`
  - Password: `Test@123`
  - Confirm Password: `Test@123`
- [ ] Click "Create Account"
- [ ] Should show success message
- [ ] Should redirect to login page

---

## Troubleshooting Checklist

### ? Problem: Build Errors

**Solution Steps:**
- [ ] Clean Solution (Build ? Clean Solution)
- [ ] Close Visual Studio
- [ ] Delete `bin` and `obj` folders
- [ ] Reopen solution
- [ ] Restore NuGet Packages
- [ ] Rebuild Solution

### ? Problem: Database Connection Failed

**Check These:**
- [ ] SQL Server service is running
- [ ] Database script was executed successfully
- [ ] Connection string in Web.config is correct
- [ ] Database name is spelled correctly: `CosmoQuestDB`
- [ ] LocalDB is installed (comes with Visual Studio)

**Test SQL Connection:**
```sql
-- Run in SSMS or VS SQL Server Object Explorer
SELECT * FROM CosmoQuestDB.dbo.Users
```

### ? Problem: Login Doesn't Work

**Verify:**
- [ ] Database has Users table
- [ ] Admin user exists in database
- [ ] Username is exactly: `admin` (lowercase)
- [ ] Password is exactly: `Admin@123` (case-sensitive)

**SQL to Check:**
```sql
SELECT Username, Password, Role FROM Users WHERE Username = 'admin'
```

### ? Problem: Pages Show 404 Error

**Check:**
- [ ] Project is running (F5 pressed)
- [ ] URL is correct (no typos)
- [ ] Page file exists in project
- [ ] IIS Express is running (system tray icon)

### ? Problem: CSS Not Loading (No Space Theme)

**Check:**
- [ ] `Content/CosmoQuest.css` file exists
- [ ] Build action is set to "Content"
- [ ] Reference in `Site.Master` is correct
- [ ] Hard refresh browser (Ctrl + F5)

---

## Final Verification

Before considering setup complete, verify ALL checkboxes:

### Database
- [ ] Database created successfully
- [ ] 8 planets loaded in Planets table
- [ ] 5 celestial objects in StarsGalaxies table
- [ ] 5 missions in SpaceMissions table
- [ ] 1 quiz with 5 questions
- [ ] Admin user exists

### Application
- [ ] Solution builds without errors
- [ ] Application runs in browser
- [ ] Home page displays correctly
- [ ] Navigation works
- [ ] Admin login successful
- [ ] Registration works

### Features
- [ ] Can view planets
- [ ] Can view planet details
- [ ] Can view stars and galaxies
- [ ] Can view space missions
- [ ] Can register new account
- [ ] Can login and logout
- [ ] Admin dashboard shows data
- [ ] Member dashboard works

---

## Quick Test Commands

### Test Database (SQL)
```sql
-- Verify all tables exist
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_CATALOG = 'CosmoQuestDB'

-- Verify sample data
SELECT COUNT(*) AS PlanetCount FROM Planets  -- Should be 8
SELECT COUNT(*) AS StarCount FROM StarsGalaxies  -- Should be 5
SELECT COUNT(*) AS MissionCount FROM SpaceMissions  -- Should be 5
SELECT COUNT(*) AS UserCount FROM Users  -- Should be 1 (admin)
```

### Test Login Credentials
```
Admin Account:
- Username: admin
- Password: Admin@123
- Expected: Redirects to /Admin/Dashboard.aspx

Test Member Account (after registration):
- Username: [your chosen username]
- Password: [your chosen password]
- Expected: Redirects to /Member/Dashboard.aspx
```

---

## Success Criteria

? **Setup is successful when:**

1. Database has all 10 tables
2. Sample data is loaded (8 planets, 5 stars, 5 missions)
3. Application runs without errors
4. All pages load correctly
5. Space theme displays properly
6. Admin login works
7. Registration works
8. Navigation changes based on role
9. Database queries return data
10. No build errors or warnings

---

## Need Help?

If you encounter issues:

1. **Check Error List** in Visual Studio (View ? Error List)
2. **Check Output Window** (View ? Output)
3. **Review Browser Console** (F12 in browser)
4. **Read Error Messages** carefully
5. **Consult Documentation**:
   - README.md - Full documentation
   - QUICKSTART.md - Quick start guide
   - STRUCTURE.md - Project structure

---

## Contact & Support

For university assignment submission:
- Include all source files
- Include database script
- Include documentation files
- Test thoroughly before submission

---

**When all checkboxes are checked, you're ready to use CosmoQuest! ????**

---

Last Updated: 2024
Project: CosmoQuest Learning System
Framework: ASP.NET Web Forms (.NET Framework 4.7.2)
