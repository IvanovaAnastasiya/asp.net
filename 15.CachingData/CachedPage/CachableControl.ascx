<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CachableControl.ascx.cs" Inherits="CachedPage.CachableControl" %>
<%@ OutputCache Duration="10" VaryByParam="none" %>
<div>
    This control has been cached at <%= DateTime.Now.ToLocalTime() %>
</div>
