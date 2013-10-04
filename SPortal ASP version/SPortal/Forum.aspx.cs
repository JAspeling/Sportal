using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using AjaxControlToolkit.HTMLEditor.ToolbarButton;

namespace SPortal
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            LoadNewPost("MultiThreading", "This is a topic description", 10, DateTime.Now, DateTime.Now.AddMinutes(-54));
            LoadNewPost("Testing", "This is a longer topic description to test the word wrapping of the table. The table width should remain the same but the text should just overflow as it reaches the maximum width", 10, DateTime.Now, DateTime.Now.AddMinutes(-54));
        }

        public void CreatePostPicture(string imagePath)
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

            pnlGeneral.Controls.Add(tblImage);
        }

        public void CreateTableRow(ref Table table, string header1, string header2, string header3, string header4, bool isHeader)
        {
            TableRow tr = new TableRow();

            TableCell[] tds = new TableCell[4];

            for (int b = 0; b < 4; b++)
                tds[b] = new TableCell();

            tds[0].Text = header1;
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

        public void LoadNewPost(string topicName, string topicDescription, int replies, DateTime created, DateTime lastReply)
        {
            CreatePostPicture("~/images/LOGO.png");

            Table tblTopic = new Table();
            tblTopic.Width = Unit.Percentage(90);

            CreateTableRow(ref tblTopic, topicName, "Replies", "Created", "Last Reply", true);
            CreateTableRow(ref tblTopic, topicDescription, replies.ToString(), created.ToString(), lastReply.ToString(), false);
           // CreateTableRow(ref tblTopic, topicDescription, "123 398", "1 hour 12 min ago", "1 min 10 sec ago");

            tblTopic.Attributes.Add("style", "margin-bottom: 15px;");

            pnlGeneral.Controls.Add(tblTopic);

            pnlGeneral.Controls.Add(new Label() { Text = "<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/>" });
        }
    }
}