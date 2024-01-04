using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CRUDASP
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            //Conexion base de datos
            string connect = ConfigurationManager.ConnectionStrings["CRUDG3IConnectionString"].ConnectionString;

            SqlConnection sqlConnection = new SqlConnection(connect);
            SqlCommand cmd = new SqlCommand("sp_validate_user", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Connection.Open();
            cmd.Parameters.Add("@Email", SqlDbType.VarChar, 40).Value = txt_correo.Text;
            cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 20).Value = txt_contraseña.Text;
            cmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = "InfoToolsSV";

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                //Redireccion de pagina con usuario validado
                Session["LoggedIn"] = dr["nombre"].ToString(); //Columna de nombre dentro de tabla para label de bienvendia
                Response.Redirect("Grid.aspx");
            }
            else
            {
                lbl_error.Text = "Usuario o contraseña incorrectos";
            }

            cmd.Connection.Close();
        }

        protected void txt_contraseña_TextChanged(object sender, EventArgs e)
        {
            int tam = txt_contraseña.Text.Length;

            if (tam >= 8)
            {
                lbl_error.Text = txt_contraseña.Text;
            }
            else
            {
                lbl_error.Text = "Ingrese credenciales validas";
            }
        }
    }
}