<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="World.aspx.cs" Inherits="World.WebForm.World" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="worldForm" runat="server">
        <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Continents"
            ID="ContinentsDataSource" />

        <h2>Continents:</h2>
        <%--ListBox escapes its content--%>
        <asp:ListBox runat="server"
            DataSourceID="ContinentsDataSource"
            DataTextField="Name" DataValueField="Id"
            AutoPostBack="true" ID="SelectedContinent"
            SelectionMode="Single"
            Rows="8" />
        <a href="EditContinents.aspx">Edit Continents</a>

        <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Countries" Include="Languages"
            ID="CountriesDataSource"
            Where="it.ContinentId=@ContinentId"
            EnableFlattening="false">
            <WhereParameters>
                <asp:ControlParameter Name="ContinentId" Type="Int32" ControlID="SelectedContinent" />
            </WhereParameters>
        </asp:EntityDataSource>

        <%--GridView escapes its content--%>
        <asp:GridView runat="server" ID="CountriesGrid"
            AllowSorting="true" AllowPaging="true" PageSize="5"
            AutoGenerateColumns="false" AutoGenerateSelectButton="false"
            DataSourceID="CountriesDataSource"
            DataKeyNames="Id"
            OnSelectedIndexChanged="CountriesGrid_SelectedIndexChanged"
            SelectedRowStyle-Font-Bold="true"
            ItemType="World.Data.Country">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Country Name" SortExpression="Name" /> 
                              
                <asp:TemplateField HeaderText="Languages">
                    <ItemTemplate>
                        <%#: GetLanguages((IEnumerable<World.Data.Language>)Eval("Languages")) %>                        
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" />
                <asp:CommandField ButtonType="Link" ShowSelectButton="true" ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
            <EmptyDataTemplate>
                <p>Empty countries list recieved.</p>
            </EmptyDataTemplate>
        </asp:GridView>

        <asp:EntityDataSource ID="TownsDataSource" ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities" EntitySetName="Towns"
            Where="it.CountryId=@CountryId" runat="server">
            <WhereParameters>
                <asp:ControlParameter Name="CountryId" Type="Int32" ControlID="CountriesGrid" />
            </WhereParameters>
        </asp:EntityDataSource>

        <asp:ListView ID="TownsListView" runat="server" DataSourceID="TownsDataSource" DataKeyNames="Id">
            <LayoutTemplate>
                <h3>Towns:</h3>
                <ul>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </ul>
            </LayoutTemplate>

            <ItemTemplate>
                <li><%#: Eval("Name") %></li>
            </ItemTemplate>

            <EmptyDataTemplate>
                <li>Empty towns list recieved from server.
                </li>
            </EmptyDataTemplate>

            <EmptyItemTemplate>
                <li>(empty town name)
                </li>
            </EmptyItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
