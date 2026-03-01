<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lab4calculator.aspx.cs" Inherits="week4lab4.lab4calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Calculator</title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>A simple Calculator (New)</h2>
        
        First Number:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        
        Second Number:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <div class="button-container">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Addition" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Substraction" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Multiplication" />
            <asp:Button ID="Button4" runat="server" Text="Division" />
        </div>

        <br />
        <asp:Label ID="Label4" runat="server" Text="The result is:"></asp:Label>
    </form>
</body>
</html>
