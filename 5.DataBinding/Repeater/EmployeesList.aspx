<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="ListView.EmployeesList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="employeesList" runat="server">        
        <asp:ListView runat="server" ID="listView">
            <LayoutTemplate>
                <h1>Employees List view</h1>
                <ul>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </ul>
            </LayoutTemplate>

            <ItemTemplate>
                <li>
                    <p><%#: Eval("TitleOfCourtesy")%></p>
                    <p><%#: Eval("FirstName") + " " + Eval("LastName")%></p>
                    <p><%#: Eval("Address") + ", " + Eval("City") + 
                        ", " + Eval("Region") + ", " + Eval("Country")%></p>
                    <p><%#: Eval("Title")%></p>
                    <p><%#: Eval("BirthDate")%></p>
                    <p><%#: Eval("HireDate")%></p>
                    <p><%#Eval("Address") + ", " + Eval("City") + 
                        ", " + Eval("Region") + ", " + Eval("Country")%></p>
                    <p><%#Eval("Notes")%></p>
                </li>
            </ItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
