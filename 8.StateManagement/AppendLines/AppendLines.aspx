<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppendLines.aspx.cs" Inherits="AppendLines.AppendLines" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="LineTextBox" runat="server" ViewStateMode="Enabled"/>
        <asp:Button ID="NextText" runat="server" OnClick="NextText_Click" Text="+" />
        <asp:Label ID="TextLines" runat="server" />
    </div>
    </form>
</body>
</html>
