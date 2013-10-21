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

        protected void KeyPress(object sender, KeyEventArgs e)
        {
            switch ((Keys) e.KeyValue)
            {
                case Keys.Return:
                    btnOK_Click(this, new ImageClickEventArgs(0, 0));
                    break;
            }
        }

        protected void btnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnOK_Click(object sender, ImageClickEventArgs e)
        {
           // Connection connection = new Connection();

            if (Connection.Login(txtUsername.Text, txtPassword.Text))
            {
                Session["User"] = txtUsername.Text;

                if (chkRemember.Checked)
                {
                    Cookie.SetCookie(this, "SPortalUsername", txtUsername.Text, 2);
                }

                //MessageBox.Show("Login Success");
                Response.Redirect("Index.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "Message", "Message();", true);
            }
        }
    }
}