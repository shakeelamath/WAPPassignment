<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dblConnection.aspx.cs" Inherits="week4lab4.dblConnection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [userTable]">
        </asp:SqlDataSource>

        <asp:Label 
            ID="Label1" 
            runat="server" 
            Font-Size="X-Large" 
            Text="Admin Registration Page"></asp:Label>

        <br /><br />

        <table>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
                <td><asp:TextBox ID="fname" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
                <td><asp:TextBox ID="lname" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="gender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="Country"></asp:Label></td>
                <td><asp:TextBox ID="country" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Email"></asp:Label></td>
                <td><asp:TextBox ID="email" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label7" runat="server" Text="Username"></asp:Label></td>
                <td><asp:TextBox ID="username" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label8" runat="server" Text="Password"></asp:Label></td>
                <td>
                    <asp:TextBox 
                        ID="password" 
                        runat="server" 
                        TextMode="Password">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button 
                        ID="Button1" 
                        runat="server" 
                        Text="Sign Up" 
                        OnClick="Button1_Click" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label ID="errMsg" runat="server"></asp:Label><br />
                    <asp:Label ID="admin" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
