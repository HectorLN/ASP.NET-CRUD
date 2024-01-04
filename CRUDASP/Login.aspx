<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUDASP._Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="login.css" rel="stylesheet" type="text/css" />
    <div class="main_body">

        <asp:Image class="logo" runat="server" ImageUrl="~/Images/logoGTIBlanco 1.png" />
        <div class="Login">
            <telerik:RadLabel ID="lbl_bienvenida" runat="server" AssociatedControlID="lbl_bienvenida">
                Inicio de sesión
            </telerik:RadLabel>
            <%-- Seccion del correo --%>
            <div class="correo">

                <telerik:RadLabel class="lbl_correo" ID="lbl_correo" runat="server" AssociatedControlID="lbl_correo">
                    Correo:
                </telerik:RadLabel>

                <%-- Textbox del correo --%>
                <telerik:RadTextBox class="txt_correo" ID="txt_correo" runat="server" Mask="Regex" EmptyMessage="Ingrese correo"></telerik:RadTextBox>
                <%-- Validacion de correo --%>
                <asp:RegularExpressionValidator ID="emailValidator" runat="server" Display="Dynamic"
                    ErrorMessage="Ingrese un correo valido" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                    ControlToValidate="txt_correo" ForeColor="Red">
                </asp:RegularExpressionValidator>
                <%-- Correo campo obligatorio --%>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" Display="Dynamic"
                    ControlToValidate="txt_correo" ErrorMessage="Ingrese un correo valido" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <%-- Seccion de la contrasea --%>
            <div class="contraseña">
                <telerik:RadLabel ID="lbl_contraseña" runat="server" AssociatedControlID="lbl_contraseña">
                    Contraseña:
                </telerik:RadLabel>
                <%-- Textbox de la contraseña --%>
                <telerik:RadTextBox ID="txt_contraseña" runat="server" LabelWidth="64px" Resize="None" Width="160px" TextMode="Password" OnTextChanged="txt_contraseña_TextChanged" type="password" AutoPostBack="True">
                    <ClientEvents OnValueChanged="PreventPostback" />
                </telerik:RadTextBox>
                <%-- Contraseña campo obligatorio --%>
                <asp:RequiredFieldValidator ID="PickerRequiredFieldValidator" runat="server" Display="Dynamic"
                    ControlToValidate="txt_contraseña" ErrorMessage="Ingrese una contraseña valida" />
            </div>
            <div id="mensaje_error">

                <telerik:RadLabel ID="lbl_error" runat="server"></telerik:RadLabel>
            </div>
            <%-- Boton de ingresar --%>
            <div id="boton_login">
                <telerik:RadButton ID="btn_login" runat="server" Text="Ingresar" OnClick="btn_login_Click" Skin="Windows7" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function PreventPostback(sender, eventArgs) {
            var texto = eventArgs.get_newValue();
            if (texto.length > 7)
                eventArgs.set_cancel(true);
        }
    </script>
</asp:Content>