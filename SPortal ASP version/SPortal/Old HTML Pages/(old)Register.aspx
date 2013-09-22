<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="(old)Register.aspx.cs" Inherits="SPortal.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="css/baseCSS.css" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/modernizer.custom.js"> </script>
        
        <!-- liteAccordion css -->
        <link href="css/liteaccordion.css" rel="stylesheet" />

        <!-- jQuery -->
        <script src="js/jquery.min.js"> </script>

        <!-- easing -->
        <script src="js/jquery.easing.1.3.js"> </script>

        <!-- liteAccordion js -->
        <script src="js/liteaccordion.jquery.js"> </script>

        <!--[if lt IE 9]>
            <script>
                document.createElement('figure');
                document.createElement('figcaption');
            </script>
        <![endif]-->
        
    </head>
    <body>
        <form id="frmRegister" runat="server">
            <div class="container">
                <div class="Header">
                    <div class=" nav">
                        <ul id="menu">
                                    
                            <li><a href="Index.aspx">HOME</a></li>
                                    
                            <li><a href="About.aspx">ABOUT</a></li>
                                    
                            <li><a href="Profile.aspx">PROFILE</a>
                                <ul class="sub-menu">
                                    <li><a href="ProfileBrief.aspx">View</a></li>
                                    <li><a href="Register.aspx">Register</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </li>
                                    
                            <li><a href="Forum.aspx">FORUM</a>
                                <ul class="sub-menu">
                                    <li><a href="#">Topics</a></li>
                                    <li><a href="#">Moderations</a></li>
                                    <li><a href="#">Projects</a></li>
                                    <li><a href="#">Uploads</a></li>
                                </ul>
                            </li>
                                    
                            <li><a href="#">GROUPS</a>
                                <ul class="sub-menu">
                                    <li><a href="#">Mentors</a></li>
                                    <li><a href="#">Moderations</a></li>
                                    <li><a href="#">Projects</a></li>
                                    <li><a href="#">Mentees</a></li>
                                </ul>
                            </li>
                                    
                            <li><a href="Wiki.aspx">WIKI</a></li>
                                    
                        </ul>
                                
                    </div>
                    <div class="centerBlock">
                                    
                        <div class="Navblock">
                            <ul class="Navblock1">
                                <li><a href="#">View</a></li>
                                <li><a href="#">Register</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                            <div class="Navblock2">
                                <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"/></a>
                                <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"/></a>
                            </div>
                        </div>
                        <div class="infoblock1About">
                            <div>
                                <ul style="list-style-type: none; text-decoration: none;">
                                    <li data-slide-name="slide-one">
                                        <div style="background-image: url('img-demo/RegisterBack.jpg'); height: 600px; width: 855px;">
                                            <div style="margin-left: 10%; padding-top: 120px;">
                                                            
                                                <span style="color: #c0c0c0;">
                                                                
                                                    <img src="img-demo/user_icon.jpg" alt="image" /><label>Name_________________________</label><br/> 
                                                    <asp:TextBox ID="txtName" runat="server" autocomplete="on" autofocus="" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>

                                                    <img src="img-demo/user_icon.jpg" alt="image" /><label>Surname______________________</label><br/> 
                                                    <asp:TextBox ID="txtSurname" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <img src="img-demo/email_icon.jpg" alt="image" /><label>Email__________________________</label><br/> 
                                                    <asp:TextBox ID="txtEmail" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <label>Confirm Email_____________________</label><br/> 
                                                    <asp:TextBox ID="txtConfirmEmail" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <img src="img-demo/lock_icon.jpg" alt="image" /><label>Password______________________</label><br/> 
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <!-- <input style="background-image: url('images/sign.png')" type="submit" value="&nbsp;Button&nbsp;"/> -->
                                                                
                                                </span><br/>
                                                                  
                                                <span style="margin-left: 7%">
                                                    <asp:ImageButton ID="btnOK" runat="server" ImageUrl="img-demo/Button_Register.png" OnClick="btnOK_Click"/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="img-demo/Button_Cancel.png" OnClick="btnCancel_Click"/><br/><br/><br/>
                                                </span>
                                                                  
                                                <div style="background-color: transparent; color: #c0c0c0; float: right; height: 300px; margin-right: 10%; margin-top: -54.3%; width: 300px;">
                                                    <label>&nbsp;&nbsp;&nbsp;Profile Picture________________</label><br/>
                                                    <a ><img src="img-demo/Profile_Picture.png" alt="button"/></a><br/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:FileUpload ID="imgProfile" runat="server" />
                                                    <!-- <i><small><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                       &nbsp;&nbsp;&nbsp;&nbsp;(click to add picture)</label></small></i> -->
                                                </div>
                                                            
                                            </div>
                                        </div>
                                    </li>
                                    <li data-slide-name="slide-two">
                                                        
                                    </li>
                                </ul>
                                                
                            </div> 
                        </div>
                    </div>
                    <div class="imBanner">
                        <span style="float: right; padding-right: 1%"><a href="#"><img src="images/imBottom.png" alt="Not found"/></a></span>
                    </div>
                </div>
                      
                <div class="Signblock" style="margin-left: 73.3%; width: 500px">
                                        
                    <span style="margin-left: 70%; margin-right: -6%; width: 0px;"><a href="Sign.aspx"><img src="images/sign.png" alt="Not found" width="82" height="38"></a></span>
                    <span style=""><a href="Register.aspx"><img src="images/register.png" alt="Not found" width="82" height="38"></a></span>
                                    
                    <div style="color: #59abb7; height: 20px; margin-right: 50%; margin-top: -6.5%; padding-right: -150%; width: 400px;">                                       
                        <!-- The limit is 50 characters......................... --> <asp:Label ID="lblStatus" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <script src="js/toucheffects.js"> </script>
            <script>
                (function($, d) {
                    // please don't copy and paste this page
                    // it breaks my analytics!

                    // demos
                    $('#one').liteAccordion({
                        onTriggerSlide: function() {
                            this.find('figcaption').fadeOut();
                        },
                        onSlideAnimComplete: function() {
                            this.find('figcaption').fadeIn();
                        },
                        autoPlay: true,
                        pauseOnHover: true,
                        theme: 'stitch',
                        rounded: true,
                        enumerateSlides: true
                    }).find('figcaption:first').show();
                    $('#two').liteAccordion();
                    $('#three').liteAccordion({ theme: 'dark', rounded: true, enumerateSlides: true, firstSlide: 1, linkable: true, easing: 'easeInOutQuart' });
                    $('#four').liteAccordion({ theme: 'light', firstSlide: 3, easing: 'easeOutBounce', activateOn: 'mouseover' });


                })(jQuery, document);
            </script>
        </form>
    </body>
</html>