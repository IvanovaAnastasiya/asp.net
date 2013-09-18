<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="UserRegisterForm.aspx.cs" Inherits="ValidationControl.UserRegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
            </Scripts>
        </asp:ScriptManager>
        <asp:Panel GroupingText="User" runat="server">
            <div>
                <span>Username</span>
                <asp:TextBox runat="server" ID="UsernameTextBox"
                    ValidationGroup="Login" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="UsernameTextBox" Text="*"
                    ErrorMessage="Required Field" EnableClientScript="true"
                    ValidationGroup="Login" />
            </div>

            <div>
                <span>Password</span>
                <asp:TextBox runat="server" ID="PasswordTextBox"
                    TextMode="Password"
                    ValidationGroup="Login" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="PasswordTextBox" Text="*"
                    ErrorMessage="Required Field"
                    ValidationGroup="Login" />
            </div>

            <div>
                <span>Repeat Password</span>
                <asp:TextBox runat="server" ID="RepeatPasswordTextBox"
                    TextMode="Password"
                    ValidationGroup="Login" />
                <asp:RequiredFieldValidator runat="server" ID="reqFieldV"
                    ControlToValidate="RepeatPasswordTextBox" Text="*"
                    ErrorMessage="Required Field"
                    ValidationGroup="Login" />
                <asp:CompareValidator runat="server" ControlToCompare="PasswordTextBox"
                    ControlToValidate="RepeatPasswordTextBox" Text="*"
                    Type="String" Operator="Equal" ErrorMessage="Different passwords given"
                    ValidationGroup="Login" />
            </div>

            <div>
                <asp:ValidationSummary ValidationGroup="Login"
                    runat="server" ID="ValidationSummaryLogin"
                    Font-Bold="true" DisplayMode="BulletList" />
            </div>

            <asp:Button runat="server" ID="ValidateLoginButton"
                OnClick="ValidateLoginButton_Click" Text="ValidateUser" ValidationGroup="Login" />
            <asp:Label ID="IsUserValid" runat="server" />
        </asp:Panel>

        <asp:Panel runat="server" GroupingText="Personal Info">
            <div>
                <span>First Name: </span>
                <asp:TextBox runat="server" ID="TextBoxFirstName"
                    ValidationGroup="PersonalInfo" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="TextBoxFirstName" Text="*"
                    ErrorMessage="Required Field" EnableClientScript="true"
                    ForeColor="DarkOrange"
                    ValidationGroup="PersonalInfo" />
            </div>

            <div>
                <span>Last Name: </span>
                <asp:TextBox runat="server" ID="TextBoxLastName"
                    ValidationGroup="PersonalInfo" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="TextBoxLastName" Text="*"
                    ErrorMessage="Required Field" EnableClientScript="true"
                    ValidationGroup="PersonalInfo"
                    ForeColor="DarkOrange" />
            </div>

            <div>
                <span>Age: </span>
                <asp:TextBox runat="server" ID="TextBoxAge"
                    ValidationGroup="PersonalInfo" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="TextBoxAge" Text="*"
                    ErrorMessage="Required Field" EnableClientScript="true"
                    ValidationGroup="PersonalInfo"
                    ForeColor="DarkOrange" />
                <asp:RangeValidator runat="server" ControlToValidate="TextBoxAge"
                    Type="Integer" MaximumValue="81" MinimumValue="18" 
                    ErrorMessage="Age must be between 18 and 81" Text="*" 
                    ForeColor="DarkOrange"
                    ValidationGroup="PersonalInfo"/>
            </div>

            <div>
                <asp:ValidationSummary runat="server" 
                    ValidationGroup="PersonalInfo" ForeColor="DarkOrange"/>
            </div>

            <div>
                <asp:Button ID="ValidatePerosnalInfoButton" 
                    runat="server"
                    OnClick="ValidatePerosnalInfoButton_Click" 
                    ValidationGroup="PersonalInfo"
                    Text="Validate Personal Info"/>
                <asp:Label runat="server" 
                    ID="IsPersonalInfoValid" />
            </div>
        </asp:Panel>

        <asp:Panel runat="server" GroupingText="Contact Info">
            <div>
                <span>Email: </span>
                <asp:TextBox runat="server" 
                    ID="EmailTextBox"
                    ValidationGroup="ContactInfo" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="EmailTextBox" 
                    Text="*"
                    ErrorMessage="Required Field" 
                    EnableClientScript="true"
                    ForeColor="HotPink"
                    ValidationGroup="ContactInfo" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="EmailTextBox" 
                    Text="*"
                    ErrorMessage="Invalid email. Should be person@example.another.com"
                    ValidationExpression="^[\w-\._]+@[\w-\.]+\.[A-Za-z]{2,4}$" 
                    ValidationGroup="ContactInfo"
                    ForeColor="HotPink"/>
            </div>

            <div>
                <span>Local address: </span>
                <asp:TextBox runat="server" ID="AddressTextBox"
                    ValidationGroup="ContactInfo" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="AddressTextBox" 
                    Text="*"
                    ErrorMessage="Required Field" 
                    EnableClientScript="true"
                    ValidationGroup="ContactInfo"
                    ForeColor="HotPink"/>
            </div>

            <div>
                <span>Phone: </span>
                <asp:TextBox runat="server" 
                    ID="TextBoxPhone"
                    ValidationGroup="ContactInfo" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="TextBoxPhone" 
                    Text="*"
                    ErrorMessage="Required Field" 
                    EnableClientScript="true"
                    ValidationGroup="ContactInfo"
                    ForeColor="HotPink" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="TextBoxPhone" 
                    Text="*"
                    ErrorMessage="Phone is 5 to 15 DIGITS!"
                    ValidationExpression="^[\d]{5,15}$"
                    ValidationGroup="ContactInfo"
                    ForeColor="HotPink" />
            </div>

            <div>
                <asp:ValidationSummary runat="server" 
                    ValidationGroup="ContactInfo" ForeColor="HotPink" />
            </div>
            <div>
                <asp:Button ID="ValidateContactInfoButton" 
                    runat ="server"
                    OnClick="ValidateContactInfoButton_Click" 
                    ValidationGroup="ContactInfo"
                    Text="Validate Contact info"/>
                <asp:Label runat="server" ID="IsValidContactInfo" />
            </div>
        </asp:Panel>
        <div>
            <span>I have checked this check box:</span>
            <asp:CheckBox runat="server" 
                ID="AgreedCheckBox"/>
            <asp:Button runat="server"
                ID="WholeFormCheckButton"
                OnClick="WholeFormCheckButton_Click" 
                Text="Submit"/>
            <asp:Label runat="server"
                Id="WholeFormValidLabel" />
            
        </div>
    </form>
</body>
</html>
