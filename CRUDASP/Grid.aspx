<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="CRUDASP._Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="estilo.css" rel="stylesheet" type="text/css" />
    <link href="Content/boostrap.css" rel="stylesheet" type="text/css" />
    <main>
        <hr />
        <article>
            <section class="barra-lateral">
                <telerik:RadLabel ID="RadLabel1" runat="server">Output 1</telerik:RadLabel>
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
                    <div style="background-color: aliceblue; height: fit-content; width: inherit">
                        <telerik:RadGrid RenderMode="Lightweight" AllowAutomaticInserts="True" ID="RadGrid1" runat="server" 
                            DataSourceID="SqlDataSource1" AutoGenerateEditColumn="True" OnItemCommand="RadGrid1_ItemCommand" 
                            OnUpdateCommand="RadGrid1_UpdateCommand" OnItemCreated="RadGrid1_ItemCreated" OnDeleteCommand="RadGrid1_DeleteCommand" 
                            OnInsertCommand="RadGrid1_InsertCommand" OnItemDataBound="RadGrid1_ItemDataBound">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID, NOMBRE, PUESTO, FechaIngreso">
                                <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>

                                <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>

                                <Columns>
                                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" ShowNoSortIcon="False" SortExpression="ID" UniqueName="ID" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="NOMBRE" FilterControlAltText="Filter NOMBRE column" ShowNoSortIcon="False" SortExpression="NOMBRE" UniqueName="NOMBRE" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PUESTO" FilterControlAltText="Filter PUESTO column" ShowNoSortIcon="False" SortExpression="PUESTO" UniqueName="PUESTO" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FechaIngreso" DataType="System.DateTime" FilterControlAltText="Filter FechaIngreso column" ShowNoSortIcon="False" SortExpression="FechaIngreso" UniqueName="FechaIngreso" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn UniqueName="BotonEliminar" ButtonType="FontIconButton" CommandName="Delete" ConfirmText="" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Eliminar" />
                                </Columns>
                                <EditFormSettings>
                                    <EditColumn ShowNoSortIcon="False"></EditColumn>
                                </EditFormSettings>
                            </MasterTableView>

                            <FilterMenu RenderMode="Lightweight"></FilterMenu>

                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=GTI-739;Initial Catalog=PRUEBA;Persist Security Info=True;User ID=sa;Password=Tr3$$GT1.20" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [EMPLEADOS]"></asp:SqlDataSource>
                        <div class="p-2">
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
