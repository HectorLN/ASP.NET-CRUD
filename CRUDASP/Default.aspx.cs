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
            //btn_login.Enabled = false;
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            //Conexion base de datos
            string connect = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConnection = new SqlConnection(connect);
            SqlCommand cmd = new SqlCommand("ValidateUser", sqlConnection)
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
                Response.Redirect("About.aspx");
            }
            else
            {
                lbl_error.Text = "Error de usuario o contraseña";
                Console.WriteLine("Usuario fallo");
            }

            cmd.Connection.Close();
        }

        //Validacion de contraseña - min 8 carácteres (NO FUNCIONA)
        protected void txt_contraseña_TextChanged(object sender, EventArgs e)
        {
            if (txt_contraseña.Text.Length >= 8)
            {
                btn_login.Enabled = true;
            }
        }

        //protected void txt_correo_TextChanged(object sender, EventArgs e)
        //{
        //    if (!IsValidEmail(txt_correo.Text))
        //    {
        //        lbl_error.Text = "El usuario debe ser un correo electrónico válido.";
        //        return;
        //    }
        //}

        //protected void txt_contraseña_TextChanged(object sender, EventArgs e)
        //{
        //    if (!IsValidPassword(txt_contraseña.Text))
        //    {
        //        lbl_error.Text = "La contraseña debe tener al menos 8 caracteres.";
        //        return;
        //    }
        //}

        //private bool IsValidPassword(string password)
        //{
        //    // Validar que la contraseña tenga al menos 8 caracteres
        //    return password.Length >= 8;
        //}

        //private bool IsValidEmail(string email)
        //{
        //    //Proveedores permitidos
        //    string[] allowedProviders = { "gmail.com", "yahoo.com", "hotmail.com", "tress.com.mx", "icloud.com" };

        //    //Validacion de proveedores
        //    string EmailProvider = $@"^[A-Za-z0-9._%+-]+@({string.Join("|", allowedProviders)})$";
        //    return System.Text.RegularExpressions.Regex.IsMatch(email, EmailProvider);
        //}
    }
}