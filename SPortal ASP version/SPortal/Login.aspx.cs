﻿using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SPortal
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnOK_Click(object sender, ImageClickEventArgs e)
        {
            Connection connection = new Connection();

            if (connection.Login(txtUsername.Text, txtPassword.Text))
            {
                Session["UserStatus"] = txtUsername.Text;

                MessageBox.Show("Login Success");
                Response.Redirect("Index.aspx");
            }
            else
            {
                MessageBox.Show("Username/Password Combination does not match");
            }
        }
    }
}