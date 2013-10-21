using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Windows.Forms;

namespace SPortal
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        private Table tblGroups;

        protected void Page_Load(object sender, EventArgs e)
        {

            tblGroups = new Table();
            tblGroups.Attributes.Add("style", "width: 100%; border-style=solid; border-width:1px; color: white");

            if (!IsPostBack)
            {


                foreach (var group in Group.GetGroups())
                {
                    TableRow row = new TableRow();

                    TableCell[] cells = new TableCell[6];

                    for (int a = 0; a < 6; a++)
                        cells[a] = new TableCell();

                    cells[0].Text = group.Name;
                    cells[0].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[1].Text = group.Description;
                    cells[1].Attributes.Add("style",
                        "width: 50%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[2].Text = group.Founded.ToString("d");
                    cells[2].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[3].Text = group.Username;
                    cells[3].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[4].Text = "(10)";
                    cells[4].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    if (Session["User"] != null)
                    {
                        cells[5].Controls.Add(new System.Web.UI.WebControls.Button() { Text = "Join Group" });
                        cells[5].Attributes.Add("style",
                            "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    }
                    
                    for (int a = 0; a < 6; a++)
                        row.Cells.Add(cells[a]);

                    tblGroups.Rows.Add(row);
                }
            }
            pnlTimelineContainer.Controls.Add(tblGroups);
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            tblGroups = null;
            tblGroups = new Table();
            tblGroups.Attributes.Add("style", "color: white;");

            List<Group> groups = Group.GetGroupsByKeywords(txtSearch.Text);

            TableRow row = new TableRow();

            TableCell[] cells = new TableCell[6];

            for (int a = 0; a < 6; a++)
                cells[a] = new TableCell();

            cells[0].Text = "Name";
            cells[0].Attributes.Add("style",
                "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
            cells[1].Text = "Description";
            cells[1].Attributes.Add("style",
                "width: 50%;border-width: 1px;border-color: white;border-top-style: solid;");
            cells[2].Text = "Creation Date";
            cells[2].Attributes.Add("style",
                "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
            cells[3].Text = "Creator";
            cells[3].Attributes.Add("style",
                "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
            cells[4].Text = "Members";
            cells[4].Attributes.Add("style",
                "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
            cells[5].Text = "Join";
            cells[5].Attributes.Add("style",
                "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");


            for (int a = 0; a < 6; a++)
                row.Cells.Add(cells[a]);

            tblGroups.Rows.Add(row);

            if (groups != null)
            {
                foreach (var group in groups)
                {
                    row = new TableRow();

                    cells = new TableCell[6];

                    for (int a = 0; a < 6; a++)
                        cells[a] = new TableCell();

                    cells[0].Text = group.Name;
                    cells[0].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[1].Text = group.Description;
                    cells[1].Attributes.Add("style",
                        "width: 50%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[2].Text = group.Founded.ToString("d");
                    cells[2].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[3].Text = group.Username;
                    cells[3].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    cells[4].Text = "(x)";
                    cells[4].Attributes.Add("style",
                        "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    if (Session["User"] != null)
                    {
                        System.Web.UI.WebControls.Button temp = new System.Web.UI.WebControls.Button();
                        temp.ID = "btnJoin";
                        temp.Click += TempOnClick;
                        temp.Text = "Join Group";
                        cells[5].Controls.Add(temp);

                        cells[5].Attributes.Add("style",
                            "width: 10%;border-width: 1px;border-color: white;border-top-style: solid;");
                    }

                    for (int a = 0; a < 6; a++)
                        row.Cells.Add(cells[a]);

                    tblGroups.Rows.Add(row);
                }
            }
            pnlTimelineContainer.Controls.Add(tblGroups);
        }

        private void TempOnClick(object sender, EventArgs eventArgs)
        {
            // Join Group button
        }

        protected void txtSearch_KeyPress(object sender, KeyEventArgs e)
        {
            switch ((Keys)e.KeyValue)
            {
                case Keys.Return:
                    Unnamed2_Click(this, new ImageClickEventArgs(0, 0));
                    break;
            }
        }
    }
}