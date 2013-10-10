using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace SPortal
{
    public partial class WebForm9 : Page
    {
        private Panel pnlComment;
        private bool isPostEnabled;
        private TextBox txtPost;

        protected void Page_Load(object sender, EventArgs e)
        {
            Cookie.SetSessionFromCookie(this);

            isPostEnabled = Session["User"] == null ? false : true;

            try
            {
                if (Request.QueryString["TopicID"] == null)
                    throw new Exception("Could not load the topics.");

                int id = Convert.ToInt16(Request.QueryString["TopicID"]);

                Topic topic = Topic.GetTopicByID(id);
                List<Post> replies = Post.GetPostsByTopicID(topic.Id);
                User user; // = BLL.User.GetUserByUsername("Admin");

                LoadHeader(pnlTopic, topic);

                foreach (Post reply in replies)
                {
                    user = BLL.User.GetUserByUsername(reply.Username);
                    LoadUserInfo(pnlTopic, user, topic, reply);
                    LoadUserPost(pnlTopic, reply);
                    AddUserCommentSection(pnlTopic, reply);
                }

                //Panel pnlTopicPost = (Panel) this.FindControl("pnlTopicPost");
                LoadPostArea(pnlTopicPost);

            }
            catch (Exception ex)
            {
                var pnlTopicHeader = new Panel();

                //Topic Header

                pnlTopicHeader.CssClass = "TopicHeader";
                pnlTopicHeader.Controls.Add(new Literal {Text = ex.Message});
                pnlTopic.Controls.Add(pnlTopicHeader);
            }
            //LoadUserInfo(pnlTopic, user, topic);
        }

        public void LoadPostArea(Panel parent)
        {
            Panel pnlPost = new Panel();
            pnlPost.Attributes.Add("style", "font-family: 'Dekar'; font-size: 25pt;");

            isPostEnabled = Session["User"] == null ? false : true;

            if (!isPostEnabled)
                CreateLoginArea(pnlPost);
            else
            {
                Panel pnlPostContent = new Panel();
                pnlPostContent.Attributes.Add("style", "font-family: 'Dekar'; font-size: 25pt;");

                Label lblPost = new Label() {Text = "Post your Reply:<hr>"};

                txtPost = new TextBox() { ID = "txtPost",  CssClass = "myTextAreas", TextMode = TextBoxMode.MultiLine, Width = Unit.Percentage(98), Height = 170};
                txtPost.Font.Name = "Arial";

                ImageButton btnPost = new ImageButton() { ImageUrl = "~/img-demo/NewButtonsComment.png", Height = 33, Width = 103, ID = "btnPostReply", CssClass = "confirmPost" };
                btnPost.Attributes.Add("style", "float: right; margin-right: 0.5em; margin-top: 0.4em;");
                btnPost.Click += btnPostReply_OnClick;

                Panel pnlText = new Panel();
                pnlText.Attributes.Add("style", "background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; float: left; font-size: 10pt; height: auto; padding: 10px; width: 90%;");

                //pnlText.Controls.Add(lblPost);
                pnlText.Controls.Add(txtPost);
                pnlText.Controls.Add(btnPost);

                pnlPostContent.Controls.Add(pnlText);

                pnlPost.Controls.Add(lblPost);
                pnlPost.Controls.Add(pnlPostContent);
            }

            parent.Controls.Add(pnlPost);
        }

        public void LoadHeader(Panel parent, Topic topic)
        {
            var pnlTopicHeader = new Panel();

            //Topic Header

            pnlTopicHeader.CssClass = "TopicHeader";
            pnlTopicHeader.Controls.Add(new Literal {Text = topic.Name});

            var imgRating = new Image[topic.GetRating()];
            for (int a = 0; a < topic.GetRating(); a++)
            {
                imgRating[a] = new Image();
                imgRating[a].Width = 25;
                imgRating[a].Height = 26;
                imgRating[a].AlternateText = "Rating";

                imgRating[a].ImageUrl = "images/fire.png";
            }

            foreach (Image rate in imgRating)
            {
                pnlTopicHeader.Controls.Add(new Literal {Text = "&nbsp"});
                pnlTopicHeader.Controls.Add(rate);
            }

            pnlTopicHeader.Controls.Add(new Literal {Text = string.Format("<hr style=\"width: 100%\"/>")});

            var pnlTopicBody = new Panel();
            pnlTopicBody.Attributes.Add("style",
                "float: left; background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; margin-top: 10px; padding: 10px; width: 90%;");
            var lblTopicBody = new Label {Text = topic.Text};

            pnlTopicBody.Controls.Add(lblTopicBody);
            pnlTopicHeader.Controls.Add(pnlTopicBody);

            pnlTopicHeader.CssClass = "TopicHeader";
            pnlTopicHeader.Controls.Add(new Literal {Text = "<br/><br/>Replies<hr/>"});

            parent.Controls.Add(pnlTopicHeader);
        }

        public void LoadUserInfo(Panel parent, User user, Topic topic, Post post)
        {
            // TopicUser

            // Votes
            var userInfo = new Panel {ID = "UserInfo" + post.Id, CssClass = "UserInfo"};
            var tblVotes = new Table {Width = Unit.Percentage(10)};
            tblVotes.Attributes.Add("style", "float: left;");
            userInfo.Attributes.Add("style", "float: left;");
            var voteRows = new TableRow[3];
            Image img;

            for (int a = 0; a < 3; a++)
            {
                var cell = new TableCell {HorizontalAlign = HorizontalAlign.Center};

                voteRows[a] = new TableRow {Height = 50, Width = 70};

                switch (a)
                {
                    case 0:
                        img = new Image
                        {
                            ImageUrl = "Images/VotingIconUp.png",
                            Height = 23,
                            Width = 35,
                            AlternateText = "Vote Up"
                        };
                        cell.Controls.Add(img);
                        break;
                    case 1:
                        var topicRating = new Literal {Text = post.GetPostRating().ToString()};
                        cell.Controls.Add(topicRating);
                        break;
                    case 2:
                        img = new Image
                        {
                            ImageUrl = "Images/VotingIconDown.png",
                            Height = 23,
                            Width = 35,
                            AlternateText = "Vote Down"
                        };
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

            var profile = new Panel();
            profile.Attributes.Add("style", "float: left; padding: 20px; height: 110px; width: 110px");
            var imgProfile = new Image {ImageUrl = user.Picture, Height = 110, Width = 110};
            profile.Controls.Add(imgProfile);

            // Profile Name

            var tblName = new Table();
            tblName.Attributes.Add("style", "margin-left: -8px;");
            tblName.Rows.Add(new TableRow());
            tblName.Rows[0].Cells.Add(new TableCell());
            tblName.Rows[0].Cells[0].Text = user.Username;
            tblName.Rows[0].Cells[0].Attributes.Add("style", "color: #18adad; padding-top: 1em; margin-bottom: -1em");

            // Profile Information

            var tblInformation = new Table();
            tblInformation.Attributes.Add("style", "width: 10%; margin-top: 1em; margin-left: -10px");
            tblInformation.Rows.Add(new TableRow());
            tblInformation.Rows.Add(new TableRow());
            tblInformation.Rows[0].Cells.Add(new TableCell
            {
                Text = string.Format("Total Replies: ({0})", user.GetPostsAmount(user.Username)),
                HorizontalAlign = HorizontalAlign.Center
            });
            tblInformation.Rows[1].Cells.Add(new TableCell
            {
                Text = "&bigstar;&bigstar;&bigstar;&bigstar;&bigstar;",
                HorizontalAlign = HorizontalAlign.Center
            });

            // Sharing + Buttons
            var tblButtons = new Table();
            tblButtons.Attributes.Add("style", "width: 50%; margin-top: -110px; margin-left: 300px; float: left;");
            tblButtons.Rows.Add(new TableRow());
            tblButtons.Rows.Add(new TableRow());
            tblButtons.Rows[0].Cells.Add(new TableCell
            {
                Text = "&bullet; SPortal Chat",
                HorizontalAlign = HorizontalAlign.Center
            });
            tblButtons.Rows[0].Cells.Add(new TableCell
            {
                Text = "&bullet; Profile",
                HorizontalAlign = HorizontalAlign.Center
            });
            tblButtons.Rows[0].Cells.Add(new TableCell
            {
                Text = "&bullet; Facebook",
                HorizontalAlign = HorizontalAlign.Center
            });
            tblButtons.Rows[0].Cells.Add(new TableCell
            {
                Text = "&bullet; Twitter",
                HorizontalAlign = HorizontalAlign.Center
            });
            tblButtons.Rows[1].Cells.Add(new TableCell());
            tblButtons.Rows[1].Cells.Add(new TableCell());
            tblButtons.Rows[1].Cells.Add(new TableCell());
            tblButtons.Rows[1].Cells.Add(new TableCell());

            for (int a = 0; a < 4; a++)
                tblButtons.Rows[0].Cells[a].Attributes.Add("style", "color: #18adad;");

            var btnComment = new Image
            {
                ImageUrl = "img-demo/NewButtonsComment.png",
                Width = 103,
                Height = 33,
                CssClass = "showComment"
            };
            btnComment.Attributes.Add("onclick", string.Format("ToggleVisibility(\"cphMain_postComment{0}\")", post.Id));
            var btnProfile = new ImageButton {ImageUrl = "img-demo/NewButtonsProfile.png", Width = 103, Height = 33};
            var btnShare = new ImageButton {ImageUrl = "img-demo/NewButtonsShare.png", Width = 103, Height = 33};
            var btnReport = new ImageButton {ImageUrl = "img-demo/NewButtonsReport.png", Width = 103, Height = 33};

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

            var pnlPost = new Panel();
            pnlPost.Attributes.Add("style",
                "float: left; background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; margin-top: 10px; padding: 10px; width: 90%; margin-bottom: 2em");
            var lblPost = new Label {Text = post.Text};

            pnlPost.Controls.Add(lblPost);

            parent.Controls.Add(pnlPost);

            AddUserRepliesSection(pnlTopic, Post.GetPostsReplies(post.Id));
        }

        public void AddUserRepliesSection(Panel parent, List<Post> replies)
        {
            if (replies.Count > 0)
            {
                var pnlReplies = new Panel();
                pnlReplies.CssClass = "UserInfo";
                pnlReplies.Attributes.Add("style",
                    "float: left; font-family: Arial; margin-left: 4em; margin-top: 1em; margin-bottom: 1em; padding-bottom: 1em; padding-top: 1em; width: 79%;");

                foreach (Post reply in replies)
                {
                    var pnlContent = new Panel();
                    pnlContent.Attributes.Add("style", "float: left; width: 100%;");

                    var rating = new Label {Text = string.Format("{0}", (reply.Upvotes - reply.Downvotes))};
                    rating.Attributes.Add("style",
                        "color: chocolate; float: left; margin-left: -1em; margin-right: 1em;");

                    var post = new Panel();
                    post.Attributes.Add("style", "float: left; width: 96%;");

                    var lblPost = new Label
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

        public void CreateLoginArea(Panel parent)
        {
            var pnlHeader = new Panel();
            pnlHeader.Attributes.Add("style", "margin-left: 2em; float: left; width: 88%");
            //pnlHeader.Controls.Add(new Literal(){ Text="<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/><br/>"});
            var pnlHeaderText = new Panel();
            pnlHeaderText.Attributes.Add("style", "font-family: 'Dekar'; font-size: 17pt; color: honeydew;");
            pnlHeaderText.Controls.Add(new Literal
            {
                Text =
                    "<a id=\"NormalLinks\" href=\"Login.aspx\">Login</a> or <a  id=\"NormalLinks\" href=\"Register.aspx\">Register</a> to Post Replies<hr/>"
            });

            pnlHeader.Controls.Add(pnlHeaderText);

            parent.Controls.Add(pnlHeader);
        }

        public void AddUserCommentSection(Panel parent, Post post)
        {
            // User Comment

            pnlComment = new Panel { ID = "postComment" + post.Id, CssClass = "hidden" }; // Add Reply post ID here.

            if (isPostEnabled)
            {

                //pnlComment = new Panel {ID = "postComment" + post.Id, CssClass = "hidden"}; // Add Reply post ID here.
                var lblComment = new Label {Text = "<br/>Post Comment Here:"};
                pnlComment.Attributes.Add("style", "float: left; width: 100%");
                pnlComment.Controls.Add(lblComment);
                var pnlCommentContent = new Panel();
                pnlCommentContent.Attributes.Add("style",
                    "background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%; margin-top: 1em; float: left");

                var replyComment = new TextBox();
                replyComment.ID = "txtPost" + post.Id;
                replyComment.CssClass = "myTextAreas";
                replyComment.TextMode = TextBoxMode.MultiLine;
                replyComment.Width = Unit.Percentage(98);
                replyComment.Font.Name = "Arial";

                var btnPost = new ImageButton
                {
                    ID = "btnPost" + post.Id,
                    ImageUrl = "~/img-demo/NewButtonsComment.png",
                    Height = 33,
                    Width = 103
                };
                btnPost.Attributes.Add("style", "float: right; margin-right: 0.5em; margin-top: 0.4em;");
                btnPost.Attributes.Add("onclick", "return confirm('Upload your Reply?');");
                btnPost.Click += btnPostCommentReply_Click;

                pnlCommentContent.Controls.Add(replyComment);
                pnlCommentContent.Controls.Add(btnPost);
                pnlComment.Controls.Add(pnlCommentContent);
            }
            else
            {
                CreateLoginArea(pnlComment);
            }

            //Label hr = new Label() { Text = "<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/>" };
            ////hr.Attributes.Add("style", "float: left;");

            //pnlComment.Controls.Add(hr);

            var closing = new Panel();
            closing.Attributes.Add("style",
                "height: 1em; margin-top: 2em; margin-bottom: 1em; float: left; width: 100%;");
            var hr = new Label {Text = "<hr style=\"border-color: #40e0d0; background-color: #40e0d0\"/>"};
            //hr.Attributes.Add("style", "float: left;");
            var clear = new Panel();
            //clear.Attributes.Add("style", "float: none;");

            closing.Controls.Add(hr);
            closing.Controls.Add(clear);

            parent.Controls.Add(pnlComment);
            parent.Controls.Add(closing);
        }

        private void btnPostCommentReply_Click(object sender, ImageClickEventArgs e)
        {
            var temp = (ImageButton) (sender);

            int postID = Convert.ToInt16(temp.ID.Remove(0, 7));
            int topicID = Convert.ToInt16(Request.QueryString["TopicID"]);

            var post = (TextBox) pnlComment.FindControl("txtPost" + postID);

            if (Post.CreatePostReply(PostType.CHILD, post.Text, Session["User"].ToString(), postID))
            {
                Response.Redirect("Topic.aspx?TopicID=" + topicID);
            }
        }

        private void btnPost_Click(object sender, ImageClickEventArgs e)
        {
            //throw new NotImplementedException();
        }

        protected void btnPostReply_OnClick(object sender, ImageClickEventArgs e)
        {
            string post = txtPost.Text;
            int topicID = Convert.ToInt16(Request.QueryString["TopicID"]);

            if (Post.CreatePost(PostType.PARENT, post, Session["User"].ToString(), topicID))
            {
                Response.Redirect("Topic.aspx?TopicID=" + topicID);
            }
        }
    }
}