<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="(old)Index.aspx.cs" Inherits="SPortal.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>SPortal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="css/baseCSS.css" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/modernizer.custom.js"> </script>
        <script src="js/toucheffects.js"> </script>
    </head>
    <body>
        <form id="frmIndex" runat="server">
            <div class="container">
                <div class="Header">
                    <div class=" nav">
                        <ul id="menu">
                                    
                            <li><a href="#">______</a></li>
                                    
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
                        <div class="infoQuote">
                        </div>
                    </div>

                    <div class="centerBlock">
                                    
                        <div class="Navblock">
                            <ul class="Navblock1">
                                <li><a href="#">View</a></li>
                                <li><a href="Register.aspx">Register</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                            <div class="Navblock2">
                                <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"/></a>
                                <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"/></a>
                            </div>
                        </div>
                        <div class="infoblock1">
                            <div class="infoblock1A">
                                <ul class="grid cs-style-3">
                                    <li>
                                        <figure>
                                            <img src="images/info1A_wordGraphic.png" alt="img04"/>
                                            <figcaption>
                                                <span style="color: white; font-size: 120%;">Announcements</span>
                                                <span>&bigstar;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;</span>
                                                <a href="http://dribbble.com/shots/1116685-Settings">View</a>
                                            </figcaption>
                                        </figure>
                                    </li>
                                </ul>
                            </div>
                            <div class="infoblock1B">
                                <ul class="grid cs-style-3">
                                    <li>
                                        <figure>
                                            <img src="images/info1B_wordGraphic.png" alt="img04"/>
                                            <figcaption>
                                                <span style="color: white; font-size: 120%;">Latest News</span>
                                                <span>&bigstar;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;</span>
                                                <a href="http://dribbble.com/shots/1116685-Settings">View</a>
                                            </figcaption>
                                        </figure>
                                    </li>
                                </ul>
                            </div>
                            <div class="infoblock1C">
                                <ul class="grid cs-style-3">
                                    <li>
                                        <figure>
                                            <img src="images/info1C_wordGraphic.png" alt="img04"/>
                                            <figcaption>
                                                <span style="color: white; font-size: 120%;">Did you know?</span>
                                                <span>&bigstar;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;</span>
                                                <a href="http://dribbble.com/shots/1116685-Settings">View</a>
                                            </figcaption>
                                        </figure>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="infoblock2">
                        </div>
                        <div class="infoblock3">
                        </div>
                    </div>
                    <div class="imBanner">
                        <span style="float: right; padding-right: 1%"><a href="#"><img src="images/imBottom.png" alt="Not found" /></a></span>
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
        </form>
    </body>
</html>