<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EmployeesApp.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employees App</title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script src="Scripts/app.js"></script>
    <link href="Styles/styles.css" rel="stylesheet" />
</head>
<body>
    <div id="details-element">
    </div>
    <form id="appForm" runat="server">
        <asp:ListView ID="employeesList" runat="server" ItemType="Data.Employee">
            
            <LayoutTemplate>
                <h1>Employees</h1>
                <ul id="employees-list">
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </ul>
            </LayoutTemplate>

            <ItemTemplate>
                <li class="employee-holder" data-employee-id="<%#: Item.EmployeeID  %>">
                    <h3><%#: Item.FirstName + " " + Item.LastName %></h3>
                    <span><%#: Item.City + ", " + Item.Country %></span>
                </li>
            </ItemTemplate>

        </asp:ListView>

        <asp:DataGrid runat="server" 
            AutoGenerateColumns="false" 
            AllowSorting="true" 
            ID="employeesGrid"
            DataKeyField="EmployeeID"
            OnItemDataBound="employeesGrid_ItemDataBound"
            OnSortCommand="employeesGrid_SortCommand">
            <Columns>
                <asp:BoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName"/>
                <asp:BoundColumn DataField="City" HeaderText="City" SortExpression="City"/>
            </Columns>
            <AlternatingItemStyle BackColor="AntiqueWhite" />
            <ItemStyle CssClass="employee-holder-tr"/>
        </asp:DataGrid>
    </form>
</body>
</html>
