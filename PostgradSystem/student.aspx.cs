﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostgradSystem
{
    public partial class student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null || Session["userType"] == null || (string)Session["userType"] != "student")
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}