<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuControl.ascx.cs" Inherits="MenuControl.MenuControl" %>
<asp:DataList runat="server" 
    ID="DataListMenu">
    <ItemTemplate>
        <asp:HyperLink runat="server" NavigateUrl='<%#: Eval("Url") %>' Text='<%#: Eval("Title") %>'/>
    </ItemTemplate>
    <HeaderTemplate>
        <h4>Menu</h4>
    </HeaderTemplate>
    <SelectedItemStyle Font-Bold="true" />
</asp:DataList>