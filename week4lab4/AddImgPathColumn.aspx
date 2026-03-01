<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddImgPathColumn.aspx.cs" Inherits="week4lab4.AddImgPathColumn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Image Path Column</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Add ImgPath Column to Database</h1>
            <asp:Button ID="btnAddColumn" runat="server" Text="Add ImgPath Column" OnClick="btnAddColumn_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
