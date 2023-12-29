<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CRUDASP.About" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3 style="color:aqua">Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <telerik:RadDateInput BackColor="Salmon" ID="RadDateInput1" runat="server"></telerik:RadDateInput>
</asp:Content>
