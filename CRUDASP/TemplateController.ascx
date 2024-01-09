<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TemplateController.ascx.cs" Inherits="CRUDASP.TemplateController" %>


<style type="text/css">
    .auto-style1 {
        width: 210px;
    }
</style>


<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:CRUDG3IConnectionString %>"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [puesto] FROM [tbl_puesto] ORDER By puesto"></asp:SqlDataSource>


<table>
    <thead>
        <tr>
            <td>Nombre: </td>
            <td class="auto-style1">
                <telerik:RadTextBox SelectionOnFocus="SelectAll" FocusedStyle-BorderColor="Black" ID="RadTextBox1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Nombre") %>' LabelWidth="64px" Resize="None" Skin="Bootstrap" Width="160px" ></telerik:RadTextBox>
            </td>
        </tr>
        <tr>
            <td>Puesto:</td>
            <td class="auto-style1">
                <telerik:RadDropDownList ID="RadDropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="puesto" DefaultMessage="Selecciona un puesto"
                    DataValueField="puesto" AppendDataBoundItems="true" Skin="Bootstrap" Width="184px">
                </telerik:RadDropDownList>

                <%--<asp:DropDownList ID="DropEmpleado" runat="server" DataSourceID="SqlDataSource1" DataTextField="puesto" DefaultMessage="Selecciona un puesto"
                    DataValueField="puesto" AppendDataBoundItems="true">
                </asp:DropDownList>--%>
            </td>
        </tr>
        <tr>
            <td>Fecha de ingreso: </td>
            <td class="auto-style1">
                <telerik:RadDatePicker ID="BirthDatePicker" runat="server" MinDate="1/1/1900" DbSelectedDate='<%# DataBinder.Eval(Container, "DataItem.fecha_ingreso") %>' Skin="Bootstrap">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap"></Calendar>

                    <DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%">
                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                        <FocusedStyle Resize="None"></FocusedStyle>

                        <DisabledStyle Resize="None"></DisabledStyle>

                        <InvalidStyle Resize="None"></InvalidStyle>

                        <HoveredStyle Resize="None"></HoveredStyle>

                        <EnabledStyle Resize="None"></EnabledStyle>
                    </DateInput>

                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton runat="server" ID="RadButton1" Text='<%# (Container is GridEditFormInsertItem) ? "Agregar" : "Editar"  %>' CommandName='<%# (Container is GridEditFormInsertItem) ? "btn_agregar_empleado" : "btn_editar_empleado" %>' AutoPostBack="True" Skin="Bootstrap" />

                <%--<asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "btn_agregar_empleado" : "btn_editar_empleado" %>'
                    runat="server" CommandName="PerformInsert"></asp:Button>&nbsp;--%>
                                    
            </td>
            <td class="auto-style1">
                
                <telerik:RadButton ID="RadButton2" Text="Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Skin="Bootstrap"></telerik:RadButton>
                <%--<asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                    CommandName="Cancel"></asp:Button>--%>
            </td>
        </tr>
    </thead>
</table>
