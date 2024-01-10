﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDASP
{
    public partial class Reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoggedUser = Session["LoggedIn"].ToString();
            lbl_token.Text = ("Bienvenido/a " + LoggedUser);
        }
    }
}