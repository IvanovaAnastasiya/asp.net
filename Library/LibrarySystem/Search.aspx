<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Library.Search" %>
<asp:Content ID="ContentSearch" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1>Search results for Query <%: Request.Params["query"] %></h1>
    </div>
    <div class="row">
        <asp:ListView
            ID="BooksInCategory"
            SelectMethod="BooksInCategory_GetData"
            runat="server">
            <ItemTemplate>
                <li>
                    <a href="Registered/BookDetails.aspx?bookId=<%#: Eval("Id") %>">
                        <span>"<%#: Eval("Title") %>"</span>
                        <span class="text-italic"><%#:" by " + Eval("Author") %></span>
                    </a>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul>
                    <li id="itemPlaceholder" runat="server"></li>
                </ul>
            </LayoutTemplate>
            <EmptyDataTemplate>
                <span>No books found.</span>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    <a href="Default.aspx" class="btn btn-mini btn-info">Back to main</a>
</asp:Content>
