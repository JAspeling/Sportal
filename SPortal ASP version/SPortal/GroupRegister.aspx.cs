using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace SPortal
{
    public partial class GroupRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            bool limited = dropLimited.SelectedItem.Value == "Private";
            string name = txtName.Text;
            string description = txtDescription.Text;

            Group.CreateGroup(name, description, Session["User"].ToString(), limited);

            Response.Redirect("Forum.aspx");
        }
    }
}