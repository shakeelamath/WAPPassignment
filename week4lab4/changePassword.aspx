<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="week4lab4.changePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
        }
        input[type="password"] {
            width: 200px;
            padding: 5px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        .message {
            margin-top: 10px;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Change Password</h2>
            <asp:Label ID="lblWelcome" runat="server" Text="Welcome"></asp:Label>
            <br /><br />
            
            <div class="form-group">
                <label>New Password:</label>
                <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" 
                    ControlToValidate="pwd" 
                    ErrorMessage="New password is required" 
                    CssClass="error" 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label>Retype Password:</label>
                <asp:TextBox ID="pwd2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPwd2" runat="server" 
                    ControlToValidate="pwd2" 
                    ErrorMessage="Retype password is required" 
                    CssClass="error" 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" />
            </div>
            
            <asp:Label ID="errMsg" runat="server" CssClass="message" Visible="false"></asp:Label>
            
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
        </div>
    </form>
</body>
</html>
