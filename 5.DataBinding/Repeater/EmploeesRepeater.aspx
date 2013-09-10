<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmploeesRepeater.aspx.cs" Inherits="Repeater.EmploeesRepeater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Repeater</title>
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="employeesRepeaterForm" runat="server">
        <table>
            <asp:Repeater runat="server" ID="employeesRepeater">
                <AlternatingItemTemplate>
                    <tr class="alternating-item">
                        <td><%#: Eval("TitleOfCourtesy")%></td>
                        <td><%#: Eval("FirstName") + " " + Eval("LastName")%></td>
                        <td><%#: Eval("Address") + ", " + Eval("City") + 
                            ", " + Eval("Region") + ", " + Eval("Country")%></td>
                        <td><%#: Eval("Title")%></td>
                        <td><%#: Eval("BirthDate")%></td>
                        <td><%#: Eval("HireDate")%></td>
                        <td><%#Eval("Address") + ", " + Eval("City") + 
                            ", " + Eval("Region") + ", " + Eval("Country")%></td>
                        <td><%#Eval("Notes")%></td>
                    </tr>
                </AlternatingItemTemplate>

                <HeaderTemplate>
                    <tr>
                        <th>Title of Courtesy</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Title</th>
                        <th>Birth Date</th>
                        <th>Hire Date</th>
                        <th>Address</th>
                        <th>Notes</th>
                    </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%#: Eval("TitleOfCourtesy")%></td>
                        <td><%#: Eval("FirstName") + " " + Eval("LastName")%></td>
                        <td><%#: Eval("Address") + ", " + Eval("City") + 
                            ", " + Eval("Region") + ", " + Eval("Country")%></td>
                        <td><%#: Eval("Title")%></td>
                        <td><%#: Eval("BirthDate")%></td>
                        <td><%#: Eval("HireDate")%></td>
                        <td><%#Eval("Address") + ", " + Eval("City") + 
                            ", " + Eval("Region") + ", " + Eval("Country")%></td>
                        <td><%#Eval("Notes")%></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    <tr>
                        <td colspan ="8">End of file (EOF)</td>
                    </tr>
                </FooterTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>
</html>
