<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="_2.NorthwindEmployees.EmployeesList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="employeesListForm" runat="server">
        <asp:ListView ID="employeesList" runat="server" ItemType="_2.NorthwindEmployees.EmployeeModel">
            <ItemTemplate>
                <div class="employee-item">
                    <a href="EmployeeDetails.aspx?id=<%# Item.Id %>"><%# Item.Name %></a>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
