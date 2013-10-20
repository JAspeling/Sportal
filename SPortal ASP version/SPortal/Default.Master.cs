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
        ServiceReference1.Service1Client client;
        List<string> friends = new List<string> { };

        Unit index = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnLogin.ImageUrl = Cookie.SetSessionFromCookie(this.Page);
            
            lblStatus.Text = Session["User"] == null ? "" : Session["User"] + " Logged In - ";

            loadFriendsList();
            
        }

        protected override void OnInit(EventArgs e)
        {
            

            base.OnInit(e);
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            switch (btnLogin.ImageUrl)
            {
                case "images/sign.png" : // User is NOT logged in.
                    Response.Redirect("Login.aspx");
                    break;
                case "images/logout.png" : // User is logged in.

<<<<<<< HEAD

                    try
                    {
                        client = new ServiceReference1.Service1Client(new InstanceContext(new Client(this)));
                        client.Open();
                        friends = client.Join(Session["User"].ToString(), new string[] { "stefan", "carel" }).ToList();
                    }
                    catch
                    {
                        try
                        {
                            client = new ServiceReference1.Service1Client(new InstanceContext(new Client(this)));
                            client.Open();
                            friends = client.Join("stefan", new string[] { "stefan", "carel" }).ToList();
                        }
                        catch
                        {

                        }
                    }
=======
                    ServiceReference1.Service1Client client=new ServiceReference1.Service1Client(new InstanceContext(this));
>>>>>>> c00cabb22d8c9777df4cd2cebcfe5151ea0e5237

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

        public void loadFriendsList()
        {
            Panel friendsPanel = new Panel();
            friendsPanel.Attributes.Add("class","imPopUp");
            friendsPanel.Attributes.Add("style", "right: 0px; float: right");
            index = new Unit(16, UnitType.Percentage);
            int id = 1;
            foreach (string friend in friends)
            {

                Panel p = new Panel();
                p.Attributes.Add("style", "margin-left:5%; width:90%; height:30px; background-color:blue;");
               

                Label lblName = new Label();
                lblName.Text = friend;
                lblName.Attributes.Add("style", "margin-left:5%; width:90%; height:30px; background-color:cornflowerblue; ");


                Button b = new Button();
                b.Text = "Chat";
                b.ID = id.ToString();
                b.Attributes.Add("class", "imButton");
                b.Attributes.Add("onclick", "reply_click(this.id); return false;");

                p.Controls.Add(b);
                p.Controls.Add(lblName);
                friendsPanel.Controls.Add(p);
                friendsPanel.Controls.Add(CreateChatBox(friend,id));

                id++;
            }
            
            this.FindControl("imUpdatePanel").Controls.Add(friendsPanel);
     
        }




        public Panel CreateChatBox(string userName, int id)
        {

            Panel p = new Panel();
            p.Attributes.Add("class", "imPopUp");
            p.Width = new Unit(15, UnitType.Percentage);
            p.Visible = true;
            p.ID = "p" + id;
            p.Attributes.Add("style", "right:" + index.Value + "%");
            index = new Unit(index.Value + 16, UnitType.Percentage);
            

            Label lblName = new Label();
            lblName.Text = userName;
            lblName.ID = "l" + id;
            lblName.Attributes.Add("style", "margin-left:5%; width:90%; height:30px; background-color:cornflowerblue; ");

            TextBox txtArea = new TextBox();
            txtArea.ReadOnly = true;
            txtArea.ID = "i" + id;
            txtArea.Attributes.Add("style", "margin-left:5%;  margin-top:10px ;width:90%; height:230px; background-color:cornflowerblue; ");

            TextBox txtInput = new TextBox();
            txtInput.ID = "t" + id;
            txtInput.Attributes.Add("style", "margin-left:5%; margin-top:10px ;width:60%;background-color:cornflowerblue; ");

            

            Button btnSend = new Button();
            btnSend.Text = "Send";
            btnSend.ID = "b" + id;
            btnSend.Click += btnSend_Click;
            btnSend.Attributes.Add("onclick", "sendMessage(this.id)");

            UpdatePanel pnlUpdate = new UpdatePanel();
            pnlUpdate.ChildrenAsTriggers = true;
            pnlUpdate.ContentTemplateContainer.Controls.Add(btnSend);

            pnlUpdate.ContentTemplateContainer.Controls.Add(lblName);
            pnlUpdate.ContentTemplateContainer.Controls.Add(txtArea);
            pnlUpdate.ContentTemplateContainer.Controls.Add(txtInput);
            p.Controls.Add(pnlUpdate);

            return p;
        }

        void btnSend_Click(object s, EventArgs e)
        {
            TextBox txt = (TextBox)this.FindControl("p" + ((Button)s).ID.Substring(1)).FindControl("t" + ((Button)s).ID.Substring(1));
            Label lbl = (Label)this.FindControl("p" + ((Button)s).ID.Substring(1)).FindControl("l" + ((Button)s).ID.Substring(1));
            client.Message(txt.Text, lbl.Text);
            txt.Text = "";
        }
    
        #region Instant Message methods


        class Client : ServiceReference1.IService1Callback
        {
            Default d;
            public Client(Default d)
            {
                this.d = d;
            }

            public void OnMessage(string message,string userName)
            {
                ((TextBox)d.FindControl("p" + (d.friends.IndexOf(userName)+1).ToString()).FindControl("i" + (d.friends.IndexOf(userName)+1).ToString())).Text += message;
            }

            public void userJoined(string userName)
            {
                d.friends.Add(userName);
                d.CreateChatBox(userName, d.friends.Count - 1);
            }

            public void userLeft(string userName)
            {
                d.friends.Remove(userName);
            }
        }

        #endregion
    }
}