<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hello.aspx.cs" Inherits="HelloASP.hello" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link href="Content/bootstrap/bootstrap.min.css" rel="stylesheet" />    
    <link href="Content/bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">        
        <div class="row-fluid">
            <h1 class="text-center text-primary active page-header">First ASP.NET Page</h1>
        </div>
        <div class="row-fluid text-center">
            <form id="helloForm" runat="server">                
                    <div class="span4">

                        <h2>First task - print name</h2>
                        <h4>Put <sub class="text-danger">your name</sub>below</h4>

                        <asp:TextBox runat="server" ID="NameInput" />
                        <asp:Button ID="ButtonAddHiToName" Text="Click" runat="server" OnClick="ButtonHi_Click" class="btn btn-primary" />
                        <asp:HyperLink NavigateUrl="#" ID="NameOutput" runat="server" />

                    </div>

                    <div class="span4">
                        <h2 class="text-center">Secont task </h2>
                        <h4 class="text-center ">Print from code and from aspx</h4>
                        <div class="span4">
                            <asp:Button ID="PrintFromCodeButton" OnClick="PrintFromCode" runat="server"/>
                            From Code:<span runat="server" id="printFromCode"></span>
                        </div>
                        <div class="span4">                            
                            From Aspx:<span >Printed from aspx</span>
                        </div>
                    </div>                
            </form>
        </div >
    </div>
</body>
</html>
