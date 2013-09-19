<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header clearfix">
        <div class="span3">
            <h1>Books</h1>
        </div>
        <div class="search-button pull-right">
            <div class="form-search">
                <div class="input-append">
                    <asp:TextBox runat="server" 
                        Id="TextBoxSearchQuery"
                        CssClass="span3 search-query"/>
                    <asp:LinkButton runat="server" 
                        ID="SearchButton" 
                        OnClick="SearchButton_Click"
                        CssClass="btn" 
                        Text="Search"/>
                </div>
            </div>
        </div>
    </div>

    <asp:ListView ID="BooksRepeater"
        runat="server"
        ItemType="Library.Models.Category"
        SelectMethod="BooksRepeater_GetData">
        <LayoutTemplate>
            <ul class="container clearfix">
                <li id="itemPlaceholder" runat="server"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li class="span3">
                <h3><%#: Item.Name %>
                    
                </h3>
                <div class="category-thumbnail">
                    <asp:ListView
                        ID="BooksInCategory"
                        DataSource="<%# Item.Books %>"
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
                            <span>No books in this category yet.</span>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </li>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
