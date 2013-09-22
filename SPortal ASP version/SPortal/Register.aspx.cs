using BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SPortal
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.ContentLength > 0)
                UploadAndDisplay();
            else
            {
                string tempName = Session["TempProfilePictureName"] == null ? "" : Session["TempProfilePictureName"].ToString();
                string tempSize = Session["TempProfilePictureSize"] == null ? "" : Session["TempProfilePictureSize"].ToString();
                string tempType = Session["TempProfilePictureType"] == null ? "" : Session["TempProfilePictureType"].ToString();

                Label1.Text = "File name: " +
                         tempName + "<br>" +
                         tempSize + " kb<br>" +
                         "Content type: " +
                         tempType;

                //MessageBox.Show("No File in postedFile");
            }

        }

        protected void btnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnOK_Click(object sender, ImageClickEventArgs e)
        {
            Connection connection = new Connection();

            string name = txtName.Text;
            string surname = txtSurname.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string profile = Session["TempProfilePictureName"] == null
                ? ""
                : Session["TempProfilePictureName"].ToString();

            if (connection.Register(name + " " + surname, password, email, name, surname, DateTime.Now, profile, 1))
            {
                //MessageBox.Show(string.Format("Profile '{0}' Created", name + " " + surname));
                Session["UserStatus"] = name + " " + surname;

                UploadImage();

                Response.Redirect("Index.aspx");
            }
            else
            {
                MessageBox.Show(string.Format("Error occured in creating the Profile."));
                Response.Redirect("Register.aspx");
            }
        }

        private void UploadImage()
        {
            // Check to see if the user uploaded an image.
            if (Session["TempProfilePicture"] != null && (bool)Session["TempProfilePicture"])
            {
                // TempFile Exists.
                //MessageBox.Show("Session Exists");

                string fileName = Session["TempProfilePictureName"].ToString();

                string rootPath = HttpContext.Current.Request.PhysicalApplicationPath;

                string sourcePath = rootPath + "images/ProfilePictures/temp/";
                string targetPath = rootPath + "images/ProfilePictures/";

                string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
                string destFile = System.IO.Path.Combine(targetPath, fileName);

                File.Move(sourceFile, destFile);
                File.Delete(sourceFile);
            }
        }

        private void UploadAndDisplay()
        {
            string imgName = FileUpload1.FileName;
            string imgPath = "~/images/ProfilePictures/temp/" + imgName;
            Session["TempProfilePicture"] = true;
            Session["TempProfilePictureName"] = imgName;
            Session["TempProfilePictureSize"] = FileUpload1.PostedFile.ContentLength;
            Session["TempProfilePictureType"] = FileUpload1.PostedFile.ContentType;
            //int imgSize = FileUpload1.PostedFile.ContentLength;
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
            {
                try
                {
                    // Save the file to a temp folder, to 're-load' it on a postback
                    FileUpload1.SaveAs(Server.MapPath(imgPath));
                    imgProfilePicture.ImageUrl = imgPath;

                    //FileUpload1.SaveAs(Server.MapPath(".\\") + "images\\ProfilePictures\\temp\\" +
                    //     FileUpload1.FileName);

                    // Display info on image(File).
                    Label1.Text = "File name: " +
                         FileUpload1.PostedFile.FileName + "<br>" +
                         FileUpload1.PostedFile.ContentLength + " kb<br>" +
                         "Content type: " +
                         FileUpload1.PostedFile.ContentType;
                }
                catch (Exception ex)
                {
                    Label1.Text = "ERROR: " + ex.Message;
                }
            }
        }
    }
}