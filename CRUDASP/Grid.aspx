<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="CRUDASP.Grid" MasterPageFile="~/Site.Master" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
        }

        main {
            flex-grow: 1;
        }

            main > article {
                display: grid;
                height: 100%;
                grid-template-columns: 1fr 3fr;
                grid-template-rows: 1fr 3fr;
            }

                main > article > section {
                    height: 100%;
                    padding: 3vmin;
                }

        .barra-lateral {
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: inset -10px 0 3px -9px grey, inset 0px -10px 3px -9px grey;
        }

            .barra-lateral > img {
                height: 5vmin;
            }

        .barra-superior {
            background-color: #e8f7fd;
        }

        .barra-principal {
            background-color: #f8fdff;
        }

        .barra-inferior {
            background-color: #f6f6f6;
            box-shadow: inset -10px 0 3px -9px grey;
            display: flex;
            align-items: center;
            padding-top: 2vmin;
            flex-direction: column;
        }

        html .RadButton_Default.rbLinkButton {
            background-color: #38b6ff;
            border-radius: 25px;
            color: white;
            font-family: sans-serif;
            width: 18vmin;
            background-image: linear-gradient(#38b6ff,#458ab2);
            padding: 3px;
            margin-bottom: 9px;
        }

            html .RadButton_Default.rbLinkButton:hover {
                background-image: linear-gradient(#7ebce0,#458ab2);
                color: white;
            }

            html .RadButton_Default.rbLinkButton ~ .RadButton_Default.rbLinkButton {
                background-color: #38b6ff;
                border-radius: 25px;
                color: white;
                font-family: sans-serif;
                width: 18vmin;
                background-image: linear-gradient(#b9dcf1,#a8bbc5);
            }

                html .RadButton_Default.rbLinkButton ~ .RadButton_Default.rbLinkButton:hover {
                    background-image: linear-gradient(#7ebce0,#458ab2);
                    color: white;
                }

        div.RadGrid_Default .rgHeader, div.RadGrid_Default th.rgResizeCol {
            background-image: none;
            background-color: #6C9AB2;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function rowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function rowClick(sender, eventArgs) {
                var grid = sender.get_masterTableView();
                console.log(grid);
                if (grid) {
                    var data = grid.get_dataItems();
                    var rows = data[eventArgs.get_itemIndexHierarchical()];
                    console.log(rows._element.cells[1].innerHTML);
                    $('#NombreEmpleadoSuperior')[0].innerHTML = rows._element.cells[1].innerHTML;
                    $('#PuestoEmpleadoSuperior')[0].innerHTML = rows._element.cells[2].innerHTML;
                    $('#FechaEmpleadoSuperior')[0].innerHTML = 'Empleado desde ' + rows._element.cells[3].innerHTML;
                }
            }
        </script>
    </telerik:RadCodeBlock>
    <main>
        <hr />
        <article>
            <section class="barra-lateral">
                <img src="\Images\3960.jpg" />
            </section>
            <section class="barra-superior">
                <b>
                    <p id="NombreEmpleadoSuperior" style="margin-bottom: 5vmin">Usuario</p>
                </b>

                <div style="display: flex; justify-content: space-between; width: 70%">
                    <p id="PuestoEmpleadoSuperior" style="opacity: 0.7;">Puesto</p>
                    <p id="FechaEmpleadoSuperior" style="opacity: 0.7">Empleado desde </p>
                </div>
            </section>
            <section class="barra-inferior">
                <asp:Label ID="lbl_bienvenida" runat="server" Text="" CssClass="h3"></asp:Label>
                <telerik:RadButton ID="RadButton1" ButtonType="SkinnedButton" runat="server" Text="Empleados"></telerik:RadButton>
                <telerik:RadButton ID="RadButton2" ButtonType="SkinnedButton" runat="server" Text="Puestos"></telerik:RadButton>
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
                <br />
                <telerik:RadSplitButton ID="RadSplitButton1" runat="server" Text="RadSplitButton"></telerik:RadSplitButton>
                <div style="height: -webkit-fill-available; display: flex; flex-direction: column">
                    <br />
                    <div style="background-color: aliceblue; height: max-content; width: -webkit-fill-available">
                        <telerik:RadGrid RenderMode="Lightweight" AllowAutomaticInserts="True" ID="RadGrid1" runat="server" AutoGenerateEditColumn="True" Style="margin-bottom: 0px" ShowHeader="False" DataSourceID="SqlDataSource1">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                            <ClientSettings>
                                <Animation AllowColumnReorderAnimation="True" AllowColumnRevertAnimation="True" />
                                <Selecting AllowRowSelect="True" />
                                <ClientEvents OnRowDblClick="rowDblClick" />
                                <ClientEvents OnRowClick="rowClick" />
                            </ClientSettings>

                            <MasterTableView AutoGenerateColumns="False" EditMode="PopUp" DataKeyNames="id_empleado" DataSourceID="SqlDataSource1" ShowHeader="True" AllowSorting="True" EnableHeaderContextMenu="True" CommandItemDisplay="Top">
                                <CommandItemSettings AddNewRecordText="Ingresar empleado" ShowRefreshButton="False" />
                                <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>

                                <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id_empleado" DataType="System.Int32" FilterControlAltText="Filter id_empleado column" HeaderText="id_empleado" ShowNoSortIcon="False" SortExpression="id_empleado" UniqueName="id_empleado" ReadOnly="True">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="nombre" FilterControlAltText="Filter nombre column" HeaderText="nombre" ShowNoSortIcon="False" SortExpression="nombre" UniqueName="nombre">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="puesto" FilterControlAltText="Filter puesto column" HeaderText="puesto" ShowNoSortIcon="False" SortExpression="puesto" UniqueName="puesto">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fecha_ingreso" DataType="System.DateTime" FilterControlAltText="Filter fecha_ingreso column" HeaderText="fecha_ingreso" ShowNoSortIcon="False" SortExpression="fecha_ingreso" UniqueName="fecha_ingreso">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ConfirmText="" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="Eliminar" ButtonType="FontIconButton" CommandName="Delete" ConfirmTextFields="NOMBRE" ConfirmTextFormatString="Desea eliminar a {0}?" FilterControlAltText="Filter borrar column" UniqueName="borrar" />
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
    </main>
</asp:Content>