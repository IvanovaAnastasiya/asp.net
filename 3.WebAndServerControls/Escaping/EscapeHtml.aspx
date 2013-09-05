<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EscapeHtml.aspx.cs" Inherits="Escaping.EscapeHtml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="TextInput"/>
        <asp:Button runat="server" OnClick="TextTransfer_Click" Text="Transfer" />
        <asp:TextBox runat="server" Id="TextOutput"/>
        <asp:Label runat="server" ID="LabelOutput"/>
    </div>
    </form>
</body>
</html>
