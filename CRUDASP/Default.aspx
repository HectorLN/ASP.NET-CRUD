<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUDASP._Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="estilo.css" rel="stylesheet" type="text/css" />
    <link href="Content/boostrap.css" rel="stylesheet" type="text/css" />
    <main>
        <hr />
        <article>
            <section class="barra-lateral">
            </section>
            <section class="barra-superior">
            </section>
            <section class="barra-inferior">
            </section>
            <section class="barra-principal">
                <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="RadGrid1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                <div class="d-flex align-items-center" style="background-color: blanchedalmond; opacity: 0.5; height: 100%">
                    <div style="background-color: aliceblue; height:fit-content">
                        <telerik:RadGrid RenderMode="Lightweight" AllowSorting="True" AllowAutomaticInserts="True" ID="RadGrid1" runat="server"></telerik:RadGrid>
                        <div class="p-2">
                            <telerik:RadColorPicker ID="RadColorPicker1" runat="server"></telerik:RadColorPicker>
                        </div>
                        
                    </div>
                </div>


                <telerik:RadInputManager RenderMode="Lightweight" runat="server" ID="RadInputManager1" Enabled="true">
                    <telerik:TextBoxSetting BehaviorID="TextBoxSetting1">
                    </telerik:TextBoxSetting>
                    <telerik:TextBoxSetting BehaviorID="TextBoxSetting1">
                    </telerik:TextBoxSetting>
                </telerik:RadInputManager>
                <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" />
            </section>
        </article>

    </main>



</asp:Content>
