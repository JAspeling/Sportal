using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
using AjaxControlToolkit;
using BLL;
using HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign;
using Label = System.Web.UI.WebControls.Label;
using Panel = System.Web.UI.WebControls.Panel;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace SPortal
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private Panel pnlPostArea;

        private string post, description, name;

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (IsPostBack)
            //{
            //    post = txtPost.Text;
            //    description = txtDescription.Text;
            //    name = txtName.Text;
            //}

            if (Session["User"] == null)
                Cookie.SetSessionFromCookie(this);

            bool isPostEnabled = Session["User"] == null ? false : true;

            List<Topic> topics = Topic.GetTopics();

            foreach (var topic in topics)
            {
                Panel pnlParent = new Panel();
                switch (topic.TopicType)
                {
                    case "General" :
                        pnlParent = pnlGeneral;
                        break;
                    case "Institution" :
                        pnlParent = pnlInstitution;
                        break;
                    case "Group" :
                        pnlParent = pnlGroup;
                        break;
                }

                LoadNewPost(topic, pnlParent);
            }

            if (isPostEnabled)
            {
                CreatePostArea(pnlGeneral, "General");
                CreatePostArea(pnlInstitution, "Institution");
                CreatePostArea(pnlGroup, "Group");
            }
            else
            {
                CreateLoginArea(pnlGeneral);
                CreateLoginArea(pnlInstitution);
                CreateLoginArea(pnlGroup);
            }

            //if (IsPostBack)
            //{
            //    post = txtPost.Text;
            //    description = txtDescription.Text;
            //    name = txtName.Text;
            //}

            //LoadNewPost("MultiThreading", "This is a topic description", 10, DateTime.Now, DateTime.Now.AddMinutes(-54), pnlGeneral);
            //LoadNewPost("Testing", "This is a longer topic description to test the word wrapping of the table. The table width should remain the same but the text should just overflow as it reaches the maximum width", 10, DateTime.Now, DateTime.Now.AddMinutes(-54), pnlGeneral);
        }

        public void CreateLoginArea(Panel parent)
        {
            Panel pnlHeader = new Panel();
            pnlHeader.Attributes.Add("style", "margin-left: 2em;");
            //pnlHeader.Controls.Add(new Literal(){ Text="<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/><br/>"});
            Panel pnlHeaderText = new Panel();
            pnlHeaderText.Attributes.Add("style", "font-family: 'Dekar'; font-size: 17pt; color: honeydew");
            pnlHeaderText.Controls.Add(new Literal() { Text = "<a id=\"NormalLinks\" href=\"Login.aspx\">Login</a> or <a  id=\"NormalLinks\" href=\"Register.aspx\">Register</a> to Post Topics<hr/>" });

            pnlHeader.Controls.Add(pnlHeaderText);

            parent.Controls.Add(pnlHeader);
        }

        public void CreatePostArea(Panel parent, string type)
        {
            Panel pnlHeader = new Panel();
            pnlHeader.Attributes.Add("style", "margin-left: 2em;");
            //pnlHeader.Controls.Add(new Literal(){ Text="<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/><br/>"});
            Panel pnlHeaderText = new Panel();
            pnlHeaderText.Attributes.Add("style", "font-family: 'Dekar'; font-size: 17pt; color: honeydew");
            pnlHeaderText.Controls.Add(new Literal() {Text = "Create a New Topic<hr/>"}) ;

            pnlPostArea = new Panel() {CssClass = "UserInfo"};
            pnlPostArea.Attributes.Add("style", "margin-bottom: 2em; margin-top: 1em; margin-right: 4em; padding-top: 1em; padding-bottom: 0.5em; border-radius: 0.5em;");
            pnlPostArea.ID = "pnlPost" + type;


            Label lblName = new Label() {Text = "Topic Name<br/>"};
            lblName.Attributes.Add("style", "width: 100%;");
            lblName.Font.Name = "Dekar";
            lblName.Font.Size = FontUnit.Point(12);
            TextBox txtName = new TextBox();
            txtName.ID = "txtName" + type;
            txtName.CssClass = "myTextAreas";

            Label lblDescription = new Label() { Text = "<br/>Brief Description<br/>" };
            lblDescription.Font.Name = "Dekar";
            lblDescription.Font.Size = FontUnit.Point(12);
            TextBox txtDescription = new TextBox() {TextMode = TextBoxMode.MultiLine};
            txtDescription.Attributes.Add("style", "width: 100%;");
            txtDescription.ID = "txtDescription" + type;
            txtDescription.CssClass = "myTextAreas";

            Label lblBody = new Label() {Text = "<br/>Body of Topic<br/>"};
            lblBody.Font.Name = "Dekar";
            lblBody.Font.Size = FontUnit.Point(12);

            //TextBox txtPost = new TextBox();
            //txtPost.CssClass = "myTextAreas";
            //txtPost.TextMode = TextBoxMode.MultiLine;
            //txtPost.Width = 790;
            //txtPost.Font.Name = "Arial";

            TextBox txtPost = new TextBox();
            txtPost.ID = "txtPost" + type;
            txtPost.Font.Name = "Arial";
            txtPost.TextMode = TextBoxMode.MultiLine;
            txtPost.CssClass = "myTextAreas";
            txtPost.Height = 91;
            txtPost.Width = 646;

            pnlPostArea.Controls.Add(lblName);
            pnlPostArea.Controls.Add(txtName);
            pnlPostArea.Controls.Add(lblDescription);
            pnlPostArea.Controls.Add(txtDescription);
            pnlPostArea.Controls.Add(lblBody);
            pnlPostArea.Controls.Add(txtPost);

            Panel pnlButtons = new Panel();
            pnlButtons.Attributes.Add("style", "float: right; margin-top: 1em; margin-right: 0.5em;");
            ImageButton btnPost = new ImageButton() { ID="btnPost" + type, ImageUrl = "~/img-demo/NewButtonsComment.png", Height = 33, Width = 103};
            btnPost.Attributes.Add("style", "margin-left: 1em;");
            btnPost.Attributes.Add("onclick", "return confirm('Upload the post?');");
            btnPost.Click += btnPost_Click;

            pnlButtons.Controls.Add(btnPost);

            pnlPostArea.Controls.Add(pnlButtons);

            pnlHeader.Controls.Add(pnlHeaderText);
            pnlHeader.Controls.Add(pnlPostArea);

            parent.Controls.Add(pnlHeader);

        }

        void btnPost_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton temp = (ImageButton) (sender);
            string type = string.Empty;
            int typeID = 0;
            switch (temp.ID)
            {
                case "btnPostGeneral" :
                    type = "General";
                    typeID = 1;
                    break;
                case "btnPostInstitution" :
                    type = "Institution";
                    typeID = 2;
                    break;
                case "btnPostGroup" :
                    type = "Group";
                    typeID = 3;
                    break;
            }

            TextBox name = (TextBox)pnlPostArea.FindControl(string.Format("txtName{0}", type));
            TextBox description = (TextBox)pnlPostArea.FindControl(string.Format("txtDescription{0}", type));
            TextBox post = (TextBox)pnlPostArea.FindControl(string.Format("txtPost{0}", type));


            //Response.Write(txtPost.Text);

            if (Topic.CreateTopic(name.Text, description.Text, post.Text, typeID, Session["User"].ToString()))
            {
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", string.Format("AlertPost({0}, {1})", pnlPostArea.FindControl(string.Format("txtName{0}", type)), type), true);
                Response.Redirect("Forum.aspx");
            }
        }

        public void CreatePostPicture(string imagePath, Panel parent)
        {
            Table tblImage = new Table();
            tblImage.Attributes.Add("style", "float: left;");
            TableRow tr = new TableRow();

            Image imgStatus = new Image();
            imgStatus.ImageUrl = imagePath;
            imgStatus.Width = 50;
            imgStatus.Height = 50;

            TableCell td = new TableCell();
            td.Controls.Add(imgStatus);
            tr.Cells.Add(td);

            tblImage.Rows.Add(tr);

            parent.Controls.Add(tblImage);
        }

        public void CreateTableRow(ref Table table, string topicId, string header1, string header2, string header3, string header4, bool isHeader)
        {
            TableRow tr = new TableRow();

            TableCell[] tds = new TableCell[4];

            for (int b = 0; b < 4; b++)
                tds[b] = new TableCell();

            if (header1.Length >= 190)
            {
                tds[0].Text = string.Format("{0} {1}", header1.LimitLength(190),
                        "<a href=\"Forum.aspx?Expand=" + topicId + "\"> View more</a>");
                
                if (topicId == Request.QueryString["Expand"])
                    tds[0].Text = string.Format("{0}", header1);

            }
            else
            {
                tds[0].Text = header1;
            }

            if (isHeader)
                tds[0].Text = "<a id=\"ForumLinks\" href=\"Topic.aspx?TopicID=" + topicId + "\">" + header1 + "</a>";

            tds[0].Width = Unit.Percentage(70);
            tds[1].Text = header2;
            tds[1].HorizontalAlign = HorizontalAlign.Center;
            tds[2].Text = header3;
            tds[2].HorizontalAlign = HorizontalAlign.Center;
            tds[3].Text = header4;
            tds[3].HorizontalAlign = HorizontalAlign.Center;

            foreach (var cell in tds)
            {
                if (isHeader)
                cell.Attributes.Add("style", "border-style: solid; border-width: 0px; border-bottom: 1px white solid;");
                tr.Cells.Add(cell);
            }

            table.Rows.Add(tr);
        }

        public void LoadNewPost(Topic topic, Panel parent)
        {
            HiddenField topicId = new HiddenField() {Value = topic.Id.ToString()};
            parent.Controls.Add(topicId);

            CreatePostPicture("~/images/LOGO.png", parent);

            Table tblTopic = new Table();
            tblTopic.Width = Unit.Percentage(90);

            CreateTableRow(ref tblTopic, topicId.Value, topic.Name, "Replies", "Created", "Last Reply", true);
            CreateTableRow(ref tblTopic, topicId.Value, topic.Description, topic.GetTopicReplyAmount().ToString(), topic.Date.ToString(), DateTime.Now.ToString(), false);

            tblTopic.Attributes.Add("style", "margin-bottom: 15px;");

            parent.Controls.Add(tblTopic);

            parent.Controls.Add(new Label() { Text = "<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/>" });
        }
    }
}