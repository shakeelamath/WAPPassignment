<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="memberDashboard.aspx.cs" Inherits="week4lab4.memberDashboard" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Dashboard</title>
    <style>
        /* Reusing the style from the Login page for consistency */
        body {
            font-family: 'Times New Roman', serif;
        }

        .dashboard-container {
            width: 400px; /* Slightly wider than login to fit the links */
            border: 2px solid #000;
            padding: 20px;
            box-shadow: 5px 5px 5px #888888;
            background-color: white;
            margin: 50px auto;
        }

        .header-text {
            font-size: 2.5em; /* Large text for "My Dashboard" */
            font-weight: bold;
            margin-bottom: 30px; /* Space between title and controls */
            display: block;
        }

        .controls-row {
            display: flex;
            gap: 20px; /* Adds space between the items */
            align-items: center;
            font-size: 1.1em;
        }

        .action-link {
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="header-text">My Dashboard</div>

            <div class="controls-row">
                
                <asp:Label ID="uname" runat="server" Text="[uname]"></asp:Label>

                <asp:HyperLink ID="lnkEditProfile" runat="server" NavigateUrl="editProfile.aspx" CssClass="action-link">Edit Profile</asp:HyperLink>

                <asp:LinkButton ID="LinkButton1" OnCommand="LinkButton1_Command" runat="server">Sign Out</asp:LinkButton>
            
            </div>
        </div>
    </form>
</body>
</html>
