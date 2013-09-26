using System;
using System.Web.UI;
using System.Windows.Forms;
using BLL;

namespace SPortal
{
    public partial class Sign : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click(object sender, ImageClickEventArgs e)
        {
            Connection connection = new Connection();

            if (Connection.Login(txtUsername.Text, txtPassword.Text))
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