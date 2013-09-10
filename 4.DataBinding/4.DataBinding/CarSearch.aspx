<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarSearch.aspx.cs" Inherits="_4.DataBinding.CarSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Binding</title>
</head>
<body>
    <form id="CarSearchForm" runat="server">
        <asp:DropDownList runat="server" ID="ManufacturerDropDown" 
            OnSelectedIndexChanged="ManufacturerDropDown_SelectedIndexChanged">
        </asp:DropDownList>
    </form>
</body>
</html>
