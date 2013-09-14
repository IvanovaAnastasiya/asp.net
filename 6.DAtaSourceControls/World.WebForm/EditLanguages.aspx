<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditLanguages.aspx.cs" Inherits="World.WebForm.EditLanguages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit languages</title>
    <link href="scripts/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="scripts/css/bootstrap.css" rel="stylesheet" />
    <script src="scripts/js/bootstrap.min.js"></script>
    <script src="scripts/jquery-2.0.3.min.js"></script>
</head>
<body>
    <form id="EditLanguagesForm" runat="server" class="container-fluid">
         <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Languages"
            ID="LanguagesDataSource"/>

        <div class="row-fluid">
            <div class="page-header">
                <h1>
                    <span class="muted">Selected country: </span>
                    <strong>
                        <asp:Literal ID="CountrySelected" runat="server" /></strong>
                </h1>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                <h2 class="muted">Currently selected languages</h2>
                <asp:Repeater ID="CurrentLanguages" runat="server" ItemType="World.Data.Language">
                    <ItemTemplate>
                        <div class="">
                             <h3><%# Item.Name %>
                            <asp:LinkButton runat="server"
                                CommandName="Delete" CommandArgument="<%# Item.Id %>"
                                OnCommand="Delete_Command" Text="X" CssClass="btn btn-danger btn-mini" /></h3>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                
            </div>
            <div class="span3">
                <asp:Button ID="AddSelectedLanguages" runat="server" OnClick="AddSelectedLanguages_Click" Text="<--" CssClass="btn btn-mini btn-primary" />
                <asp:ListBox  ID="SelectLanguageListBox" runat="server"
                    DataSourceID="LanguagesDataSource"
                    DataTextField="Name" DataValueField="Id"
                    SelectionMode="Multiple" Rows="10"/>
                

                <asp:Button ID="DeleteSelectedLanguage" runat="server" OnClick="DeleteSelectedLanguage_Click" Text="Delete Selected Language FROM DATABASE" CssClass="btn btn-mini btn-danger" />
            </div>
            <div class="span3">
                <asp:TextBox ID="AddNewLanguageTextBox" runat="server" />
                <asp:Button ID="AddNewLanguageButton" runat="server" OnClick="AddNewLanguageButton_Click" CssClass="btn btn-info" Text="Add"/>
            </div>
        </div>

        <div class="error row-fluid text-error"><asp:Literal ID="ErrorMessage" runat="server" /></div>

        <div class="pager">
            <a href="EditCountries.aspx" class="btn btn-info">Back To edit Countries</a>
            <a href="World.aspx" class="btn btn-info">Back To edit World</a>
        </div>
    </form>
</body>
</html>
