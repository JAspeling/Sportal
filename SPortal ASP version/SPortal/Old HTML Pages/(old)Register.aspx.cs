using System;
using System.Web.UI;
using System.Windows.Forms;
using BLL;

namespace SPortal
{
    public partial class Register : Page
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

            //connection.Register(name + " " + surname, password, email, name, surname, DateTime.Now, profile, 1);

            MessageBox.Show(string.Format("Profile '{0}' Created", name + " " + surname));
            Session["UserStatus"] = name + " " + surname;

            Response.Redirect("Index.aspx");
        }
    }
}