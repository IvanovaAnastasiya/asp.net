<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="NwEmployeesSPA.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="employeesForm" runat="server">        
        <asp:GridView runat="server" ID="employeesGridView" 
            ItemType="Data.EmployeeModel" 
            AutoGenerateSelectButton="true" 
            OnSelectedIndexChanged="EmployeesGridView_SelectedIndexChanged"
            DataKeyNames = "Id"/>

        <asp:FormView runat="server" ID="employeeDetails" ItemType="Data.Employee" GridLines="Both">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>Title of Courtesy</td>
                        <td><%#: Eval("TitleOfCourtesy")%></td>
                    </tr>
                    
                    <tr>
                        <td>Name</td>
                        <td><%#: Eval("FirstName") + " " + Eval("LastName")  %></td>
                    </tr>

                    <tr>
                        <td>Title</td>
                        <td><%#: Eval("Title")%></td>
                    </tr>

                    <tr>
                        <td>Birth Date</td>
                        <td><%#: Eval("BirthDate")%></td>
                    </tr>

                    <tr>
                        <td>Hire Date</td>
                        <td><%#Eval("HireDate")%></td>
                    </tr>

                    <tr>
                        <td>Address</td>
                        <td><%#Eval("Address") + ", " + Eval("City") + 
                            ", " + Eval("Region") + ", " + Eval("Country")%></td>
                    </tr>

                     <tr>
                        <td>Notes</td>
                        <td><%#Eval("Notes")%></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
