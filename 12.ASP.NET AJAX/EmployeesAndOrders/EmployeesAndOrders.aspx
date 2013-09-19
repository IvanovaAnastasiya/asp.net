<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesAndOrders.aspx.cs" Inherits="EmployeesAndOrders.EmployeesAndOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="EmployeesAndOrdersForm" runat="server">
        <asp:ScriptManager runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" 
            UpdateMode="Conditional" 
            ChildrenAsTriggers="true"
            Id="FirstPanel">
            <ContentTemplate>
                <asp:GridView runat="server"
                    ID="Employees"
                    DataKeyNames="EmployeeId"
                    SelectMethod="Employees_GetData"
                    AutoGenerateColumns="false"
                    AutoGenerateSelectButton="true"
                    OnSelectedIndexChanged="Employees_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="Fist Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    </Columns>
                    <SelectedRowStyle BackColor="Yellow" Wrap="true" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdateProgress runat="server"
            DisplayAfter="200"
            AssociatedUpdatePanelID="FirstPanel" 
            ID="Demo">
            <ProgressTemplate>
                    <div style="height:100%; width:100%;background-color:white;position:absolute">
                        <img src="img/update.gif"></img>
                    </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel runat="server"
            ID="OrdersUpdatePanel"
            UpdateMode="Conditional"
            RenderMode="Block">
            <ContentTemplate>
                <asp:GridView runat="server"
                    ID="OrdersGridView"
                    PageSize="10">
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

      

    </form>
</body>
</html>
