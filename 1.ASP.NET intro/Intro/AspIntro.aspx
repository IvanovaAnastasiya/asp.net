<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AspIntro.aspx.cs" Inherits="Intro.AspIntro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sumator</title>
    <link href="Styles/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="CalculatorForm" runat="server">
        <asp:Panel runat="server" >
            <div>
                <asp:TextBox runat="server" ID="FirstNumber" class="number-input"/>
                
                <asp:TextBox runat="server" ID="SecondNumber" class="number-input"/>
                <asp:Button Text="Calculate Sum" OnClick="CalculateSum_Click" runat="server" />
                <div runat="server" id="sum"></div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
