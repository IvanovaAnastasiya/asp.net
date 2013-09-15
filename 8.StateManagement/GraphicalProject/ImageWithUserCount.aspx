<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageWithUserCount.aspx.cs" Inherits="CookieExchange.ImageWithUserCount" %>

<%@ Register Src="~/Counter.ascx" TagPrefix="uc1" TagName="Counter" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span>This will show how many users were here since the start of application!</span>
    </div>
    </form>
    <uc1:Counter runat="server" id="Counter" />
</body>
</html>
