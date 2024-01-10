<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reset.aspx.cs" Inherits="CRUDASP._Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="login.css" rel="stylesheet" type="text/css" />
    <div class="main_body">
        <div class="Login">
            <telerik:RadLabel ID="lbl_token" runat="server" AssociatedControlID="lbl_recover"></telerik:RadLabel>
        </div>
    </div>
</asp:Content>