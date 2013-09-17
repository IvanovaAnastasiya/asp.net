<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegisterForm.aspx.cs" Inherits="ValidationControl.UserRegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span>Username</span>
            <asp:TextBox runat="server" ID="UsernameTextBox" 
                ValidationGroup="Login" />
            <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="UsernameTextBox" 
                ErrorMessage="Required Field" Text="*"
                EnableClientScript="false" />
        </div>

         <div>
            <span>Password</span>
            <asp:TextBox runat="server" ID="PasswordTextBox" 
                TextMode="Password"  ValidationGroup="Login"  />
             <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="PasswordTextBox" 
                ErrorMessage="Required Field" Text="*" 
                EnableClientScript="false"/>
        </div>

        <div>
            <span>Repeat Password</span>
            <asp:TextBox runat="server" ID="RepeatPasswordTextBox" 
                TextMode="Password"  ValidationGroup="Login"/>
            <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="RepeatPasswordTextBox" 
                ErrorMessage="Required Field" Text="*" 
                EnableClientScript="false"/>
        </div>

        <div>
            <asp:ValidationSummary ValidationGroup="Login" 
                runat="server"/>
        </div>

        <asp:Button runat="server" ID="ValidateLoginButton" ValidationGroup="Login" OnClick="ValidateLoginButton_Click" />
    </form>
</body>
</html>
