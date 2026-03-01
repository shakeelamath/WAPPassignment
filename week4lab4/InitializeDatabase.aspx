<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitializeDatabase.aspx.cs" Inherits="week4lab4.InitializeDatabase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Initialize Database</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Database Initialization</h1>
            <asp:Button ID="btnInitialize" runat="server" Text="Initialize Database" OnClick="btnInitialize_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
