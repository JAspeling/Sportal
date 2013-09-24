using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPortal
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["SPortalUsername"];

            if (userCookie != null)
            {
                Session["UserStatus"] = userCookie.Value;
            }

            lblStatus.Text = Session["UserStatus"] == null ? "" : Session["UserStatus"].ToString() + " Logged In";
        }
    }
}