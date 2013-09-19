<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBooks.aspx.cs" Inherits="Library.Registered.EditBooks" %>
<asp:Content ID="ContentEditBooks" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"></div>
     <div class="row">
        <h1>Edit Books</h1>
    </div>   

        <asp:GridView runat="server"
            ID="BooksGridView"
            AutoGenerateColumns="false"
            ItemType="Library.Models.Book"
            DataKeyNames="Id"
            SelectMethod="BooksGridView_GetData"
            AllowPaging="true"
            PageSize="4"
            PagerSettings-Visible="true"
            AllowSorting="true"
            CssClass="edit-books-table">
            <Columns>

                <asp:BoundField HeaderText="Title" 
                    SortExpression="Title"
                    DataField="Title"
                    ItemStyle-Wrap="false" 
                    ItemStyle-CssClass="books-cell"/>

               <asp:BoundField HeaderText="Author" 
                    SortExpression="Author"
                    DataField="Author"
                    ItemStyle-Wrap="true" 
                    ItemStyle-CssClass="books-cell"/>

                <asp:BoundField HeaderText="ISBN" 
                    SortExpression="ISBN"
                    DataField="ISBN"
                    ItemStyle-CssClass="books-cell"/>

                <asp:BoundField HeaderText="Web Site" 
                    SortExpression="Url"
                    DataField="Url"
                    ItemStyle-CssClass="books-cell"/>

                <asp:BoundField HeaderText="Category" 
                    SortExpression="CategoryId"
                    DataField="Category.Name" 
                    ItemStyle-CssClass="books-cell"/>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button runat="server"
                            Id="EditBookButton"
                            OnCommand="EditBookButton_Command"
                            CommandArgument='<%# Item.Id %>'
                            Text="Edit"
                            ToolTip="Edits the book shown on the row"
                            CssClass="btn btn-mini" />

                        <asp:Button runat="server"
                            Id="DeleteBookButton"
                            OnCommand="DeleteBookButton_Command"
                            CommandArgument='<%# Item.Id %>'
                            Text="Delete"
                            ToolTip="Deletes the book shown on the row"
                            CssClass="btn btn-mini" />
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            
        </asp:GridView>
          
        <asp:Button runat="server"
            Id="OpenInsertForm"
            OnClick="OpenInsertForm_Click" 
            Text="Add new book"
            CssClass="btn btn-mini"/>

        <asp:Panel ID="AddBookPanel"
            runat="server" Visible="false"
            CssClass="form-horizontal">
            <h2>Add new book</h2>

            <div class="control-group">
                <asp:Label runat="server" 
                    AssociatedControlID="NewBookTitle"
                    CssClass="control-label">Title:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="NewBookTitle" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="NewBookAuthor"
                    CssClass="control-label">Author:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="NewBookAuthor" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="NewBookISBN"
                    CssClass="control-label">ISBN:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="NewBookISBN" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="NewBookUrl"
                    CssClass="control-label">Web Site:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="NewBookUrl" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="NewBookDescription"
                    CssClass="control-label">Description:</asp:Label>
                <div class="controls">
                    <textarea rows="8"
                        cols="10"
                        Id="NewBookDescription"
                        runat="server" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="NewBookCategoryDropDown"
                    CssClass="control-label">Category:</asp:Label>
                <div class="controls">
                   <asp:DropDownList runat="server"
                       Id="NewBookCategoryDropDown"
                       DataTextField="Name"
                       DataValueField="Id" />
                </div>
            </div>

            <asp:Button runat="server" 
                ID="CreateNewBookButton"
                OnClick="CreateNewBookButton_Click"
                Text="Add New Book"
                CssClass="btn btn-success btn-mini" />

            <asp:Button runat="server"
                Id="CancelNewBookCreating"
                OnClick="CancelNewBookCreating_Click"
                Text="Cancel"
                CssClass="btn btn-mini" />
        </asp:Panel>

        <asp:Panel ID="EditBookPanel"
            runat="server" Visible="false"
            CssClass="form-horizontal">
            <h2>Edit new book</h2>

            <div class="control-group">
                <asp:Label runat="server" 
                    AssociatedControlID="EditBookTitle"
                    CssClass="control-label">Title:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="EditBookTitle" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="EditBookAuthor"
                    CssClass="control-label">Author:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="EditBookAuthor" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="EditBookISBN"
                    CssClass="control-label">ISBN:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="EditBookISBN" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="EditBookUrl"
                    CssClass="control-label">Web Site:</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server"
                        ID="EditBookUrl" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="EditBookDescription"
                    CssClass="control-label">Description:</asp:Label>
                <div class="controls">
                    <textarea rows="8"
                        cols="10"
                        Id="EditBookDescription"
                        runat="server" />
                </div>
            </div>

            <div class="control-group">
                <asp:Label runat="server"
                    AssociatedControlID="EditBookCategoryDropDown"
                    CssClass="control-label">Category:</asp:Label>
                <div class="controls">
                   <asp:DropDownList runat="server"
                       Id="EditBookCategoryDropDown"
                       DataTextField="Name"
                       DataValueField="Id" />
                </div>
            </div>

            <asp:Button runat="server" 
                ID="UpdateBookBotton"
                OnClick="UpdateBookBotton_Click"
                Text="Save changes"
                CssClass="btn btn-success btn-mini" />

            <asp:Button runat="server"
                Id="CancelUpdateBook"
                OnClick="CancelUpdateBook_Click"
                Text="Cancel"
                CssClass="btn btn-mini" />
        </asp:Panel>
        
        <asp:Panel runat="server"
            Id="DeleteConfirmationPanel"
            Visible="false">
            <h2>Delete confirmation</h2>
            
             <asp:Button runat="server" 
                ID="DeleteActionConfirm"
                OnCommand="DeleteAction_Command"
                CommandArgument="Yes"
                Text="Yes"
                CssClass="btn btn-warning btn-mini" />

            <asp:Button runat="server"
                Id="DeleteActionCancel"
                OnCommand="DeleteAction_Command"
                Text="No"
                CssClass="btn btn-mini btn-info" />
        </asp:Panel> 

        <a href="../Default.aspx">Home</a>
    
</asp:Content>
