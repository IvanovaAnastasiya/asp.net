<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CachedPage.About" %>
<%@ OutputCache CacheProfile="AboutPageProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <h1><%: Title %></h1>
        <p class="lead">Your app description page.</p>
    </header>

    <div class="row-fluid">
        <div class="span12 hero-unit">
            <p>This page has been cached at <%= DateTime.Now.ToLocalTime() %></p>
        </div>
    </div>

</asp:Content>
