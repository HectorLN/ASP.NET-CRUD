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
            //if (e.CommandName == "RowClick")
            //{
            //    GridDataItem item = (GridDataItem)e.Item;
            //    string nombre = item["Nombre"].Text;
            //    string puesto = item["puesto"].Text;
            //    string fecha = item["fecha_ingreso"].Text;

            //    NombreLabel.Text = nombre;
            //    PuestoLabel.Text = puesto;
            //    FechaLabel.Text = "Empleado desde " + fecha;
            //}
            //else if (e.CommandName == "Delete")
            //{
            //    // execute some logic
            //    GridDataItem item = (GridDataItem)e.Item;
            //    string id_empleado = item["id_empleado"].Text;

            //    SqlCommand cmd = new SqlCommand("sp_delete_empleado", con);
            //    con.Open();
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.Add("@Id_empleado", SqlDbType.Int).Value = int.Parse(id_empleado);
            //    cmd.ExecuteNonQuery();
            //    con.Close();

            //}

            if (e.CommandName == "MyCustomCommand1")
            {
                // execute some logic

                GridDataItem item = (GridDataItem)e.Item;
                string id_empleado = item["id_empleado"].Text;

                SqlCommand cmd = new SqlCommand("sp_delete_empleado", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id_empleado", SqlDbType.Int).Value = int.Parse(id_empleado);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if (e.CommandName == "MyCustomCommand2")
            {
                // execute some logic
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

        protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
        {
            Hashtable values = new Hashtable();
            var editableItem = ((GridEditableItem)e.Item);
            editableItem.ExtractValues(values);


            SqlCommand cmd2 = new SqlCommand("sp_comparacion_puesto", con);
            con.Open();
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add("@Puesto", SqlDbType.VarChar).Value = values["puesto"];
            //SqlParameter retval = new SqlParameter("@ReturnValue", System.Data.SqlDbType.Int);
            //retval.Direction = System.Data.ParameterDirection.ReturnValue;
            //cmd2.Parameters.Add(retval);
            //var outputParamter = cmd2.Parameters.Add("@Return", SqlDbType.Int);
            //outputParamter.Direction = ParameterDirection.ReturnValue;
            cmd2.ExecuteNonQuery();
            //var resultado = (int)cmd2.Parameters["@RETURN_VALUE"].Value;
            var resultado = 2;

            //

            SqlCommand cmd = new SqlCommand("sp_create_empleado", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = values["nombre"];
            cmd.Parameters.Add("@Id_puesto", SqlDbType.Int).Value = resultado;
            cmd.Parameters.Add("@Foto", SqlDbType.VarChar).Value = " ";
            cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = values["fecha_ingreso"];

            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            Hashtable values = new Hashtable();
            var editableItem = ((GridEditableItem)e.Item);
            editableItem.ExtractValues(values);

            var id_empleado = (int)editableItem.GetDataKeyValue("id_empleado");

            SqlCommand cmd = new SqlCommand("sp_update", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_empleado", SqlDbType.Int).Value = id_empleado;
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = values["nombre"];
            cmd.Parameters.Add("@Id_puesto", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@Foto", SqlDbType.VarChar).Value = " ";
            cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = values["fecha_ingreso"];

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}