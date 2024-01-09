using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using static System.EventArgs;
using System.Web.UI.WebControls;
using static System.Web.UI.WebControls.CommandEventArgs;
using Telerik.Web.UI;
using System.Collections;

namespace CRUDASP
{
    public partial class Grid : System.Web.UI.Page
    {
        //Agregar cadena de conexion
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CRUDG3IConnectionString"].ConnectionString);

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
                string id = item["id_empleado"].Text;

                NombreLabel.Text = nombre;
                PuestoLabel.Text = puesto;
                FechaLabel.Text = "Empleado desde " + fecha;

                string queryString =
                "SELECT foto FROM tbl_empleado WHERE id_empleado = " + id;
                SqlCommand command = new SqlCommand(
                    queryString, con);
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var foto_src = "" + reader[0];
                        ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(),
                        "setFoto('" + foto_src + "');", true);
                    }
                }
                con.Close();
            }
            if (e.CommandName == "btn_agregar_empleado")
            {
                // execute some logic
                UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
                //Update new values
                Hashtable newValues = new Hashtable();

                newValues["nombre"] = (userControl.FindControl("RadTextBox1") as RadTextBox).Text;
                newValues["puesto"] = (userControl.FindControl("RadDropDownList1") as RadDropDownList).SelectedItem.Value;
                newValues["fecha_ingreso"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();

                string queryString =
               "SELECT id_puesto FROM tbl_puesto WHERE puesto = '" + newValues["puesto"] + "'";
                SqlCommand command = new SqlCommand(
                    queryString, con);
                con.Open();

                var id_puesto = 0;

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        id_puesto = int.Parse("" + reader[0]);
                    }
                }

                SqlCommand cmd = new SqlCommand("sp_create_empleado", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = newValues["nombre"];
                cmd.Parameters.Add("@Id_puesto", SqlDbType.Int).Value =id_puesto;
                cmd.Parameters.Add("@Foto", SqlDbType.VarChar).Value = " ";
                cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = newValues["fecha_ingreso"];

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Grid.aspx");
            }
             if (e.CommandName == "btn_editar_empleado")
            {
                
            }
        }

        protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            string id_empleado = item["id_empleado"].Text;

            SqlCommand cmd = new SqlCommand("sp_delete_empleado", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_empleado", SqlDbType.Int).Value = int.Parse(id_empleado);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            //GridItem firstItem = RadGrid1.Items[0];
            //firstItem.FireCommandEvent("RowClick","");
        }
    }
}