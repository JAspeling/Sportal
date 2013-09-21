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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnOK_Click(object sender, ImageClickEventArgs e)
        {
            Connection connection = new Connection();

            string name = txtName.Text;
            string surname = txtSurname.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string profile = imgProfile.FileName;

            if (connection.Register(name + " " + surname, password, email, name, surname, DateTime.Now, profile, 1))
            {
                MessageBox.Show(string.Format("Profile '{0}' Created", name + " " + surname));
                Session["UserStatus"] = name + " " + surname;
                Response.Redirect("Index.aspx");
            }
            else
            {
                MessageBox.Show(string.Format("Error occured in creating the Profile."));
                Response.Redirect("Index.aspx");
            }
        }
    }
}