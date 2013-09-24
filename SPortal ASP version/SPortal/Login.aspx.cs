using BLL;
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

                if (chkRemember.Checked)
                {
                    Cookie.SetCookie(this, "SPortalUsername", txtUsername.Text, 2);

                    //HttpCookie userCookie = new HttpCookie("SPortalUsername");

                    //userCookie.Value = txtUsername.Text;
                    //userCookie.Expires = DateTime.Now.AddDays(2);

                    //Response.Cookies.Add(userCookie);
                }

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