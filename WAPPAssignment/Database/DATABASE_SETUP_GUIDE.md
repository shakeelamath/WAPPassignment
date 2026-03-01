# ?? Database Setup Guide - App_Data Folder Method

This guide will help you create the SQL Server Database file (.mdf) in the App_Data folder using Visual Studio Server Explorer.

---

## ? Prerequisites

- Visual Studio 2019 or later
- SQL Server Data Tools (installed with Visual Studio)
- .NET Framework 4.7.2

---

## ?? Step-by-Step Instructions

### Step 1: Create App_Data Folder (If Not Exists)

1. In **Solution Explorer**, right-click on your project name `WAPPAssignment`
2. Select **Add** ? **New Folder**
3. Name it exactly: `App_Data`
4. Press Enter

> **Note:** If App_Data folder already exists, skip to Step 2

---

### Step 2: Create New SQL Server Database

#### Method A: Using Server Explorer (Recommended)

1. **Open Server Explorer**
   - Go to **View** ? **Server Explorer** (or press `Ctrl+Alt+S`)

2. **Add Data Connection**
   - Right-click on **Data Connections**
   - Select **Add Connection...**

3. **Configure Connection**
   - **Data source:** `Microsoft SQL Server Database File`
   - If you see a different source, click **Change...** and select `Microsoft SQL Server Database File`
   - Click **OK**

4. **Specify Database File**
   - Click **Browse...** button next to "Database file name"
   - Navigate to your project's **App_Data** folder
   - In the File name box, type: `CosmoQuestDB.mdf`
   - Click **Save**

5. **Authentication**
   - Leave **Use Windows Authentication** selected
   - Click **Test Connection** (should show success)
   - Click **OK**

#### Method B: Using Add New Item

1. Right-click on **App_Data** folder in Solution Explorer
2. Select **Add** ? **New Item...**
3. Select **Data** category
4. Choose **Service-based Database**
5. Name it: `CosmoQuestDB.mdf`
6. Click **Add**

---

### Step 3: Run Database Creation Script

1. **Locate the Database in Server Explorer**
   - Expand **Data Connections**
   - You should see `CosmoQuestDB.mdf`
   - Expand it to see Tables, Views, etc.

2. **Open New Query Window**
   - Right-click on `CosmoQuestDB.mdf`
   - Select **New Query**
   - A query window will open

3. **Load the SQL Script**
   - Open the file: `Database/CreateDatabase_AppData.sql`
   - Copy ALL the content (Ctrl+A, Ctrl+C)
   - Paste it into the query window (Ctrl+V)

4. **Execute the Script**
   - Click the **Execute** button (green arrow) or press `Ctrl+Shift+E`
   - Wait for execution to complete
   - You should see success messages in the output window

5. **Verify Tables Created**
   - In Server Explorer, right-click on `CosmoQuestDB.mdf`
   - Select **Refresh**
   - Expand **Tables** node
   - You should see 10 tables:
     - Users
     - Planets
     - StarsGalaxies
     - SpaceMissions
     - Quizzes
     - QuizQuestions
     - QuizAttempts
     - DiscussionTopics
     - DiscussionPosts
     - UserActivityLog

---

### Step 4: Verify Sample Data

1. **Check Users Table**
   - Right-click on **Users** table
   - Select **Show Table Data**
   - You should see 1 row: admin user

2. **Check Planets Table**
   - Right-click on **Planets** table
   - Select **Show Table Data**
   - You should see 8 rows: Mercury through Neptune

3. **Check Other Tables**
   - StarsGalaxies: 5 rows
   - SpaceMissions: 5 rows
   - Quizzes: 1 row
   - QuizQuestions: 5 rows

---

### Step 5: Verify Connection String

1. Open `Web.config` file
2. Locate the `<connectionStrings>` section
3. Verify it looks like this:

