<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="week4lab4.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Registration Page</h1>
            
            <asp:Label ID="errMsg" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            
            <table>
                <tr>
                    <td>Username:</td>
                    <td>
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td>
                        <asp:TextBox ID="fname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td>
                        <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <asp:DropDownList ID="gender" runat="server">
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>M</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td>
                        <asp:TextBox ID="country" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>User Type:</td>
                    <td>
                        <asp:DropDownList ID="usertype" runat="server">
                            <asp:ListItem>member</asp:ListItem>
                            <asp:ListItem>admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="login.aspx">Back to Login</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
