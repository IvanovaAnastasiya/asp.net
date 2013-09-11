<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EmployeeApp.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>App Employees</title>
</head>
<body>
    <form id="appForm" runat="server">
        <asp:GridView runat="server" ID="employeeNameAdress"> 
            <PagerSettings Visible="true" NextPageText="Next" LastPageText="Last" Mode="NextPrevious"/>
        </asp:GridView>
    </form>
</body>
</html>
