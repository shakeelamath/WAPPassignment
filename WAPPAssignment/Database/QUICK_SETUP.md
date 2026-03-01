# ?? Quick Database Setup - Visual Studio Server Explorer

## 60-Second Setup Guide

### 1?? Open Server Explorer
```
View ? Server Explorer (or press Ctrl+Alt+S)
```

### 2?? Add Database Connection
```
Right-click "Data Connections"
   ?
Click "Add Connection..."
   ?
Data Source: Microsoft SQL Server Database File
   ?
Click "Browse..."
   ?
Navigate to: [Your Project]\App_Data\
   ?
Type filename: CosmoQuestDB.mdf
   ?
Click "Save" ? "Test Connection" ? "OK"
```

### 3?? Create Tables & Load Data
```
Right-click "CosmoQuestDB.mdf" in Server Explorer
   ?
Click "New Query"
   ?
Open file: Database/CreateDatabase_AppData.sql
   ?
Copy ALL content (Ctrl+A, Ctrl+C)
   ?
Paste into query window (Ctrl+V)
   ?
Click "Execute" button (green arrow) or press Ctrl+Shift+E
   ?
Wait for "Database Setup Complete!" message
```

### 4?? Verify Installation
```
In Server Explorer:
   ?
Right-click "CosmoQuestDB.mdf" ? Refresh
   ?
Expand "Tables" node
   ?
You should see 10 tables:
   ? Users (1 record - admin)
   ? Planets (8 records)
   ? StarsGalaxies (5 records)
   ? SpaceMissions (5 records)
   ? Quizzes (1 record)
   ? QuizQuestions (5 records)
   ? QuizAttempts
   ? DiscussionTopics
   ? DiscussionPosts
   ? UserActivityLog
```

### 5?? Test the Application
```
Press F5 to run
   ?
Login with:
   Username: admin
   Password: Admin@123
   ?
Should redirect to Admin Dashboard
   ?
Click "Solar System" to see 8 planets
```

---

## ? Success Checklist

- [ ] CosmoQuestDB.mdf file exists in App_Data folder
- [ ] Database connection shows in Server Explorer
- [ ] 10 tables visible in Tables node
- [ ] Admin user exists in Users table
- [ ] 8 planets in Planets table
- [ ] Application runs without errors
- [ ] Can login as admin
- [ ] Can view all planets

---

## ?? Connection String (Already Configured)

Your `Web.config` is already set up:
```xml
<connectionStrings>
  <add name="CosmoQuestDB" 
       connectionString="Data Source=(LocalDB)\MSSQLLocalDB;
                        AttachDbFilename=|DataDirectory|\CosmoQuestDB.mdf;
                        Integrated Security=True;
                        Connect Timeout=30" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

**Note:** `|DataDirectory|` automatically points to `App_Data` folder

---

## ?? Quick Troubleshooting

### Problem: Database file not found
**Fix:** Ensure App_Data folder exists in your project root

### Problem: Can't add connection
**Fix:** Select correct data source: "Microsoft SQL Server Database File"

### Problem: Script execution fails
**Fix:** Ensure you're in the query window for CosmoQuestDB.mdf

### Problem: Tables not showing
**Fix:** Right-click database ? Refresh

### Problem: Login fails
**Fix:** Verify admin user exists: Right-click Users table ? Show Table Data

---

## ?? Admin Login Credentials

```
Username: admin
Password: Admin@123
```

---

## ?? File Locations

**Database File:**
```
[ProjectFolder]\App_Data\CosmoQuestDB.mdf
[ProjectFolder]\App_Data\CosmoQuestDB_log.ldf
```

**SQL Script:**
```
[ProjectFolder]\Database\CreateDatabase_AppData.sql
```

**Detailed Guide:**
```
[ProjectFolder]\Database\DATABASE_SETUP_GUIDE.md
```

---

## ?? That's It!

Three simple steps:
1. **Add connection** in Server Explorer
2. **Execute SQL script** 
3. **Run application** (F5)

**Total time: ~2 minutes** ?

---

**Need more help?** See `DATABASE_SETUP_GUIDE.md` for detailed instructions!
