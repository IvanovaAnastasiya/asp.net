<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RandomNumbers.aspx.cs" Inherits="RandomNumbers.RandomNumbers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <fieldset>
            <legend>Web Server Controls</legend>
            <asp:Label Text="From Number" runat="server" />
            <asp:TextBox runat="server" ID="FromNumber" />
            <asp:Label Text="To Number" runat="server" />
            <asp:TextBox runat="server" ID="ToNumber"/>        
            <asp:Button runat="server" OnClick="GenarateRandom_Click" Text="Generate random number"/>
            <asp:Literal runat="server" ID="Result" ></asp:Literal>
       </fieldset>              
    </div>
        <div>
            <fieldset>
                <legend>Html Server Controls</legend>
                <label>From Number</label>
                <input type="number" id="FirsNumberHtml" runat="server" />
                <label>From Number</label>
                <input type="number" id="ToNumberHtml" runat="server" />
                <button runat="server" onserverclick="GenerateRandomHtml_ServerClick">Generate random number</button>
                <span id="randomHtml" runat="server"></span>
            </fieldset>
        </div>
    </form>
</body>
</html>
