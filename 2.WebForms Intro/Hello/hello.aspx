<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hello.aspx.cs" Inherits="HelloASP.hello" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>First Time asp.NET</title>    
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />    
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Content/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="page-header">
        <h1 class="text-center text-primary">First ASP.NET Page</h1>  
    </div>
    <form id="helloForm" runat="server">
        <div class="container">
            <div class="row">
                <ul class="thumbnails clearfix">
                    <li class="thumbnail span4">
                        <h2 class="text-info">First task - print name</h2>
                        <h4>Put <sup class="text-warning">your name</sup>below</h4>
                        <asp:TextBox runat="server" ID="NameInput" />
                        <asp:Button ID="ButtonAddHiToName" Text="Click" runat="server" OnClick="ButtonHi_Click" class="btn btn-primary" />
                        <asp:HyperLink NavigateUrl="#" ID="NameOutput" runat="server" />
                    </li>

                    <li class="thumbnail span4">
                        <h2 class="text-info">Second task </h2>
                        <h4>Print from code and from aspx</h4>
                        <asp:Button ID="PrintFromCodeButton" OnClick="PrintFromCode" runat="server" CssClass="btn-primary btn" Text="Click" />
                        From Code:<span runat="server" id="printFromCode"></span>
                        <div>From Aspx:<span>Printed from aspx</span></div>
                    </li>
                    <li class="span4 thumbnail active">
                        <asp:Button Text="OK" ID="ButtonOK" runat="server" />
                        <asp:TextBox runat="server" TextMode="MultiLine" CssClass="span4" ID="events"/>
                    </li>
                </ul>
            </div>
        </div>
        <div id="AssemblyLocation" runat="server" class="text-center text-info"></div>
    </form>
</body>
</html>
