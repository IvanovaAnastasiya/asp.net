<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministratorDefault.aspx.cs" Inherits="OnlineDatingSystem.Administrator.AdministratorDefault" %>

<asp:Content ID="AdminContent" 
    ContentPlaceHolderID="MainContent" 
    runat="server">
    <fieldset>
        <legend>Admin View</legend>

        <asp:ListView ID="UsersView" runat="server" 
            ItemType="OnlineDatingSystem.Models.ApplicationUser"
            DataKeyNames="Id"
            SelectMethod="UsersView_GetData"
            DeleteMethod="UsersView_DeleteItem">
            <LayoutTemplate>
                <table class="table-bordered table span12">
                    <thead>
                        <tr>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="Id">Id</asp:LinkButton></th>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="Username">Username</asp:LinkButton></th>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="FirstName">First Name</asp:LinkButton></th>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="LastName">Last Name</asp:LinkButton></th>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="Email">@mail</asp:LinkButton></th>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="City">City</asp:LinkButton></th>
                            <th><asp:LinkButton runat="server" CommandName="Sort" 
                                CommandArgument="Country">Country</asp:LinkButton></th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="8"> Pages
                                <asp:DataPager PagedControlID="UsersView" runat="server" 
                                    PageSize="10">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                            </td>

                        </tr>
                    </tfoot>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#: Item.Id %></td>
                    <td><%#: Item.UserName %></td>
                    <td><%#: Item.FirstName %></td>
                    <td><%#: Item.LastName %></td>
                    <td><%#: Item.Email %></td>
                    <td><%#: Item.City.Name %></td>
                    <td><%#: Item.Country.Name %></td>
                    <td>
                        <a href='AdminUserEdit.aspx?userId=<%# Item.Id %>'
                            class="btn btn-mini btn-info">Edit</a>
                        <asp:Button ID="Delete" CommandName="Delete" runat="server" 
                            CssClass="btn btn-mini btn-danger" Text="X"
                            OnClientClick="return confirm('Do you want to delete ?');"/>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView> 
        <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        
        <asp:GridView ID="GridViewTestUsers"
            runat="server"
            ItemType="OnlineDatingSystem.Models.ApplicationUser" 
            DataKeyNames="Id"
            SelectMethod="GridViewTestUsers_GetData"
            UpdateMethod="GridViewTestUsers_UpdateItem"
            AutoGenerateColumns="false">
            <Columns>
                <asp:DynamicField DataField="FirstName" HeaderText="First Name" />
                <asp:CommandField ShowEditButton="true" EditText="Edit" />
            </Columns>
        </asp:GridView>
    </fieldset>
</asp:Content>
