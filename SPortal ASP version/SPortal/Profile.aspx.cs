using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace SPortal
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cookie.SetSessionFromCookie(this);
            if (Session["User"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            else
            {
                InitialiseProfile(Session["User"].ToString());
            }
        }

        /// <summary>
        /// Dynamically add a Post to the Page.
        /// (All posts can be seen from the active users Timeline)
        /// </summary>
        private void LoadPost(int postId, string postText)
        {
            #region Creating Controls

            // Post Container
            Panel postContainer = new Panel();

            // Post Heading Container
            Panel postHeadingContainer = new Panel();
            Label[] postHeadings = new Label[2];
            postHeadings[0] = new Label();
            postHeadings[1] = new Label();

            // Post Content Container
            Panel postContentContainer = new Panel();
            Label postContent = new Label();

            // Post Buttons Container
            Panel postButtonsContainer = new Panel();
            ImageButton[] buttons = new ImageButton[3];
            buttons[0] = new ImageButton();
            buttons[1] = new ImageButton();
            buttons[2] = new ImageButton();

            HiddenField postIdField = new HiddenField();

            #endregion

            #region Filling Controls

            postContainer.Attributes["style"] = "margin-bottom: 15px;";

            postHeadingContainer.Attributes.Add("class", "postHeading");
            postHeadings[0].Attributes.Add("style", "float: left");
            postHeadings[0].Text = string.Format("POST #{0}", postId);
            postHeadings[1].Attributes.Add("style", "float: right");
            postHeadings[1].Text = "2 Hours";

            postContentContainer.Attributes.Add("class", "postContentContainer");
            postContent.Text = postText;
            postContent.Attributes.Add("class", "postContent");

            postButtonsContainer.Attributes.Add("class", "postButtonsContainer");
            foreach (var button in buttons)
            {
                button.ImageUrl = "img-demo/button.png";
                button.Width = 168;
                button.Height = 22;
                button.Attributes.Add("class", "postButton");
            }

            postIdField.Value = postId.ToString();

            #endregion

            #region Adding Controls

            postHeadingContainer.Controls.Add(postHeadings[0]);      // Adding the Heading Controls to the Post Container
            postHeadingContainer.Controls.Add(postHeadings[1]);
            postContainer.Controls.Add(postHeadingContainer);

            postContentContainer.Controls.Add(postContent); // Adding the Post Content
            postContainer.Controls.Add(postContentContainer);

            foreach (var button in buttons)
            {
                postButtonsContainer.Controls.Add(button);
            }
            postContainer.Controls.Add(postButtonsContainer);
            postContainer.Controls.Add(postIdField);

            pnlTimelineContainer.Controls.Add(postContainer);

            #endregion
        }

        public void InitialiseProfile(string username)
        {
            BLL.User user = BLL.User.GetUserByUsername(username);

            string rootPath = HttpContext.Current.Request.PhysicalApplicationPath;

            if (File.Exists(rootPath + "images/ProfilePictures/" + user.Picture))
                imgProfilePicture.ImageUrl = "~/images/ProfilePictures/" + user.Picture;
            else
                imgProfilePicture.ImageUrl = "~/images/ProfilePictures/default.png";
                
            lblUsername.Text = user.Username;
            lblProfileName.Text = string.Format("{0} {1}", user.Name, user.Surname);
            lblProfileBirthday.Text = user.DOB.ToLongDateString();
            lblProfileGender.Text = "Not Specified";
            lblProfileStatus.Text = "Not Specified";
            lblProfileEmail.Text = user.Email;
            lblProfileInstitution.Text = user.Institution;
        }
    }
}