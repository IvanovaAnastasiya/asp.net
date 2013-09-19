<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineDatingSystem._Default" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="hero-unit">
        <h1>Online Dating System</h1>
        <p class="lead">Online Dating System is a web application which demonstrates the use of ASP.NET Identity.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
    </div>
    <fieldset>
        <legend>Filter</legend>
        <asp:Label ID="LabelAgeFilter" runat="server" AssociatedControlID="TextBoxAgeFilterFrom">Age is between</asp:Label>

        <asp:TextBox ID="TextBoxAgeFilterFrom" runat="server" MaxLength="3"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidatorAgeFilterFrom" runat="server" ControlToValidate="TextBoxAgeFilterFrom" ErrorMessage="Value should be an integer." Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
        <asp:Label ID="LabelAgeFilterTo" runat="server" AssociatedControlID="TextBoxAgeFilterTo" Text="and"></asp:Label>
        <asp:TextBox ID="TextBoxAgeFilterTo" runat="server" MaxLength="3"></asp:TextBox>

        <asp:CompareValidator ID="CompareValidatorAgeFilterTo" runat="server" ControlToValidate="TextBoxAgeFilterTo" ErrorMessage="Value should be an integer." Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>

        <asp:Label ID="LabelSexFilter" runat="server" AssociatedControlID="DropDownListSexFilter">Sex is</asp:Label>
        <asp:DropDownList ID="DropDownListSexFilter" runat="server">
            <asp:ListItem Value="A">All</asp:ListItem>
            <asp:ListItem Value="M">Male</asp:ListItem>
            <asp:ListItem Value="F">Female</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="LabelCityFilter" runat="server" AssociatedControlID="DropDownListCityFilter">City is</asp:Label>
        <asp:DropDownList ID="DropDownListCityFilter" runat="server"
            DataValueField="Id" DataTextField="Name">
        </asp:DropDownList>
        <asp:Button ID="ButtonApplyFilter" runat="server" Text="Apply" OnClick="ButtonApplyFilter_Click" />
        <asp:Button ID="ButtonRemoveFilter" runat="server" Text="Remove" OnClick="ButtonRemoveFilter_Click" />
    </fieldset>
    <fieldset>
        <legend>Users</legend>
        <asp:UpdatePanel ID="UpdatePanelUsers" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <asp:GridView ID="GridViewUsers" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"
                    ItemType="OnlineDatingSystem.Models.ApplicationUser" OnPageIndexChanging="GridViewUsers_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Id" Visible="False" />

                        <asp:TemplateField HeaderText="Photo">
                            <ItemTemplate>
                                <img src='data:image/png;base64,<%# Item.Photo != null ? Convert.ToBase64String(Item.Photo) : string.Empty %>' alt="photo" height="50" width="100" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Username" SortExpression="Username">
                            <ItemTemplate>
                                <%#: Item.UserName%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Age" SortExpression="BirthDate">
                            <ItemTemplate>
                                <%#: GetAge(Item.BirthDate)%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sex">
                            <ItemTemplate>
                                <%#: Item.Sex%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <%#: Item.City.Name%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <%#: Item.Country.Name%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <%#: Item.Description%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Messages.aspx?id={0}" Text="Send message" />

                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UserDetails.aspx?id={0}" Text="Details" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
    </fieldset>
</asp:Content>
