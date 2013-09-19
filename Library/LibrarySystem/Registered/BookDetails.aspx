<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Library.BookDetails" %>
<asp:Content ID="ContentBookDetails" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Book Details</h1>
    <h3 runat="server" Id="LabelTitle" class="well"/>
    <h4 class="text-muted"><asp:Literal runat="server" ID="LabelAuthor" Mode="Encode"/></h4>
    <h5><p class="text-italic" id="BookISBN" runat="server"></p></h5>
    <p class="text-italic" ><asp:Literal runat="server" Id="BookUrl" /></p>
    <p id="BookDescription" runat="server"></p>
    <a href="../Default.aspx">Back to books</a>
</asp:Content>
