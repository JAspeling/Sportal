<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="(old)Forum.aspx.cs" Inherits="SPortal.Forum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPortal</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="css/baseCSS.css" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/modernizer.custom.js"></script>
        <script src="js/toucheffects.js"></script>
        
        <!-- liteAccordion css -->
        <link href="css/liteaccordion.css" rel="stylesheet" />

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- easing -->
        <script src="js/jquery.easing.1.3.js"></script>

        <!-- liteAccordion js -->
        <script src="js/liteaccordion.jquery.js"></script>

        <!--[if lt IE 9]>
            <script>
                document.createElement('figure');
                document.createElement('figcaption');
            </script>
        <![endif]-->
        
    </head>
<body>
    <form id="frmForum" runat="server">
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
                                    
                                    <li><a href="#">______</a>
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
                                            <li><a href="Register.aspx">Register</a></li>
                                            <li><a href="#">Help</a></li>                                          
                                          </ul>
                                          <div class="Navblock2">
                                              <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"/></a>
                                              <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"/></a>
                                          </div>
                                      </div>
                                      <div class="infoblock1About">
                                          
                                         <div id="three">
                                                <ol>
                                                    <li data-slide-name="slide-one">
                                                        <h2><span style="color: #030303">Topics(2)<br/></span></h2>
                                                        <div>
                                                            <img src="img-demo/Forum_Topics.jpg" alt="image" />
                                                        </div>
                                                    </li>
                                                    <li data-slide-name="slide-two">
                                                         <h2><span style="color: #ededed">Posts(2)<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                                                            </span></h2>
                                                        <div>
                                                            <img src="img-demo/Forum_Posts.jpg" alt="image" />
                                                        </div>
                                                    </li>
                                                    <li data-slide-name="slide-three">
                                                         <h2><span style="color: #ededed">Popular Topics<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                                                            </span></h2>
                                                        <div>
                                                            <img src="img-demo/3.jpg" alt="image" />
                                                        </div>
                                                    </li>
                                                    <li data-slide-name="slide-four">
                                                         <h2><span style="color: #ededed">Comments<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                                                            </span></h2>
                                                        <div>
                                                            <img src="img-demo/4.jpg"  alt="image" />
                                                        </div>
                                                    </li>
                                                </ol>
                                                
                                            </div> 
                                          
                                      </div>
                                      
                                </div>
                            <div class="imBanner">
                                <span style="float: right; padding-right: 1%"><a href="#"><img src="images/imBottom.png" alt="Not found" /></a></span>
                            </div>
			</div>
                      
                        <div class="Signblock" style="margin-left: 73.3%; width: 500px">
                                        
                                    <span style=" width:0px; margin-left: 70%; margin-right: -6%"><a href="Sign.aspx"><img src="images/sign.png" alt="Not found" width="82" height="38"></a></span>
                                    <span style=" "><a href="Register.aspx"><img src="images/register.png" alt="Not found" width="82" height="38"></a></span>
                                    
                                    <div style=" color: #59abb7; width: 400px; padding-right: -150%; height: 20px; margin-right: 50%; margin-top: -6.5%; ">                                       
                                        <!-- The limit is 50 characters......................... --> <asp:Label ID="lblStatus" runat="server" ForeColor="White"></asp:Label>
                                    </div>
                        </div>
		  </div>
         
        <script>
            (function ($, d) {
                // please don't copy and paste this page
                // it breaks my analytics!

                // demos
                $('#one').liteAccordion({
                    onTriggerSlide: function () {
                        this.find('figcaption').fadeOut();
                    },
                    onSlideAnimComplete: function () {
                        this.find('figcaption').fadeIn();
                    },
                    autoPlay: true,
                    pauseOnHover: true,
                    theme: 'stitch',
                    rounded: true,
                    enumerateSlides: true
                }).find('figcaption:first').show();
                $('#two').liteAccordion();
                $('#three').liteAccordion({ theme: 'dark', rounded: true, enumerateSlides: true, firstSlide: 2, linkable: true, easing: 'easeInOutQuart' });
                $('#four').liteAccordion({ theme: 'light', firstSlide: 3, easing: 'easeOutBounce', activateOn: 'mouseover' });


            })(jQuery, document);

        </script>
    </form>
</body>
</html>

