using BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
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
                Session["UserStatus"] = name + " " + surname; // Should be replaced with the username

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

                if (!File.Exists(destFile))
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
                    //FileUpload1.SaveAs(Server.MapPath(imgPath));

                    System.Drawing.Image myImage = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);

                    string rootPath = HttpContext.Current.Request.PhysicalApplicationPath;
                    string sourcePath = rootPath + "images/ProfilePictures/temp/";

                    resizeImage(myImage, sourcePath,imgName, 300, 300, myImage.Width, myImage.Height);
                    
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

        private void resizeImage(System.Drawing.Image originalImage, string path, string originalFilename,
            /* note changed names */
                     int canvasWidth, int canvasHeight,
            /* new */
                     int originalWidth, int originalHeight)
        {
            System.Drawing.Image image = originalImage;

            System.Drawing.Image thumbnail =
                new Bitmap(canvasWidth, canvasHeight); // changed parm names
            System.Drawing.Graphics graphic =
                         System.Drawing.Graphics.FromImage(thumbnail);

            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphic.SmoothingMode = SmoothingMode.HighQuality;
            graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphic.CompositingQuality = CompositingQuality.HighQuality;

            /* ------------------ new code --------------- */

            // Figure out the ratio
            double ratioX = (double)canvasWidth / (double)originalWidth;
            double ratioY = (double)canvasHeight / (double)originalHeight;
            // use whichever multiplier is smaller
            double ratio = ratioX < ratioY ? ratioX : ratioY;

            // now we can get the new height and width
            int newHeight = Convert.ToInt32(originalHeight * ratio);
            int newWidth = Convert.ToInt32(originalWidth * ratio);

            // Now calculate the X,Y position of the upper-left corner 
            // (one of these will always be zero)
            int posX = Convert.ToInt32((canvasWidth - (originalWidth * ratio)) / 2);
            int posY = Convert.ToInt32((canvasHeight - (originalHeight * ratio)) / 2);

            graphic.Clear(Color.White); // white padding
            graphic.DrawImage(image, posX, posY, newWidth, newHeight);

            /* ------------- end new code ---------------- */

            System.Drawing.Imaging.ImageCodecInfo[] info =
                             ImageCodecInfo.GetImageEncoders();
            EncoderParameters encoderParameters;
            encoderParameters = new EncoderParameters(1);
            encoderParameters.Param[0] = new EncoderParameter(Encoder.Quality,
                             100L);
            thumbnail.Save(path + originalFilename, info[1],
                             encoderParameters);
        }
    }
}