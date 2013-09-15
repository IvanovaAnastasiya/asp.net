
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="CookieExchange.LiginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="UserTextBox" runat="server" ViewStateMode="Disabled"/>
        <asp:Button ID="LogIn" runat="server" OnClick="LogIn_Click" Text="+" />
        <asp:Label ID="IsRedirected" runat="server" />
    </div>
    </form>
</body>
</html>
