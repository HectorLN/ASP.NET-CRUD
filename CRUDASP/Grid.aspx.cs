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
    public partial class Grid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                //Creacion de sesion con usuario validado
                string LoggedUser = Session["LoggedIn"].ToString();
                lbl_bienvenida.Text = ("Bienvenido/a " + LoggedUser);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            RadGrid1.SelectedIndexChanged += RadGrid1_SelectedIndexChanged;
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var tool = sender;
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string nombre = item["Nombre"].Text;
                string puesto = item["puesto"].Text;
                string fecha = item["fecha_ingreso"].Text;

                NombreLabel.Text = nombre;
                PuestoLabel.Text = puesto;
                FechaLabel.Text = "Empleado desde " + fecha;
            }
        }
    }
}