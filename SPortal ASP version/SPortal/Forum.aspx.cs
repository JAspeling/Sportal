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
using AjaxControlToolkit.HTMLEditor.ToolbarButton;
using BLL;
using HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign;
using Label = System.Web.UI.WebControls.Label;
using Panel = System.Web.UI.WebControls.Panel;

namespace SPortal
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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


            //LoadNewPost("MultiThreading", "This is a topic description", 10, DateTime.Now, DateTime.Now.AddMinutes(-54), pnlGeneral);
            //LoadNewPost("Testing", "This is a longer topic description to test the word wrapping of the table. The table width should remain the same but the text should just overflow as it reaches the maximum width", 10, DateTime.Now, DateTime.Now.AddMinutes(-54), pnlGeneral);
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
                tds[0].Text = "<a href=\"Topic.aspx?TopicID=" + topicId + "\">" + header1 + "</a>";

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