using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using static System.EventArgs;
using System.Web.UI.WebControls;
using static System.Web.UI.WebControls.CommandEventArgs;
using Telerik.Web.UI;

namespace CRUDASP
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
        {
            string text = "" + ((GridDataItem)e.Item).GetDataKeyValue("NOMBRE").ToString();
        }
        protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
        {
            RadLabel1.Text = "update";

            var editableItem = ((GridEditableItem)e.Item);
            string text = editableItem.GetDataKeyValue("NOMBRE").ToString();

            RadLabel1.Text = text;
        }

        protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
        {

        }

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {

        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;

                string dataKeyID = item.GetDataKeyValue("NOMBRE").ToString();

                string message = string.Format("Eliminar a usuario <b>{0}</b>?",
                        dataKeyID);

                (RadGrid1.MasterTableView.GetColumn("BotonEliminar") as GridButtonColumn).ConfirmText = message;
                var text = 5;
            }
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName)
            {
                RadLabel1.Text = "add new record";
            }
            else if (e.CommandName == RadGrid.PerformInsertCommandName)
            {
                RadLabel1.Text = "insert";
            }
            else if (e.CommandName == RadGrid.EditCommandName)
            {
                RadLabel1.Text = "edit";
            }
            else if (e.CommandName == RadGrid.UpdateCommandName)
            {
                RadLabel1.Text = "update";
            }
            else if (e.CommandName == RadGrid.DeleteCommandName)
            {
                
            }
            else if (e.CommandName == RadGrid.PageCommandName)
            {
                RadLabel1.Text = "paging";
            }
            else if (e.CommandName == RadGrid.SortCommandName)
            {
                RadLabel1.Text = "sorting";
            }
            else if (e.CommandName == RadGrid.FilterCommandName)
            {
                RadLabel1.Text = "filtering";
            }
        }
    }
}