using System;
using System.Web.UI;

namespace SPortal
{
    public partial class Index : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblStatus.Text = Session["UserStatus"] == null ? "" : Session["UserStatus"].ToString() + " Logged In";
        }
    }
}