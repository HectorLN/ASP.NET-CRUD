using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDASP
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                //Creacion de sesion con usuario validado
                string LoggedUser = Session["LoggedIn"].ToString();
                welcomeMsg.Text = ("Bienvenido/a " + LoggedUser);
            }
        }
    }
}