using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPortal
{
    public partial class Default : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnLogin.ImageUrl = Cookie.SetSessionFromCookie(this.Page);

            lblStatus.Text = Session["User"] == null ? "" : Session["User"] + " Logged In - ";
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            switch (btnLogin.ImageUrl)
            {
                case "images/sign.png" : // User is NOT logged in.
                    Response.Redirect("Login.aspx");
                    break;
                case "images/logout.png" : // User is logged in.

                    ServiceReference1.Service1Client client=new ServiceReference1.Service1Client(new InstanceContext(this));

                    Session["User"] = null;

                    if (Request.Cookies["SPortalUsername"] != null)
                    {
                        HttpCookie myCookie = new HttpCookie("SPortalUsername");
                        myCookie.Expires = DateTime.Now.AddDays(-1d);
                        Response.Cookies.Add(myCookie);
                    }
                    //Request.Cookies["SPortalUsername"].Expires = DateTime.Now;
                    //Request.Cookies.Remove("SPortalUsername");

                    btnLogin.ImageUrl = "images/sign.png";

                    Response.Redirect("Index.aspx");
                    break;
            }
        }
    }
}