<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recover.aspx.cs" Inherits="CRUDASP._Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="login.css" rel="stylesheet" type="text/css" />
    <div class="main_body">
        <div class="Login">
            <telerik:RadLabel ID="lbl_recover" runat="server" AssociatedControlID="lbl_recover">Recuperar contraseña</telerik:RadLabel>
            <telerik:RadLabel ID="lbl_descripcion" runat="server" AssociatedControlID="lbl_recover">
                Ingrese el correo de la cuenta que desea recuperar
            </telerik:RadLabel>
            <div id="correo">
                <telerik:RadLabel ID="lbl_recover_correo" runat="server">Correo</telerik:RadLabel>
                <telerik:RadTextBox ID="txt_recover_correo" runat="server"></telerik:RadTextBox>
            </div>
            <telerik:RadButton ID="btn_recover" runat="server" Text="Validar Correo" OnClick="btn_recover_Click"></telerik:RadButton>
        </div>
    </div>
</asp:Content>