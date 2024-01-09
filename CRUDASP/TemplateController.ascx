﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TemplateController.ascx.cs" Inherits="CRUDASP.TemplateController" %>


<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:CRUDG3IConnectionString %>"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [puesto] FROM [tbl_puesto] ORDER By puesto"></asp:SqlDataSource>

<table>
    <thead>
        <tr>
            <td>Nombre: </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Nombre") %>' />
            </td>
        </tr>
        <tr>
            <td>Puesto:</td>
            <td>

                <asp:DropDownList ID="DropEmpleado" runat="server" DataSourceID="SqlDataSource1" DataTextField="puesto" DefaultMessage="Selecciona un puesto"
                    DataValueField="puesto" AppendDataBoundItems="true">
                </asp:DropDownList>

                <%--<telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList2" runat="server" Width="220px"
                    DropDownHeight="200" DataSourceID="SqlDataSource1" DataTextField="puesto" DefaultMessage="Selecciona un puesto"
                    DataValueField="puesto" OnItemSelected="RadDropDownList2_ItemSelected">
                </telerik:RadDropDownList>--%>

            </td>
        </tr>
        <tr>
            <td>Fecha de ingreso: </td>
            <td>
                <telerik:RadDatePicker ID="BirthDatePicker" runat="server" MinDate="1/1/1900" DbSelectedDate='<%# DataBinder.Eval(Container, "DataItem.fecha_ingreso") %>'>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton runat="server" ID="RadButton1" Text='<%# (Container is GridEditFormInsertItem) ? "Agregar" : "Editar"  %>' CommandName='<%# (Container is GridEditFormInsertItem) ? "btn_agregar_empleado" : "btn_editar_empleado" %>'  AutoPostBack="True" />

                <%--<asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "btn_agregar_empleado" : "btn_editar_empleado" %>'
                    runat="server" CommandName="PerformInsert"></asp:Button>&nbsp;--%>
                                    
            </td>
            <td>
                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                    CommandName="Cancel"></asp:Button>
            </td>
        </tr>
    </thead>
</table>
