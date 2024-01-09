<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="CRUDASP.Grid" MasterPageFile="~/Site.Master" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="grid.css" rel="stylesheet" type="text/css" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function rowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function setFoto(src) {
                let n_src = '\\Images\\' + src;
                $("#FotoEmpleado").attr("src", n_src);
            }

            function rowClick(sender, eventArgs) {

            }
        </script>
    </telerik:RadCodeBlock>
    <main>
        <div class="wrapper">
            <article>
                <section class="barra-lateral">
                    <img src="\Images\3960.jpg" />
                </section>
                <section class="barra-superior">

                    <div class="datos-empleado">
                        
                            <telerik:RadLabel ID="NombreLabel" Text="Nombre del empleado:" runat="server"></telerik:RadLabel>

                        <div class ="datos-empleado-2">
                            <telerik:RadLabel ID="PuestoLabel" Text="Puesto: " runat="server"></telerik:RadLabel>
                            <telerik:RadLabel ID="FechaLabel" Text="Empleado desde: " runat="server"></telerik:RadLabel>
                            <img id="FotoEmpleado" class="imagen_empleado" src="\Images\default.png" alt="" />
                        </div>
                        
                    </div>
                    
                </section>
                <section class="barra-inferior">
                    <asp:Label ID="lbl_bienvenida" runat="server" Text=""></asp:Label>
                    <telerik:RadButton ID="RadButton1" ButtonType="SkinnedButton" runat="server" Text="Empleados"></telerik:RadButton>
                    <telerik:RadButton ID="RadButton2" ButtonType="SkinnedButton" runat="server" Text="Puestos"></telerik:RadButton>
                </section>
                <section class="barra-principal">
                    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                        <AjaxSettings>
                            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                    <telerik:AjaxUpdatedControl ControlID="NombreLabel" LoadingPanelID="RadAjaxLoadingPanel2"></telerik:AjaxUpdatedControl>
                                    <telerik:AjaxUpdatedControl ControlID="PuestoLabel" LoadingPanelID="RadAjaxLoadingPanel2"></telerik:AjaxUpdatedControl>
                                    <telerik:AjaxUpdatedControl ControlID="FechaLabel" LoadingPanelID="RadAjaxLoadingPanel2"></telerik:AjaxUpdatedControl>
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                            <telerik:AjaxSetting AjaxControlID="RadGrid2">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
                    </telerik:RadAjaxManager>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
                    </telerik:RadAjaxLoadingPanel>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" Transparency="50" runat="server" Skin="MetroTouch">
                    </telerik:RadAjaxLoadingPanel>
                    <br />
                    
                    <div style="height: -webkit-fill-available; display: flex; flex-direction: column">
                        <br />
                        <div style="background-color: aliceblue; height: max-content; width: -webkit-fill-available">
                            <h4>Empleados:</h4>

                            <!-- Contenido del RADGRID -->

                            <telerik:RadGrid RenderMode="Lightweight" AllowAutomaticInserts="False" ID="RadGrid1" runat="server"
                                AutoGenerateEditColumn="True" Style="margin-bottom: 0px" ShowHeader="False" CellSpacing="-1"
                                DataSourceID="SqlDataSource1" GridLines="Both" OnPreRender="RadGrid1_PreRender" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged"
                                OnItemCommand="RadGrid1_ItemCommand" OnUpdateCommand="RadGrid1_UpdateCommand" OnDeleteCommand="RadGrid1_DeleteCommand" OnInsertCommand="RadGrid1_InsertCommand" AllowPaging="True" AutoGenerateDeleteColumn="False">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <ClientSettings AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                    <Selecting AllowRowSelect="True" />

                                    <ClientEvents OnRowDblClick="rowDblClick" />
                                    <ClientEvents OnRowClick="rowClick" />
                                </ClientSettings>

                                <MasterTableView AutoGenerateColumns="False" EditMode="PopUp" ShowHeader="True" AllowSorting="True" EnableHeaderContextMenu="True" CommandItemDisplay="Top" DataSourceID="SqlDataSource1" DataKeyNames="id_empleado, nombre, puesto, fecha_ingreso">
                                    <CommandItemSettings AddNewRecordText="Ingresar empleado" ShowRefreshButton="False" />
                                    <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                                    <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>

                                    <Columns>
                                        <telerik:GridBoundColumn DataField="id_empleado" DataType="System.Int32" FilterControlAltText="Filter id_empleado column" HeaderText="Número de empleado" ReadOnly="True" ShowNoSortIcon="False" SortExpression="id_empleado" UniqueName="id_empleado">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="nombre" FilterControlAltText="Filter nombre column" HeaderText="Nombre del empleado" ShowNoSortIcon="False" SortExpression="nombre" UniqueName="nombre">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="puesto" FilterControlAltText="Filter puesto column" HeaderText="Departamento" ShowNoSortIcon="False" SortExpression="puesto" UniqueName="puesto">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="fecha_ingreso" DataType="System.DateTime" FilterControlAltText="Filter fecha_ingreso column" HeaderText="Fecha de ingreso" ShowNoSortIcon="False" SortExpression="fecha_ingreso" UniqueName="fecha_ingreso">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn UniqueName="BotonEliminar" ButtonType="FontIconButton" CommandName="Delete" ConfirmText="" ConfirmDialogType="RadWindow"
                                            ConfirmTitle="Eliminar" ConfirmTextFields="nombre" ConfirmTextFormatString="Desea eliminar a <b>{0}</b>?" />
                                    </Columns>

                                    <EditFormSettings>
                                        <EditColumn ShowNoSortIcon="False"></EditColumn>
                                    </EditFormSettings>
                                    <ItemStyle BackColor="White" />
                                    <AlternatingItemStyle BackColor="#E0E0E0" />
                                    <EditItemStyle BackColor="#E8F7FD" />
                                    <HeaderStyle BackColor="#6C9AB2" CssClass="tabla-header" />
                                    <CommandItemStyle BackColor="#6C9AB2" />
                                </MasterTableView>

                                <HeaderStyle BackColor="#6C9AB2" />

                                <ActiveItemStyle BackColor="#E8F7FD" />

                                <FilterMenu RenderMode="Lightweight"></FilterMenu>

                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRUDG3IConnectionString %>" SelectCommand="SELECT e.id_empleado, e.nombre, p.puesto, e.fecha_ingreso FROM tbl_empleado e INNER JOIN tbl_puesto p  ON e.id_puesto = p.id_puesto"></asp:SqlDataSource>
                            <div class="p-2">
                            </div>
                        </div>
                        <br />
                        <div style="background-color: aliceblue; height: max-content; width: -webkit-fill-available">
                            <h4>Nominas:</h4>
                            <telerik:RadGrid RenderMode="Lightweight" AllowAutomaticInserts="True" ID="RadGrid2" runat="server" Style="margin-bottom: 0px" ShowHeader="False" CellSpacing="-1"
                                DataSourceID="SqlDataSource2" GridLines="Both">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <ClientSettings AllowKeyboardNavigation="true" EnablePostBackOnRowClick="true">
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2"></Scrolling>
                                </ClientSettings>

                                <MasterTableView AutoGenerateColumns="False" EditMode="PopUp" ShowHeader="True" AllowSorting="True" EnableHeaderContextMenu="True" CommandItemDisplay="Top" DataSourceID="SqlDataSource2" DataKeyNames="id_nomina">
                                    <CommandItemSettings AddNewRecordText="Ingresar empleado" ShowRefreshButton="False" ShowAddNewRecordButton="False" />
                                    <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>

                                    <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>

                                    <Columns>
                                        <telerik:GridBoundColumn DataField="id_nomina" DataType="System.Int32" FilterControlAltText="Filter id_nomina column" HeaderText="Número de nomina" ReadOnly="True" ShowNoSortIcon="False" SortExpression="id_nomina" UniqueName="id_nomina">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id_empleado" DataType="System.Int32" FilterControlAltText="Filter id_empleado column" HeaderText="Número de empleado" ShowNoSortIcon="False" SortExpression="id_empleado" UniqueName="id_empleado">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="salario" DataType="System.Decimal" FilterControlAltText="Filter salario column" HeaderText="Sueldo depositado" ShowNoSortIcon="False" SortExpression="salario" UniqueName="salario">
                                        </telerik:GridBoundColumn>
                                    </Columns>

                                    <EditFormSettings>
                                        <EditColumn ShowNoSortIcon="False"></EditColumn>
                                    </EditFormSettings>
                                    <ItemStyle BackColor="White" />
                                    <AlternatingItemStyle BackColor="#E0E0E0" />
                                    <EditItemStyle BackColor="#E8F7FD" />
                                    <HeaderStyle BackColor="#6C9AB2" CssClass="tabla-header" />
                                    <CommandItemStyle BackColor="#6C9AB2" />
                                </MasterTableView>

                                <HeaderStyle BackColor="#6C9AB2" />

                                <ActiveItemStyle BackColor="#E8F7FD" />

                                <FilterMenu RenderMode="Lightweight"></FilterMenu>

                                <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRUDG3IConnectionString %>" SelectCommand="SELECT * FROM [tbl_nomina] WHERE [id_empleado] = @id_empleado">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="RadGrid1" DefaultValue="1" Name="id_empleado"
                                        PropertyName="SelectedValue" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
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
                    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" Skin="MetroTouch">
                        <Windows>
                            <telerik:RadWindow ID="Eliminar" runat="server" Animation="Fade" EnableShadow="True" Modal="True" Opacity="50" RenderMode="Lightweight" Skin="MetroTouch" Style="display: none;">
                            </telerik:RadWindow>
                        </Windows>
                    </telerik:RadWindowManager>
                </section>
            </article>
        </div>
    </main>
</asp:Content>