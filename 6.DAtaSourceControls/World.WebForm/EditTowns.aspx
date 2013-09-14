<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTowns.aspx.cs" Inherits="World.WebForm.EditTowns" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Towns</title>

    <script src="scripts/jquery-2.0.3.min.js"></script>
    <link href="scripts/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="styles/editTowns.css" rel="stylesheet" />

    <link href="scripts/css/bootstrap.css" rel="stylesheet" />
    <script src="scripts/js/bootstrap.js"></script>
</head>
<body>
    <form id="editTowns" runat="server" class="container-fluid text-center" >
        <div class="row-fluid text-center" >
            <div class="page-header">
                <h1>Edit Towns Page</h1>
            </div>
        </div>   

        <asp:EntityDataSource 
            ID="CountriesDataSource"
            runat="server" ConnectionString="name=WorldEntities" DefaultContainerName="WorldEntities"
            EntitySetName="Countries"
            EnableFlattening="false"/> 
        
        <asp:EntityDataSource 
            ID="TownsDataSource"
            ConnectionString="name=WorldEntities" DefaultContainerName="WorldEntities" EntitySetName="Towns" Include="Country"
            runat="server" EnableFlattening="false" EnableUpdate="true" EnableInsert="true" AutoSort="true" 
            EnableDelete="true" OnDeleting="TownsDataSource_Deleting"
            Where="it.CountryId=@CountryId" >
            <WhereParameters>
                <asp:ControlParameter Name="CountryId" Type="Int32" ControlID="CountriesDropDownList" />
            </WhereParameters>
        </asp:EntityDataSource>
        
        <div class="row-fluid">
            <div class="span4">
                <asp:Label ID="LabelForCountriesList" AssociatedControlID="CountriesDropDownList" Text="Select Country" runat="server"></asp:Label>
               
                <asp:DropDownList ID="CountriesDropDownList" DataSourceID="countriesDataSource" 
                    DataTextField="Name" DataValueField="Id" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="" Text="(No Country selected)"></asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <asp:ListView runat="server" 
                DataSourceID="TownsDataSource" DataKeyNames="Id" 
                ItemType="World.Data.Town" 
                ID="TownsListView">
                <LayoutTemplate>
                    <table runat="server" id="placeHolderContainer" class="table span6">
                        <tr runat="server">
                            <th runat="server">Town Id</th>
                            <th runat="server">Town Name</th>
                            <th runat="server">In Country</th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">
                        </tr>
                        <tr runat="server" id="emptyItemPlaceholder"></tr>
                        <tr runat="server">
                           <td runat="server" colspan="3">
                                <asp:Button ID="InsertButtonShow" Text="Show/Hide Insert" 
                                    runat="server" OnClick="InsertButtonShow_Click" CssClass="btn-mini btn"/>
                           </td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <asp:DataPager ID="TownsListPager" PagedControlID="TownsListView"  PageSize="10" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowNextPageButton="false" RenderDisabledButtonsAsLabels="true" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"/>
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:ValidationSummary Id="SummaryError" runat="server" EnableClientScript="false" CssClass="warning"/>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%#: Item.Id %></td>
                        <td><%#: Item.Name %></td>
                        <td><%#: Item.Country.Name %></td>
                        <td>
                            <asp:Button CommandName="Edit" Text="Edit" runat="server" CssClass="btn-mini btn"/>
                            <asp:Button ID="DeleteButton" CommandName="Delete" Text="X" runat="server" CssClass="btn-mini btn"/>
                        </td>
                    </tr>
                </ItemTemplate>

                <EditItemTemplate>
                    <tr>
                        <td><%#: Item.Id %></td>
                        <td>
                            <asp:TextBox runat="server" ID="EditTownNameTextBox" Text='<%# BindItem.Name %>' />
                            <asp:RequiredFieldValidator ControlToValidate="EditTownNameTextBox" runat="server"  
                                ErrorMessage="Required Field!" 
                                Text="*"
                                EnableClientScript="false"/>
                            <asp:RegularExpressionValidator ControlToValidate="EditTownNameTextBox" runat="server" 
                                ValidationExpression="[A-Z][A-Za-z'\s]{0,100}" 
                                ErrorMessage="Must start with capital letter!<br/> 1 to 100 letters long. Only letters, space and ' allowed!"
                                Text="*"
                                ToolTip="Error"
                                CssClass="warning"
                                EnableClientScript="false" />
                        </td>
                        <td>
                            <asp:DropDownList runat="server" DataSourceID="CountriesDataSource" ID="CountriesSelectDropDownList"
                                DataValueField="Id" DataTextField="Name" SelectedValue='<%# BindItem.CountryId %>'>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CountriesSelectDropDownList"
                                ErrorMessage="Required Field" Text="*" EnableClientScript="false"/>
                        </td>
                        <td>
                            <asp:Button ID="UpdateButton" CommandName="Update" Text="Update" runat="server" CssClass="btn-mini btn"/>
                            <asp:Button ID="CancelButton" CommandName="Cancel" Text="Cancel" runat="server" CssClass="btn-mini btn"/>
                        </td>
                    </tr>
                </EditItemTemplate>

                <EmptyDataTemplate>
                    <div runat="server" class="span4">
                        <p runat="server">Empty towns list.</p>
                        <asp:Button runat="server" ID="ShowInsertOnEmptyDataButton" OnClick="InsertButtonShow_Click" CssClass="btn-mini btn" Text="Show Insert"/>
                    </div>
                </EmptyDataTemplate>

                <InsertItemTemplate>
                    <tr runat="server">
                        <td runat="server">(Autogenerated)</td>
                        <td runat="server">
                            <asp:TextBox runat="server" ID="InsertTownNameTextBox" Text='<%# BindItem.Name %>' />
                            <asp:RequiredFieldValidator ControlToValidate="InsertTownNameTextBox" runat="server"  
                                ErrorMessage="Required Field!" 
                                Text="*"
                                EnableClientScript="false"/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="InsertTownNameTextBox" runat="server" 
                                ValidationExpression="[A-Z][A-Za-z'\s]{0,100}" 
                                ErrorMessage="Start with capital! 1 to 100 long. letters, space and ' allowed!" 
                                ToolTip="Start with capital! 1 to 100 long. letters, space and ' allowed!"
                                Text="*"
                                EnableClientScript="false" />
                        </td>
                        <td runat="server">
                            <asp:DropDownList runat="server" DataSourceID="CountriesDataSource" ID="SelectCountryForInsertDropDownList"
                                DataValueField="Id" DataTextField="Name" SelectedValue='<%# BindItem.CountryId %>' >
                                <asp:ListItem Value='5' Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td runat="server">
                            <asp:Panel runat="server">
                                <asp:Button ID="InsertButton" CommandName="Insert" Text="Add" runat="server" CssClass="btn-mini btn" />
                            </asp:Panel>
                        </td>
                    </tr>
                </InsertItemTemplate>
            </asp:ListView> 
            
        </div>
                
        <a href="World.aspx" class="btn btn-primary">Back To main</a>

    </form>
</body>
</html>
