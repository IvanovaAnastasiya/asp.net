<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Books</h1>    
    <asp:ListView ID="BooksRepeater"
        runat="server"
        ItemType="Library.Models.Category"
        SelectMethod="BooksRepeater_GetData">
        <LayoutTemplate>
            <ul >
                <li id="itemPlaceholder" runat="server"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
                <h3><%#: Item.Name %></h3>
                <div>
                    <ul>
                        <asp:Repeater 
                            ID="BooksInCategory" 
                            DataSource=<%# Item.Books %> 
                            runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href="BookDetails.aspx?bookId=<%#Eval("Id") %>"><span>"<%# Eval("Title") %>"</span><span class="text-italic"><%#" by " + Eval("Author") %></span></a>
                                </li>
                            </ItemTemplate>                        
                        </asp:Repeater>
                    </ul>
                </div>
            </li>
        </ItemTemplate>
        <EmptyDataTemplate>
            <h3>No books in this category</h3>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>
