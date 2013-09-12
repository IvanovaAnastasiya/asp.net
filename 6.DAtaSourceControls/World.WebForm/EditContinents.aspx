<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditContinents.aspx.cs" Inherits="World.WebForm.EditContinents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Continents</title>
    <link href="scripts/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="scripts/css/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/jquery-2.0.3.min.js"></script>
    <script src="scripts/js/bootstrap.min.js"></script>
    <link href="styles/editContinents.css" rel="stylesheet" />
</head>
<body class="prettyprint">
    <form id="editContinentsForm" runat="server" class="active container-fluid"> 
        <asp:EntityDataSource runat="server"
            ConnectionString="name=WorldEntities"
            DefaultContainerName="WorldEntities"
            EntitySetName="Continents"
            ID="ContinentsDataSource"/>

        <div class="row-fluid">
            <h2 class="text-center span12 page-header large">Continents:</h2>   
        </div>        
        <div class="row-fluid text-center">           
            <%--ListBox escapes its content--%>
            <asp:ListBox runat="server"
                DataSourceID="ContinentsDataSource"
                DataTextField="Name" DataValueField="Id"
                AutoPostBack="true" ID="SelectedContinent"
                SelectionMode="Single"
                Rows="10"
                OnSelectedIndexChanged="SelectedContinent_SelectedIndexChanged" CssClass="span2 primary-text" />
            <%-- <asp:LoginView runat="server"></asp:LoginView>--%>       

            <asp:Button runat="server" ID="DeleteContintent" OnClick="DeleteContintent_Click" Text="Delete Selected Continent" CssClass="btn-danger btn"/> 
        </div>
        <div class="row-fluid text-center">
            <span class="text-error span12"   runat="server" id="ErrorMessageHolder" ></span>
        </div>
        
        <fieldset class="row-fluid text-center">
            <legend>Edit selected continent</legend>
            <asp:TextBox runat="server" ID="EditContinentName"></asp:TextBox>         
            <asp:Button runat="server" ID="EditContinent" OnClick="EditContinent_Click" Text="Edit Selected Continent" CssClass="btn-primary btn"/> 
        </fieldset>

        <fieldset class="row-fluid text-center">
            <legend>Add new Continent</legend>
            <asp:Label AssociatedControlID="NewContinentName" runat="server">New Continent Name</asp:Label>
            <asp:TextBox ID="NewContinentName" runat="server" Columns="20"></asp:TextBox>
            <div class="row-fluid text-center">
                <asp:Button runat="server" ID="AddNewContinent" OnClick="AddNewContinent_Click" Text="Add new Continent" CssClass="btn-primary btn" />
            </div>
        </fieldset>

        <a href="World.aspx" class="btn btn-info">Back to main page</a>
    </form>
    
</body>
</html>
