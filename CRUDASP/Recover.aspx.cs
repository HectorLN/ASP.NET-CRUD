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
        protected void btn_recover_Click(object sender, EventArgs e)
        {
            string email = txt_recover_correo.Text;

            // Generate a unique token
            string token = GenerateUniqueToken();
            Console.WriteLine("--EL TOKEN ES : " + token + "--");
            // Store the token and expiration timestamp in the database
            StoreTokenInDatabase(email, token, 1);

            // Redirect to the password reset page with the token included in the URL
            Response.Redirect($"~/reset.aspx?token={HttpUtility.UrlEncode(token)}");
        }

        private string GenerateUniqueToken()
        {
            // Implement logic to generate a unique token (e.g., using Guid.NewGuid())
            return Guid.NewGuid().ToString();
        }

        private void StoreTokenInDatabase(string email, string token, int expirationHours)
        {
            // Connection to the database
            string connect = ConfigurationManager.ConnectionStrings["CRUDG3IConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(connect))
            {
                using (SqlCommand cmdGetAdminId = new SqlCommand("sp_admin_id_by_email", sqlConnection))
                {
                    cmdGetAdminId.CommandType = CommandType.StoredProcedure;
                    cmdGetAdminId.Parameters.Add("@email", SqlDbType.VarChar, 40).Value = email;
                    cmdGetAdminId.Parameters.Add("@id_admin", SqlDbType.Int).Direction = ParameterDirection.Output;

                    sqlConnection.Open();
                    cmdGetAdminId.ExecuteNonQuery();

                    // Retrieve the AdminId from the output parameter
                    int adminId = Convert.ToInt32(cmdGetAdminId.Parameters["@id_admin"].Value);

                    // Check if a valid adminId is obtained
                    if (adminId > 0)
                    {
                        Console.WriteLine("--EL TOKEN ES : " + token + "--");
                        DateTime expirationTimestamp = DateTime.Now.AddHours(expirationHours);

                        // Call the stored procedure to store the reset token
                        using (SqlCommand cmdStoreToken = new SqlCommand("sp_verify_reset_token", sqlConnection))
                        {
                            cmdStoreToken.CommandType = CommandType.StoredProcedure;
                            cmdStoreToken.Parameters.Add("@id_admin", SqlDbType.Int).Value = adminId;
                            cmdStoreToken.Parameters.Add("@token", SqlDbType.NVarChar, 255).Value = token;

                            cmdStoreToken.ExecuteNonQuery();
                        }

                        SqlDataReader dr = cmdGetAdminId.ExecuteReader();

                        if (dr.Read())
                        {
                            //Redireccion de pagina con usuario validado
                            Session["LoggedIn"] = dr["token"].ToString(); //Columna de nombre dentro de tabla para label de bienvendia
                        }
                    }
                    else
                    {
                        // Handle the case where the email is not found
                        // (e.g., show an error message to the user)
                    }
                }
            }
        }
    }
}