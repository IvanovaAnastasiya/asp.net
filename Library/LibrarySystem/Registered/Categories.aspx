<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Library.Registered.Categories" %>
<asp:Content ID="ContentCategories" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="span12">
            <h1>Edit Categories</h1>
        </div>
        <div class="span12">
            <asp:GridView runat="server"
                Id="CategoriesGridView"
                AutoGenerateColumns="false"
                DataKeyNames="Id"
                AllowSorting="true"
                AllowPaging="true"
                PageSize="5"
                SelectMethod="CategoriesGridView_GetData"
                DeleteMethod="CategoriesGridView_DeleteItem"
                ItemType="Library.Models.Category">
                <Columns>
                    <asp:BoundField HeaderText="Categories" 
                        SortExpression="Name" 
                        DataField="Name" />
                    <asp:TemplateField HeaderText="Actions" >
                        <ItemTemplate>
                            <asp:LinkButton runat="server" 
                                ID="EditButton" 
                                OnCommand="EditButton_Command"
                                CommandArgument='<%# Item.Id %>'
                                Text="Edit"
                                CssClass="btn btn-mini" />
                            <asp:LinkButton runat="server"
                                Command="Delete"
                                CommandArgument='<%# Item.Id %>'
                                OnCommand="DeleteButton_Command"
                                ID="DeleteButton"
                                Text="Delete"
                                CssClass="btn btn-mini" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
            <div class="row">
                <asp:Button runat="server"
                    ID="InsertButton"
                    OnClick="InsertButton_Click" 
                    Text="Add New" 
                    CssClass="btn btn-mini"/>
            </div>

            <asp:Panel CssClass="panel" Runat="server" ID="EditCategoryPanel" Visible="false">
                <h2>Edit category</h2>
                <asp:HiddenField ID="EditCategoryId" 
                    runat="server" />

                <asp:Label runat="server"
                    AssociatedControlID="CategoryEditTextBox" 
                    Text="Category: " />
                
                <asp:TextBox runat="server"
                    Id="CategoryEditTextBox"/>
                <div>
                    <asp:Button runat="server"
                        ID="ButtonSave"
                        OnClick="ButtonSave_Click"
                        Text="Save" 
                        class="btn btn-mini"/>
                    <asp:Button runat="server"
                        ID="ButtonCancel"
                        OnClick="CancelButton_Click"
                        Text="Cancel" 
                        class="btn btn-mini"/>
                </div>
            </asp:Panel>

            <asp:Panel runat="server"
                ID="DeleteConfirmationPanel"
                Visible="false">
                <h2>Confirm category deletion? </h2>
                <div>
                    <asp:Button runat="server"
                        ID="ButtonYes"
                        CommandArgument="Yes"
                        Command="HandleDeleteConfirmation"
                        OnCommand="HandleConfirmationCommand"
                        Text="Yes" 
                        class="btn btn-mini"/>
                    <asp:Button runat="server"
                        ID="ButtonNo"
                        CommandArgument="No"
                        Command="HandleDeleteConfirmation"
                        OnCommand="HandleConfirmationCommand"
                        Text="No" 
                        class="btn btn-mini"/>
                </div>
            </asp:Panel>

            <asp:Panel runat="server"
                ID="AddCategoryPanel" Visible="false">
                <h2>Add new category</h2>

                 <asp:Label runat="server"
                    AssociatedControlID="CategoryAddTextBox" 
                    Text="Category: " />
                
                <asp:TextBox runat="server"
                    Id="CategoryAddTextBox"/>
                <div>
                    <asp:Button runat="server"
                        ID="AddCategoryButton"
                        OnClick="AddCategoryButton_Click"
                        Text="Save" 
                        class="btn btn-success btn-mini"/>
                    <asp:Button runat="server"
                        ID="CancelAddCategoryButton"
                        OnClick="CancelAddCategoryButton_Click"
                        Text="Cancel" 
                        class="btn btn-mini"/>
                </div>
            </asp:Panel>
        </div>
        <div class="back-link">
            <a href="../Default.aspx">Back to books</a>
        </div>
    </div>
</asp:Content>
