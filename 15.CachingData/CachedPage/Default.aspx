<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CachedPage._Default" %>

<%@ Register Src="~/CachableControl.ascx" TagPrefix="uc1" TagName="CachableControl" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="hero-unit">
        <h1>ASP.NET</h1>
        <p class="lead">Caching demo.</p>        
        <p><a href="About.aspx" class="btn btn-info btn-large">Go To Cached page</a> 
    </div>        
    <div>
        <uc1:CachableControl runat="server" ID="CachableControl" CacheLength="150"/>
    </div>

</asp:Content>
