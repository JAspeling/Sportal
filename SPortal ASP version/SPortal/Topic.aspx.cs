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
                User user = BLL.User.GetUserByUsername(topic.Username);
                
                LoadHeader(pnlTopic, user, topic, null);

                foreach (Post reply in replies)
                {
                    user = BLL.User.GetUserByUsername(reply.Username);
                    LoadNewUserInfo(pnlTopic, user, topic);
                    LoadUserPost(pnlTopic, reply);
                    AddUserCommentSection(pnlTopic, reply);
                }

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
                pnlText.Attributes.Add("style", "background-image: url('images/TopicBack4.png'); background-repeat: repeat-x; border: solid black; border-radius: 1em; border-width: 2px; float: left; font-size: 10pt; height: auto; padding: 10px; width: 90%;");

                //pnlText.Controls.Add(lblPost);
                pnlText.Controls.Add(txtPost);
                pnlText.Controls.Add(btnPost);

                pnlPostContent.Controls.Add(pnlText);

                pnlPost.Controls.Add(lblPost);
                pnlPost.Controls.Add(pnlPostContent);
            }

            parent.Controls.Add(pnlPost);
        }

        public void LoadHeader(Panel parent,User user, Topic topic, Post post)
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


            // User Panel

            LoadNewUserInfo(pnlTopicHeader, user, topic);

            // Topic Body

            Panel pnlTopicBody = new Panel();
            pnlTopicBody.Attributes.Add("style",
                "float: left;background-image: url('images/TopicBack4.png');background-repeat: repeat-x;border: solid black;border-radius: 1em;border-width: 2px;font-size: 12pt; font-family: Arial; height: auto;margin-top: 10px;margin-left: 1em;padding: 10px;width: 76%;margin-bottom: 2em;");
            var lblTopicBody = new Label { Text = topic.Text };
            pnlTopicBody.Controls.Add(lblTopicBody);

            Panel pnlTopicVotes = new Panel();
            pnlTopicVotes.Attributes.Add("style", "margin-top: -1em;width: 74%;float: right;background-color: red;margin-right: 1.3em;margin-left: 1em;font-size: 14pt; padding-right: 1em;");

            Button btnLike = new Button() {Text = "Like"};
            btnLike.ID = "btnLike" + topic.Id;
            btnLike.Attributes.Add("style", "float: right; margin-left: 5px; width: 70px; ");

            Label lblLike = new Label() {Text = "(121)"};
            lblLike.Attributes.Add("style", "float: right;");

            Button btnDislike = new Button() {Text = "Dislike"};
            btnLike.ID = "btnDislike" + topic.Id;
            btnDislike.Attributes.Add("style", "float: right; margin-left: 5px; width: 70px;");

            Label lblDislike = new Label() { Text = "(75)" };
            lblDislike.Attributes.Add("style", "float: right;");

            
            pnlTopicVotes.Controls.Add(lblLike);
            pnlTopicVotes.Controls.Add(btnDislike);
            pnlTopicVotes.Controls.Add(lblDislike);
            pnlTopicVotes.Controls.Add(btnLike);

            // Replies on the topic follow

            Panel pnlReplies = new Panel() { CssClass = "TopicHeader" };
            pnlReplies.Attributes.Add("style", "float: left;width: 100%;");
            Label lblReply = new Label() { Text = "Replies<hr>" };
            pnlReplies.Controls.Add(lblReply);

            pnlTopicHeader.Controls.Add(pnlTopicBody);
            pnlTopicHeader.Controls.Add(pnlTopicVotes);
            pnlTopicHeader.Controls.Add(pnlReplies);

            parent.Controls.Add(pnlTopicHeader);
        }

        public void LoadNewUserInfo(Panel parent, User user, Topic topic)
        {
            Panel pnlTopic = new Panel();
            pnlTopic.Attributes.Add("style", "font-size: 12pt;font-family: Arial; margin-bottom:1em;");

            Panel pnlUserInfo = new Panel();
            pnlUserInfo.Attributes.Add("style", "float: left;border-color: dimgrey;border-width: 1px;border-style: solid;background-image: url('../images/Pixel-575757-50.png');background-repeat: repeat;margin-bottom: 1em;padding-bottom: 1em;margin-top: 1em; width: 17%;border-radius: 0.5em;");
            //pnlUserInfo

            Label lblUserName = new Label() { Text = user.Username };
            lblUserName.Attributes.Add("style", "margin-top: 0.5em; color: #18adad;");
            //lblUserName.ID = "lblOPusername" + topic.Id;

            Panel pnlUserPicture = new Panel();
            pnlUserPicture.Attributes.Add("style", "float: left;padding: 20px;height: 110px;width: 110px;");
            //pnlUserPicture.ID = "imgOPPicture" + topic.Id;
            Image imgProfile = new Image() { ImageUrl = "~/Images/ProfilePictures/default.png", Height = 110, Width = 110 };
            pnlUserPicture.Controls.Add(imgProfile);

            Table tblInfo = new Table();
            tblInfo.Attributes.Add("style", "width:100%");
            TableRow[] rows = new TableRow[7];
            TableCell[] cells = new TableCell[14];

            for (int a = 0; a < 7; a++)
                rows[a] = new TableRow();

            for (int a = 0; a < 14; a++)
            {
                cells[a] = new TableCell();
                if (a%2 != 0)
                {
                    cells[a].Attributes.Add("style", "color: #18adad;width:50%");
                }
            }


            rows[0].Cells.Add(cells[0]);
            rows[0].Cells[0].Controls.Add(new Label() { Text = "Type" });
            rows[0].Cells.Add(cells[1]);
            rows[0].Cells[1].Controls.Add(new Label() { Text = user.UserType.ToString() });

            rows[1].Cells.Add(cells[2]);
            rows[1].Cells[0].Controls.Add(new Label() { Text = "Rating" });
            rows[1].Cells.Add(cells[3]);
            rows[1].Cells[1].Controls.Add(new Label() { Text = user.Rating.ToString() });

            rows[2].Cells.Add(cells[4]);
            rows[2].Cells[0].Controls.Add(new Label() { Text = "Topics" });
            rows[2].Cells.Add(cells[5]);
            rows[2].Cells[1].Controls.Add(new Label() { Text = user.GetTopicsAmount(user.Username).ToString() });

            rows[3].Cells.Add(cells[6]);
            rows[3].Cells[0].Controls.Add(new Label() { Text = "Replies" });
            rows[3].Cells.Add(cells[7]);
            rows[3].Cells[1].Controls.Add(new Label() { Text = user.GetPostsAmount(user.Username).ToString() });

            rows[4].Cells.Add(cells[8]);
            rows[4].Cells[0].Controls.Add(new Label() { Text = "Institution" });
            rows[4].Cells.Add(cells[9]);
            rows[4].Cells[1].Controls.Add(new Label() { Text = user.Institution});

            rows[5].Cells.Add(cells[10]);
            rows[5].Cells[0].Controls.Add(new Label() { Text = "Groups" });
            rows[5].Cells.Add(cells[11]);
            rows[5].Cells[1].Controls.Add(new Label() { Text = "(x)" });

            rows[6].Cells.Add(cells[12]);
            rows[6].Cells[0].Controls.Add(new Label() { Text = "Badges" });
            rows[6].Cells.Add(cells[13]);
            rows[6].Cells[1].Controls.Add(new Label() { Text = "<img/><img/><img/>" });

            for (int a = 0; a < 7; a++)
                tblInfo.Rows.Add(rows[a]);

            Literal centerOpen = new Literal() { Text = "<center>" };
            Literal centerClose = new Literal() { Text = "</center>" };

            pnlUserInfo.Controls.Add(centerOpen);
            // Add user info controls here
            pnlUserInfo.Controls.Add(lblUserName);
            pnlUserInfo.Controls.Add(pnlUserPicture);
            pnlUserInfo.Controls.Add(tblInfo);
            pnlUserInfo.Controls.Add(centerClose);

            pnlTopic.Controls.Add(pnlUserInfo);

            parent.Controls.Add(pnlTopic);
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
                "float: left; background-image: url('images/TopicBack4.png'); background-repeat: repeat-x; border: solid black; border-radius: 1em; border-width: 2px; font-size: 12pt; font-family: Arial; height: auto; margin-top: 10px; padding: 10px; width: 76%; margin-bottom: 2em; margin-left: 1em; margin-right: 1em;");
            var lblPost = new Label {Text = post.Text};
            pnlPost.Controls.Add(lblPost);

            Panel pnlButtons = new Panel();
            pnlButtons.Attributes.Add("style", "float: right; margin-right: 2em;");

            var btnComment = new Image
            {
                ImageUrl = "img-demo/NewButtonsComment.png",
                Width = 103,
                Height = 33,
            };
            btnComment.Attributes.Add("onclick", string.Format("ToggleVisibility(\"cphMain_postComment{0}\")", post.Id));
            btnComment.Attributes.Add("style", "cursor: pointer;");
            var btnProfile = new ImageButton { ImageUrl = "img-demo/NewButtonsProfile.png", Width = 103, Height = 33 };
            var btnShare = new ImageButton { ImageUrl = "img-demo/NewButtonsShare.png", Width = 103, Height = 33 };
            var btnReport = new ImageButton { ImageUrl = "img-demo/NewButtonsReport.png", Width = 103, Height = 33 };

            pnlButtons.Controls.Add(btnComment);
            pnlButtons.Controls.Add(btnProfile);
            pnlButtons.Controls.Add(btnShare);
            pnlButtons.Controls.Add(btnReport);

            Panel hr = new Panel();
            hr.Attributes.Add("style", "width: 100%; float: left;");
            hr.Controls.Add(new Label(){Text= "<hr style=\"border-color: dimgrey;\">"});

            parent.Controls.Add(pnlPost);
            parent.Controls.Add(pnlButtons);
            parent.Controls.Add(hr);

            AddUserRepliesSection(pnlTopic, Post.GetPostsReplies(post.Id));
        }

        public void AddUserRepliesSection(Panel parent, List<Post> replies)
        {
            if (replies.Count > 0)
            {
                var pnlReplies = new Panel();
                pnlReplies.CssClass = "UserInfo";
                pnlReplies.Attributes.Add("style",
                    "float: left; font-family: Arial; margin-left: 4em; margin-bottom: 1em; padding-bottom: 1em; padding-top: 1em; width: 79%;");

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
                Label lblComment = new Label {Text = "<br/>Post Comment Here:"};
                pnlComment.Attributes.Add("style", "float: left; width: 100%");
                pnlComment.Controls.Add(lblComment);
                Panel pnlCommentContent = new Panel();
                pnlCommentContent.Attributes.Add("style",
                    "background-image: url('images/TopicBack4.png'); background-repeat: repeat-x; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%; margin-top: 1em; float: left");

                TextBox replyComment = new TextBox();
                replyComment.ID = "txtPost" + post.Id;
                replyComment.CssClass = "myTextAreas";
                replyComment.TextMode = TextBoxMode.MultiLine;
                replyComment.Width = Unit.Percentage(98);
                replyComment.Font.Name = "Arial";

                ImageButton btnPost = new ImageButton
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