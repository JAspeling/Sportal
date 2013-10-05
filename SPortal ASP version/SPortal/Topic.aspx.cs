using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPortal
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel pnlTopicHeader = new Panel();

            pnlTopicHeader.CssClass = "TopicHeader";
            pnlTopicHeader.Controls.Add(new Literal() {Text = "Software Engineering"});

            Image[] rating = new Image[3];
            for (int a = 0; a < 3; a++)
            {
                rating[a] = new Image();
                rating[a].Width = 25;
                rating[a].Height = 26;
                rating[a].AlternateText = "Rating";
                
                rating[a].ImageUrl = "images/fire.png";
            }

            foreach (var rate in rating)
            {
                pnlTopicHeader.Controls.Add(new Literal(){Text = "&nbsp"});
                pnlTopicHeader.Controls.Add(rate);
            }

            pnlTopicHeader.Controls.Add(new Literal(){Text = "<hr/>"});

            pnlTopic.Controls.Add(pnlTopicHeader);
        }
    }
}