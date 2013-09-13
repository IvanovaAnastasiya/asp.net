<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCountries.aspx.cs" Inherits="World.WebForm.EditCountries" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Countries</title>
    <link href="scripts/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="scripts/css/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/editCountries.css" rel="stylesheet" />

    <script src="scripts/jquery-2.0.3.min.js"></script>
    <script src="scripts/js/bootstrap.min.js"></script>

    <link href="styles/world.css" rel="stylesheet" />
</head>
<body class="container-fluid">
    <div class="row-fluid text-center" >
            <div class="page-header">
                <h1>Edit Countries Page</h1>
            </div>
    </div>   
    <form id="editCountriesForm" runat="server">
          
        <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Continents"
            ID="ContinentsDataSource" />

        <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Languages"
            ID="LanguagesDataSource" />

        <asp:EntityDataSource ID="CountriesDataSource"
            runat="server" ConnectionString="name=WorldEntities" DefaultContainerName="WorldEntities"
            EntitySetName="Countries" Include="Languages, Continent" 
            Where="it.ContinentId=@ContinentId"
            EnableFlattening="false"
            EnableDelete="true"
            EnableInsert="true"
            EnableUpdate="true"
            OnDeleting="CountriesDataSource_Deleting"
            OnInserted="CountriesDataSource_Inserted">
            <WhereParameters>
                <asp:ControlParameter Name="ContinentId" Type="Int32" ControlID="SelectedContinent" />
            </WhereParameters>
        </asp:EntityDataSource>
         
        <div class="row-fluid clearfix">
            <div class="span3">
                <asp:DropDownList ID="SelectedContinent" DataSourceID="ContinentsDataSource" 
                DataTextField="Name" DataValueField="Id" runat="server" AutoPostBack="true">
            </asp:DropDownList>
            </div>

            <asp:ListView ID="CountriesListView" DataSourceID="CountriesDataSource" 
                DataKeyNames="Id" runat="server" ItemType="World.Data.Country">
                <LayoutTemplate>
                    <table runat="server" class="table span9"> 
                        <tr runat="server">
                            <th>Country Id</th>
                            <th>Country Name</th>
                            <th>Population</th>
                            <th>Continent</th>
                            <th>Languages</th>                            
                            <th>Flag</th>
                            <th>Actions</th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">

                        </tr>
                        <tr runat="server">
                            <td colspan="6">
                                <asp:Button runat="server" ID="ShowHideInsertCountry" Text="Toggle Insert" CssClass="btn btn-mini" OnClick="ToggleInsertField"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:ValidationSummary runat="server" EnableClientScript="false"
                                     ShowValidationErrors="true"  ID="ValidationSummary_CountryEdit" ValidationGroup="CountryEdit"/>
                                <asp:ValidationSummary runat="server" EnableClientScript="false"
                                     ShowValidationErrors="true"  ID="ValidationSummary_CountryInsert" ValidationGroup="CountryInsert"/>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Item.Id %></td>
                        <td><%# Item.Name %></td>
                        <td><%# Item.Population %></td>
                        <td><%# Item.Continent.Name %></td>
                        <td><%# GetLanguages(Item.Languages)%> <a href="EditLanguages.aspx?countryId=<%# Item.Id %>" class="btn-link"><sup class="text-info">Change..</sup></a></td>
                        <td>
                            <asp:Image runat="server" ImageUrl='<%# ConvertToBase64((byte[])Item.Flag)%>'/>
                        </td>
                        <td>
                            <asp:Button runat="server" ID="EditCountryButton" CommandName="Edit" Text="Edit" CssClass="btn btn-mini" />
                            <asp:Button runat="server" ID="DeleteCountryButton" CommandName="Delete" Text="X" CssClass="btn btn-mini btn-danger"/>
                        </td>
                    </tr>
                </ItemTemplate>

                <EditItemTemplate>
                    <tr>
                        <td class="text-box-small"><%# Item.Id %></td>
                        <td>
                            <asp:TextBox Id="CountryNameEditTextBox" runat="server" Text='<%# BindItem.Name %>' CssClass="text-box-small"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_CoutryNameEditTextBox" ValidationGroup="CountryEdit" ControlToValidate="CountryNameEditTextBox" 
                                ErrorMessage="Required Field" Text="*" runat="server" EnableClientScript="false"/>
                            <asp:RegularExpressionValidator runat="server" ValidationGroup="CountryEdit" 
                                ControlToValidate="CountryNameEditTextBox" 
                                ValidationExpression="[A-Z][A-Za-z'\s-]{0,49}"
                                ErrorMessage="Name must start with capital letter!<br/>Allowed symbols: letters,', ,-<br/>Must be 1 to 50 symbols long!"
                                Text="*" EnableClientScript="false" ID="RegularExpressionValidator_CoutryNameEditTextBox"/>
                        </td>
                        <td>
                            <asp:TextBox ID="CoutryPopulationEditTextBox" runat="server" Text='<%# BindItem.Population %>' CssClass="text-box-small"/>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator_CoutryPopulationEditTextBox" 
                                ValidationGroup="CountryEdit" 
                                ControlToValidate="CountryNameEditTextBox" 
                                ErrorMessage="Required Field" Text="*"
                                runat="server" EnableClientScript="false"/>
                            <asp:CompareValidator ID="CompareValidator_CountryPopulationEditTextbox" runat="server"
                                ControlToValidate="CoutryPopulationEditTextBox" CultureInvariantValues="true" 
                                ValidationGroup="CountryEdit"
                                EnableClientScript="false" 
                                ErrorMessage="Must be smaller than 2147000000" 
                                Text="*"
                                Operator="LessThan"
                                ValueToCompare='2147000000'
                                Type="Integer"/>
                            <asp:RegularExpressionValidator 
                                ID="RegularExpressionValidator_CoutryPopulationEditTextBox" 
                                runat="server" ValidationGroup="CountryEdit" 
                                ControlToValidate="CoutryPopulationEditTextBox" 
                                ValidationExpression="[\d]{1,10}"
                                Text="*"
                                ErrorMessage="Population must be a number!No more than 10 digits!"
                                EnableClientScript="false"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="CountryEditContinentSelectDropDownList" runat="server" DataSourceID="ContinentsDataSource" 
                                DataTextField="Name" DataValueField="Id" SelectedValue='<%# BindItem.ContinentId %>' CssClass="text-box-meduim" />
                        </td>
                        <td>
                            <asp:Label Text='<%# GetLanguages(Item.Languages) %> ' runat="server"/>
                        </td>
                        <td>
                            <asp:FileUpload runat="server" />
                        </td>
                        <td>
                            <asp:Button CommandName="Update" runat="server" Text="Update"  CssClass="btn btn-mini" ValidationGroup="CountryEdit" />
                            <asp:Button CommandName="Cancel" runat="server" Text="Cancel"  CssClass="btn btn-mini" />
                            <asp:Button CommandName="ChangeFlag" runat="server" Text="ChangeFlag" CssClass="btn btn-mini" 
                                CommandArgument="<%# Item.Id %>" ID="ChangeFlagButton" OnCommand="ChangeFlagButton_Command"/>
                        </td>
                    </tr>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <tr runat="server">
                        <td class="text-box-small">(Autogenerated)</td>
                        <td>
                            <asp:TextBox Id="CountryNameInsertTextBox" runat="server" Text='<%# BindItem.Name %>' CssClass="text-box-small"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_CoutryNameInsertTextBox" 
                                ValidationGroup="CountryInsert" 
                                ControlToValidate="CountryNameInsertTextBox" 
                                ErrorMessage="Required Field" Text="*" runat="server" EnableClientScript="false"/>
                            
                            <asp:RegularExpressionValidator runat="server" 
                                ValidationGroup="CountryInsert" 
                                ControlToValidate="CountryNameInsertTextBox" 
                                ValidationExpression="[A-Z][A-Za-z'\s-]{0,49}"
                                ErrorMessage="Name must start with capital letter!<br/>Allowed symbols: letters,', ,-<br/>Must be 1 to 50 symbols long!"
                                Text="*" EnableClientScript="false" 
                                ID="RegularExpressionValidator_CoutryNameInsertTextBox"/>
                        </td>
                        <td>
                            <asp:TextBox ID="CoutryPopulationInsertTextBox" runat="server" Text='<%# BindItem.Population %>' CssClass="text-box-small"/>
                            
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator_CoutryPopulationInsertTextBox" 
                                ValidationGroup="CountryInsert" 
                                ControlToValidate="CoutryPopulationInsertTextBox" 
                                ErrorMessage="Required Field" Text="*"
                                runat="server" EnableClientScript="false"/>
                            
                            <asp:CompareValidator ID="CompareValidator_CountryPopulationInsertTextbox" runat="server"
                                ControlToValidate="CoutryPopulationInsertTextBox" CultureInvariantValues="true" 
                                ValidationGroup="CountryInsert"
                                EnableClientScript="false" 
                                ErrorMessage="Must be smaller than 2147000000" 
                                Text="*"
                                Operator="LessThan"
                                ValueToCompare='2147000000'
                                Type="Integer"/>
                            
                            <asp:RegularExpressionValidator 
                                ID="RegularExpressionValidator_CoutryPopulationInsertTextBox" 
                                runat="server" ValidationGroup="CountryInsert" 
                                ControlToValidate="CoutryPopulationInsertTextBox" 
                                ValidationExpression="[\d]{1,10}"
                                Text="*"
                                ErrorMessage="Population must be a number!No more than 10 digits!"
                                EnableClientScript="false"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="CountryEditContinentSelectDropDownList" runat="server" DataSourceID="ContinentsDataSource" 
                                DataTextField="Name" DataValueField="Id" SelectedValue='<%# BindItem.ContinentId %>' CssClass="text-box-meduim" />
                        </td>
                        <td runat="server">
                                Add languages with edit
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" CommandName="insert" runat="server" Text="Add" 
                                CssClass="btn btn-mini" ValidationGroup="CountryInsert"/>
                        </td>
                    </tr>
                </InsertItemTemplate>

                <EmptyDataTemplate >
                    <div class="text-center span6">
                        <p>Empty countries list </p>
                        <asp:Button runat="server" OnClick="ToggleInsertField"
                             Class="btn btn-mini" Text="Toggle Inser Form"/>
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>            
        </div>
        <div class="error-message" id="error-container">
            <asp:Literal ID="ErrorMessage" runat="server" ViewStateMode="Disabled"/>
        </div>

        <div class="row-fluid text-center">
            <a href="World.aspx" class="btn btn-primary">Back to main</a>
        </div> 
    </form>
</body>
</html>
