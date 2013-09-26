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
                btnLogout.Visible = true;
            }
            else
            {
                btnLogout.Visible = false;
            }

            lblStatus.Text = Session["UserStatus"] == null ? "" : Session["UserStatus"] + " Logged In - ";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Request.Cookies["SPortalUsername"].Expires = DateTime.Now;
            Session["UserStatus"] = null;

            string prevPage = Request.UrlReferrer.ToString();

            Response.Redirect(prevPage);
        }
    }
}