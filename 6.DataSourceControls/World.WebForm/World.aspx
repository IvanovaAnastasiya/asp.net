<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="World.aspx.cs" Inherits="World.WebForm.World" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>World Main</title>
    <script src="scripts/jquery-2.0.3.min.js"></script>
    <link href="scripts/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="scripts/css/bootstrap.css" rel="stylesheet" />
    <script src="scripts/js/bootstrap.js"></script>

    <link href="styles/world.css" rel="stylesheet" />
</head>
<body class="container-fluid">    
    <form id="worldForm" runat="server" class="container-fluid active text-center">
        <%--Data source controls--%>  
        <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Continents"
            ID="ContinentsDataSource" />

        <asp:EntityDataSource ID="CountriesDataSource"                    
                runat="server" ConnectionString="name=WorldEntities" DefaultContainerName="WorldEntities"
                EntitySetName="Countries" Include="Languages"
                    
                Where="it.ContinentId=@ContinentId"
                EnableFlattening="false"
                EnableDelete="true"
                EnableInsert="true"
                EnableUpdate="true">
                <WhereParameters>
                    <asp:ControlParameter Name="ContinentId" Type="Int32" ControlID="SelectedContinent" />
                </WhereParameters>
            </asp:EntityDataSource>

        <asp:EntityDataSource 
                    ID="TownsDataSource"
                     
                    ConnectionString="name=WorldEntities" DefaultContainerName="WorldEntities" EntitySetName="Towns"
                    Where="it.CountryId=@CountryId" runat="server" EnableInsert="true" EnableFlattening="false" 
                    EnableUpdate="true" EnableDelete="true">
                    <WhereParameters>
                        <asp:ControlParameter Name="CountryId" Type="Int32" ControlID="CountriesGrid" />
                    </WhereParameters>
                </asp:EntityDataSource>
        
        <div class="navbar-fixed-top">
            <a href="EditContinents.aspx" class="btn-info btn">Edit Continents</a>
            <a href="EditCountries.aspx" class="btn btn-info">Edit Countries</a>
            <a href="EditTowns.aspx" class="btn btn-info">Edit towns</a>
        </div>
        
        <div class="row-fluid text-center" >
            <div class="page-header">
                <h1>Main Page</h1>
            </div>
        </div> 
        
        <div class="row-fluid">
            <div class="span2">
                <h2>Continents:</h2>
                <div>
                    <%--ListBox escapes its content--%>
                    <asp:ListBox runat="server"
                        DataSourceID="ContinentsDataSource"
                        DataTextField="Name" DataValueField="Id"
                        AutoPostBack="true" ID="SelectedContinent"
                        SelectionMode="Single"
                        Rows="8"
                        CssClass="media" />
                </div>                
            </div>
            
            <div class="span8">                
                <h3>Countries</h3>               

                <%--GridView escapes its content--%>
                <asp:GridView runat="server" ID="CountriesGrid"
                    AllowSorting="true" AllowPaging="true" PageSize="5"
                    AutoGenerateColumns="false"
                    DataSourceID="CountriesDataSource" DataKeyNames="Id"
                                        
                    SelectedRowStyle-Font-Bold="true"
                    CssClass="table-bordered table-hover table"

                    OnSelectedIndexChanged="CountriesGrid_SelectedIndexChanged"
                    OnRowDataBound="CountriesGrid_RowDataBound">
                    
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Country Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Languages">
                            <ItemTemplate>
                                <%#: GetLanguages((IEnumerable<World.Data.Language>)Eval("Languages")) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" /> 
                        <asp:TemplateField runat="server">
                            <ItemTemplate>
                                <asp:Image runat="server" ImageUrl='<%# ConvertToBase64((byte[])Eval("Flag")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>                                       
                    </Columns>

                    <EmptyDataTemplate>
                        <p>Empty countries list recieved.</p>
                    </EmptyDataTemplate>
                    
                    <PagerSettings FirstPageText="First" LastPageText="Last" 
                        PageButtonCount="5" Position="Bottom" NextPageText="Next" 
                        PreviousPageText="Previous" Mode="NumericFirstLast" />
                </asp:GridView>
                
            </div>            
          
            <div class="span2">
                <h3 class="text-center">Towns:</h3>
                
                <asp:ListView 
                    ID="TownsListView" 
                    
                    runat="server" 
                    DataSourceID="TownsDataSource" 
                    DataKeyNames="Id" 
                    ItemType="World.Data.Town">

                    <LayoutTemplate>
                            <ul class="unstyled" runat="server">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </ul>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <li runat="server"><span>Name: </span> <%#: Item.Name %></li>
                    </ItemTemplate>

                    <SelectedItemTemplate>
                        <li class="selected-town"><%#: Eval("Name") %></li>
                    </SelectedItemTemplate>

                    <EmptyDataTemplate>
                        <li>Empty towns list recieved from server.</li>
                    </EmptyDataTemplate>

                    <EmptyItemTemplate>
                        <li>(empty town name)</li>
                    </EmptyItemTemplate>
                    
                </asp:ListView>                

                <asp:DataPager ID="TownsListPager" runat="server" 
                    PagedControlID="TownsListView" PageSize="5">
                    <Fields>
                        <asp:NumericPagerField />                       
                    </Fields>
                </asp:DataPager>
                </div>
        </div>         
        
       
    </form>
</body>
</html>