```xml
<connectionStrings>
  <add name="CosmoQuestDB" 
       connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CosmoQuestDB.mdf;Integrated Security=True;Connect Timeout=30" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

4. **Important:** `|DataDirectory|` automatically points to the App_Data folder

---

### Step 6: Test the Application

1. **Build the Solution**
   - Press `Ctrl+Shift+B` or go to **Build** ? **Build Solution**
   - Ensure build is successful (0 errors)

2. **Run the Application**
   - Press `F5` or click **Start**
   - Browser should open automatically

3. **Test Database Connection**
   - Click **Login** in navigation
   - Enter credentials:
     - Username: `admin`
     - Password: `Admin@123`
   - Click **Login**
   - Should redirect to Admin Dashboard
   - You should see statistics loaded from database

4. **Verify Data Loading**
   - Click **Solar System** in navigation
   - You should see all 8 planets
   - Click on any planet to view details

---

## ?? Troubleshooting

### ? Problem: Can't create database in App_Data

**Solution:**
- Ensure App_Data folder exists
- Check folder is not read-only
- Try running Visual Studio as Administrator
- Restart Visual Studio and try again

### ? Problem: Script execution fails

**Solution:**
- Ensure you're connected to the correct database
- Check the query window title shows `CosmoQuestDB.mdf`
- Copy script again (ensure no characters were lost)
- Try executing in smaller sections

### ? Problem: Tables not appearing after script

**Solution:**
- Right-click database in Server Explorer ? **Refresh**
- Close and reopen Server Explorer
- Disconnect and reconnect to database

### ? Problem: Login fails after setup

**Solution:**
- Verify admin user exists:
  ```sql
  SELECT * FROM Users WHERE Username = 'admin'
  ```
- Check password is exactly: `Admin@123` (case-sensitive)
- Ensure Role is set to 'Admin'

### ? Problem: Connection string error

**Solution:**
- Verify `CosmoQuestDB.mdf` exists in App_Data folder
- Check Web.config connection string
- Ensure connection string name matches: `CosmoQuestDB`
- Try adding `User Instance=True` to connection string

---

## ?? Database File Location

Your database file will be located at:
```
[Your Project Folder]\App_Data\CosmoQuestDB.mdf
[Your Project Folder]\App_Data\CosmoQuestDB_log.ldf
```

Example:
```
C:\Users\CYBORG\source\repos\WAPPAssignment\App_Data\CosmoQuestDB.mdf
```

---

## ?? Verification Checklist

Before running the application, verify:

- [ ] App_Data folder exists in project
- [ ] CosmoQuestDB.mdf file exists in App_Data folder
- [ ] Database appears in Server Explorer under Data Connections
- [ ] All 10 tables are visible in Server Explorer
- [ ] Users table has 1 row (admin)
- [ ] Planets table has 8 rows
- [ ] StarsGalaxies table has 5 rows
- [ ] SpaceMissions table has 5 rows
- [ ] Quizzes table has 1 row
- [ ] QuizQuestions table has 5 rows
- [ ] Web.config connection string is correct
- [ ] Solution builds successfully (0 errors)

---

## ?? Quick SQL Verification Script

Run this in a new query window to verify everything:

```sql
-- Check all tables exist
SELECT 
    TABLE_NAME,
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_NAME = T.TABLE_NAME) AS ColumnCount
FROM INFORMATION_SCHEMA.TABLES T
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

-- Check sample data counts
SELECT 
    'Users' AS TableName, COUNT(*) AS RecordCount FROM Users
UNION ALL
SELECT 'Planets', COUNT(*) FROM Planets
UNION ALL
SELECT 'StarsGalaxies', COUNT(*) FROM StarsGalaxies
UNION ALL
SELECT 'SpaceMissions', COUNT(*) FROM SpaceMissions
UNION ALL
SELECT 'Quizzes', COUNT(*) FROM Quizzes
UNION ALL
SELECT 'QuizQuestions', COUNT(*) FROM QuizQuestions;

-- Verify admin user
SELECT Username, Role, IsActive FROM Users WHERE Username = 'admin';
```

Expected Results:
- 10 tables
- Users: 1 record
- Planets: 8 records
- StarsGalaxies: 5 records
- SpaceMissions: 5 records
- Quizzes: 1 record
- QuizQuestions: 5 records
- Admin user exists and is active

---

## ?? Alternative: Command Line Method

If Server Explorer doesn't work, you can create the database using SqlCmd:

```bash
# Navigate to your project folder
cd "C:\Users\CYBORG\source\repos\WAPPAssignment"

# Create the database (using SqlLocalDB)
sqllocaldb create MSSQLLocalDB
sqllocaldb start MSSQLLocalDB

# Create database file
sqlcmd -S "(LocalDB)\MSSQLLocalDB" -Q "CREATE DATABASE CosmoQuestDB ON PRIMARY (NAME=CosmoQuestDB, FILENAME='C:\Users\CYBORG\source\repos\WAPPAssignment\App_Data\CosmoQuestDB.mdf')"

# Run the setup script
sqlcmd -S "(LocalDB)\MSSQLLocalDB" -d CosmoQuestDB -i "Database\CreateDatabase_AppData.sql"
```

---

## ?? Success!

When all steps are complete:
- ? Database file exists in App_Data
- ? All tables created with sample data
- ? Connection string configured correctly
- ? Application runs and connects to database
- ? Can login as admin
- ? Can view planets, stars, and missions

**You're ready to use CosmoQuest! ????**

---

## ?? Need Help?

If you encounter issues:
1. Check the Troubleshooting section above
2. Verify each step was completed correctly
3. Check Visual Studio Output window for error messages
4. Ensure SQL Server LocalDB is installed
5. Try restarting Visual Studio

---

**Database Setup Complete!** ??
