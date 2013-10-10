using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BLL;
using Image = System.Web.UI.WebControls.Image;

namespace SPortal
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        private Panel pnlComment;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["TopicID"] == null)
                    throw new Exception("Could not load the topics.");

                int id = Convert.ToInt16(Request.QueryString["TopicID"]);

                Topic topic = Topic.GetTopicByID(id);
                List<Post> replies = Post.GetPostsByTopicID(topic.Id);
                User user; // = BLL.User.GetUserByUsername("Admin");

                LoadHeader(pnlTopic, topic);

                foreach (var reply in replies)
                {
                    user = BLL.User.GetUserByUsername(reply.Username);
                    LoadUserInfo(pnlTopic, user, topic, reply);
                    LoadUserPost(pnlTopic, reply);
                    AddUserCommentSection(pnlTopic, reply);
                }
            }
            catch (Exception ex)
            {
                Panel pnlTopicHeader = new Panel();

                //Topic Header

                pnlTopicHeader.CssClass = "TopicHeader";
                pnlTopicHeader.Controls.Add(new Literal() { Text = ex.Message });
                pnlTopic.Controls.Add(pnlTopicHeader);
            }
            //LoadUserInfo(pnlTopic, user, topic);
        }

        public void LoadHeader(Panel parent, Topic topic)
        {
            Panel pnlTopicHeader = new Panel();

            //Topic Header

            pnlTopicHeader.CssClass = "TopicHeader";
            pnlTopicHeader.Controls.Add(new Literal() { Text = topic.Name });

            Image[] imgRating = new Image[topic.GetRating()];
            for (int a = 0; a < topic.GetRating(); a++)
            {
                imgRating[a] = new Image();
                imgRating[a].Width = 25;
                imgRating[a].Height = 26;
                imgRating[a].AlternateText = "Rating";

                imgRating[a].ImageUrl = "images/fire.png";
            }

            foreach (var rate in imgRating)
            {
                pnlTopicHeader.Controls.Add(new Literal() { Text = "&nbsp" });
                pnlTopicHeader.Controls.Add(rate);
            }

            pnlTopicHeader.Controls.Add(new Literal() { Text = string.Format("<hr style=\"width: 100%\"/>") });

            Panel pnlTopicBody = new Panel();
            pnlTopicBody.Attributes.Add("style", "float: left; background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; margin-top: 10px; padding: 10px; width: 90%;");
            Label lblTopicBody = new Label() {Text = topic.Text};

            pnlTopicBody.Controls.Add(lblTopicBody);
            pnlTopicHeader.Controls.Add(pnlTopicBody);

            pnlTopicHeader.CssClass = "TopicHeader";
            pnlTopicHeader.Controls.Add(new Literal() { Text = "<br/><br/>Replies<hr/>" });

            parent.Controls.Add(pnlTopicHeader);
        }

        public void LoadUserInfo(Panel parent, User user, Topic topic, Post post)
        {
            // TopicUser

            // Votes
            Panel userInfo = new Panel() { ID = "UserInfo" + post.Id, CssClass = "UserInfo" };
            Table tblVotes = new Table() { Width = Unit.Percentage(10) };
            tblVotes.Attributes.Add("style", "float: left;");
            userInfo.Attributes.Add("style", "float: left;");
            TableRow[] voteRows = new TableRow[3];
            Image img;

            for (int a = 0; a < 3; a++)
            {
                TableCell cell = new TableCell() { HorizontalAlign = HorizontalAlign.Center };

                voteRows[a] = new TableRow() { Height = 50, Width = 70 };

                switch (a)
                {
                    case 0: img = new Image() { ImageUrl = "Images/VotingIconUp.png", Height = 23, Width = 35, AlternateText = "Vote Up" };
                        cell.Controls.Add(img);
                        break;
                    case 1: Literal topicRating = new Literal() { Text = post.GetPostRating().ToString() };
                        cell.Controls.Add(topicRating);
                        break;
                    case 2: img = new Image() { ImageUrl = "Images/VotingIconDown.png", Height = 23, Width = 35, AlternateText = "Vote Down" };
                        cell.Controls.Add(img);
                        break;
                }
                voteRows[a].Cells.Add(cell);
                voteRows[a].Cells[0].Attributes.Add("style", "height: 23px;");
            }

            tblVotes.Rows.Add(voteRows[0]);
            tblVotes.Rows.Add(voteRows[1]);
            tblVotes.Rows.Add(voteRows[2]);

            // Profile Picture

            Panel profile = new Panel();
            profile.Attributes.Add("style", "float: left; padding: 20px; height: 110px; width: 110px");
            Image imgProfile = new Image() { ImageUrl = user.Picture, Height = 110, Width = 110 };
            profile.Controls.Add(imgProfile);

            // Profile Name

            Table tblName = new Table();
            tblName.Attributes.Add("style", "margin-left: -8px;");
            tblName.Rows.Add(new TableRow());
            tblName.Rows[0].Cells.Add(new TableCell());
            tblName.Rows[0].Cells[0].Text = user.Username;
            tblName.Rows[0].Cells[0].Attributes.Add("style", "color: #18adad; padding-top: 1em; margin-bottom: -1em");

            // Profile Information

            Table tblInformation = new Table();
            tblInformation.Attributes.Add("style", "width: 10%; margin-top: 1em; margin-left: -10px");
            tblInformation.Rows.Add(new TableRow());
            tblInformation.Rows.Add(new TableRow());
            tblInformation.Rows[0].Cells.Add(new TableCell() { Text = string.Format("Total Replies: ({0})", user.GetPostsAmount(user.Username)), HorizontalAlign = HorizontalAlign.Center });
            tblInformation.Rows[1].Cells.Add(new TableCell() { Text = "&bigstar;&bigstar;&bigstar;&bigstar;&bigstar;", HorizontalAlign = HorizontalAlign.Center });

            // Sharing + Buttons
            Table tblButtons = new Table();
            tblButtons.Attributes.Add("style", "width: 50%; margin-top: -110px; margin-left: 300px; float: left;");
            tblButtons.Rows.Add(new TableRow());
            tblButtons.Rows.Add(new TableRow());
            tblButtons.Rows[0].Cells.Add(new TableCell() { Text = "&bullet; SPortal Chat", HorizontalAlign = HorizontalAlign.Center });
            tblButtons.Rows[0].Cells.Add(new TableCell() { Text = "&bullet; Profile", HorizontalAlign = HorizontalAlign.Center });
            tblButtons.Rows[0].Cells.Add(new TableCell() { Text = "&bullet; Facebook", HorizontalAlign = HorizontalAlign.Center });
            tblButtons.Rows[0].Cells.Add(new TableCell() { Text = "&bullet; Twitter", HorizontalAlign = HorizontalAlign.Center });
            tblButtons.Rows[1].Cells.Add(new TableCell());
            tblButtons.Rows[1].Cells.Add(new TableCell());
            tblButtons.Rows[1].Cells.Add(new TableCell());
            tblButtons.Rows[1].Cells.Add(new TableCell());

            for (int a = 0; a < 4; a++)
                tblButtons.Rows[0].Cells[a].Attributes.Add("style", "color: #18adad;");

            Image btnComment = new Image() { ImageUrl = "img-demo/NewButtonsComment.png", Width = 103, Height = 33, CssClass = "showComment" };
            btnComment.Attributes.Add("onclick", string.Format("ToggleVisibility(\"cphMain_postComment{0}\")", post.Id));
            ImageButton btnProfile = new ImageButton() { ImageUrl = "img-demo/NewButtonsProfile.png", Width = 103, Height = 33 };
            ImageButton btnShare = new ImageButton() { ImageUrl = "img-demo/NewButtonsShare.png", Width = 103, Height = 33 };
            ImageButton btnReport = new ImageButton() { ImageUrl = "img-demo/NewButtonsReport.png", Width = 103, Height = 33 };

            tblButtons.Rows[1].Cells[0].Controls.Add(btnComment);
            tblButtons.Rows[1].Cells[1].Controls.Add(btnProfile);
            tblButtons.Rows[1].Cells[2].Controls.Add(btnShare);
            tblButtons.Rows[1].Cells[3].Controls.Add(btnReport);

            userInfo.Controls.Add(tblVotes);
            userInfo.Controls.Add(profile);
            userInfo.Controls.Add(tblName);
            userInfo.Controls.Add(tblInformation);
            userInfo.Controls.Add(tblButtons);

            parent.Controls.Add(userInfo);
        }

        public void LoadUserPost(Panel parent, Post post)
        {
            // User Post

            Panel pnlPost = new Panel();
            pnlPost.Attributes.Add("style", "float: left; background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; margin-top: 10px; padding: 10px; width: 90%; margin-bottom: 2em");
            Label lblPost = new Label() {Text = post.Text};

            pnlPost.Controls.Add(lblPost);

            parent.Controls.Add(pnlPost);

            AddUserRepliesSection(pnlTopic, Post.GetPostsReplies(post.Id));
        }

        public void AddUserRepliesSection(Panel parent, List<Post> replies)
        {
            if (replies.Count > 0)
            {
                Panel pnlReplies = new Panel();
                pnlReplies.CssClass = "UserInfo";
                pnlReplies.Attributes.Add("style",
                    "float: left; font-family: Arial; margin-left: 4em; margin-top: 1em; padding-bottom: 1em; padding-top: 1em; width: 79%;");

                foreach (var reply in replies)
                {
                    Panel pnlContent = new Panel();
                    pnlContent.Attributes.Add("style", "float: left; width: 100%;");

                    Label rating = new Label() { Text = string.Format("{0}", (reply.Upvotes - reply.Downvotes)) };
                    rating.Attributes.Add("style", "color: chocolate; float: left; margin-left: -1em; margin-right: 1em;");

                    Panel post = new Panel();
                    post.Attributes.Add("style", "float: left; width: 96%;");

                    Label lblPost = new Label()
                    {
                        Text =
                            string.Format("{0} - {1}, {2}<hr>", reply.Text, reply.Username, reply.Date)
                    };

                    post.Controls.Add(lblPost);

                    pnlContent.Controls.Add(rating);
                    pnlContent.Controls.Add(post);

                    pnlReplies.Controls.Add((pnlContent));
                }
                

                parent.Controls.Add(pnlReplies);
            }
        }

        public void AddUserCommentSection(Panel parent, Post post)
        {
            // User Comment

            pnlComment = new Panel() { ID = "postComment" + post.Id, CssClass = "hidden" };        // Add Reply post ID here.
            Label lblComment = new Label() { Text = "<br/>Post Comment Here:" };
            pnlComment.Attributes.Add("style", "float: left; width: 100%");
            pnlComment.Controls.Add(lblComment);
            Panel pnlCommentContent = new Panel();
            pnlCommentContent.Attributes.Add("style", "background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%; margin-top: 1em; float: left");

            TextBox replyComment = new TextBox();
            replyComment.ID = "txtPost" + post.Id;
            replyComment.CssClass = "myTextAreas";
            replyComment.TextMode = TextBoxMode.MultiLine;
            replyComment.Width = Unit.Percentage(98);
            replyComment.Font.Name = "Arial";

            ImageButton btnPost = new ImageButton() { ID = "btnPost" + post.Id, ImageUrl = "~/img-demo/NewButtonsComment.png", Height = 33, Width = 103 };
            btnPost.Attributes.Add("style", "float: right; margin-right: 0.5em; margin-top: 0.4em;");
            btnPost.Attributes.Add("onclick", "return confirm('Upload your Reply?');");
            btnPost.Click += btnPostCommentReply_Click;

            pnlCommentContent.Controls.Add(replyComment);
            pnlCommentContent.Controls.Add(btnPost);
            pnlComment.Controls.Add(pnlCommentContent);

            //Label hr = new Label() { Text = "<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/>" };
            ////hr.Attributes.Add("style", "float: left;");

            //pnlComment.Controls.Add(hr);

            Panel closing = new Panel();
            closing.Attributes.Add("style", "height: 1em; margin-top: 2em; margin-bottom: 1em; float: left; width: 100%;");
            Label hr = new Label() { Text = "<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/>" };
            //hr.Attributes.Add("style", "float: left;");
            Panel clear = new Panel();
            //clear.Attributes.Add("style", "float: none;");

            closing.Controls.Add(hr);
            closing.Controls.Add(clear);

            parent.Controls.Add(pnlComment);
            parent.Controls.Add(closing);
        }

        private void btnPostCommentReply_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton temp = (ImageButton)(sender);

            int postID = Convert.ToInt16(temp.ID.Remove(0, 7));
            int topicID = Convert.ToInt16(Request.QueryString["TopicID"]);

            TextBox post = (TextBox)pnlComment.FindControl("txtPost" + postID);

            if (BLL.Post.CreatePostReply(PostType.CHILD, post.Text, Session["User"].ToString(), postID))
            {
                Response.Redirect("Topic.aspx?TopicID=" + topicID);
            }
        }

        void btnPost_Click(object sender, ImageClickEventArgs e)
        {
            //throw new NotImplementedException();
        }

        protected void btnPostReply_OnClick(object sender, ImageClickEventArgs e)
        {
            string post = txtPost.Text;
            int topicID = Convert.ToInt16(Request.QueryString["TopicID"]);

            if (BLL.Post.CreatePost(PostType.PARENT, post, Session["User"].ToString(), topicID))
            {
                Response.Redirect("Topic.aspx?TopicID=" + topicID);
            }
        }
    }
}