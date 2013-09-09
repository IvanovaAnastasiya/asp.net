<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="_2.NorthwindEmployees.EmployeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="employeeDetailsForm" runat="server">
        <asp:DetailsView 
            runat="server" ID="employeeDetailsView" 
            AllowPaging="false" AutoGenerateRows="true" />
    </form>
    <a href="EmployeesList.aspx">Back</a>
</body>
</html>
