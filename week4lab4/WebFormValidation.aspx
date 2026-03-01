<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormValidation.aspx.cs" Inherits="week4lab4.WebFormValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First Name is Required">*</asp:RequiredFieldValidator>
        <p>
            Last Name<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Last Name is Required">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
            <asp:ListBox ID="ListBox1" runat="server" Height="26px">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:ListBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Valid email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Your ID"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="8 characters or more" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="6 characters or more" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="Re-Type password"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox5" ErrorMessage="Validation Failed"></asp:CompareValidator>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="33px" OnClick="Button1_Click" Text="Submit" />
        </p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="White" ForeColor="Red" HeaderText="One or  more fields were entered incorrectly" />
    </form>
</body>
</html>
