<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Experiment.aspx.cs" Inherits="DeleteHiddenField.Experiment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>Write some text - it will disappear on reload because the hidden fields holding the viewState are deleted.</p>
        <asp:TextBox runat="server" />
    </div>
    </form>
    <script>
        document.onreadystatechange = function ()
        {
            var divs = document.getElementsByTagName('div');
            for (var i = 0; i < divs.length; i++) {
                if (divs[i].className == "aspNetHidden") {
                    divs[i].innerHTML = "";
                }
            }
        }
    </script>
</body>
</html>
