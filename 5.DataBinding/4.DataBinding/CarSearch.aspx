<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarSearch.aspx.cs" Inherits="_4.DataBinding.CarSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Binding</title>
</head>
<body>
    <form id="CarSearchForm" runat="server">
        <asp:DropDownList runat="server" ID="ManufacturerDropDown" 
            OnSelectedIndexChanged="ManufacturerDropDown_SelectedIndexChanged"
            AutoPostBack="True">
        </asp:DropDownList>
        <hr />

        <asp:DropDownList runat="server" AutoPostBack="true"
            ID="ModelsDropDown">
        </asp:DropDownList>

        <asp:CheckBoxList runat="server" AutoPostBack="false" ID="Extras" />

        <asp:Button runat="server" ID="SearchCar" OnClick="SearchCar_Click" Text="Search" />

        <asp:Literal runat ="server" ID="Results"></asp:Literal>
    </form>
</body>
</html>
