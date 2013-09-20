<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileBrief.aspx.cs" Inherits="SPortal.ProfileBrief" %>

<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/baseCSS.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/modernizer.custom.js"></script>
        
        <!-- liteAccordion css -->
        <link href="css/liteaccordion.css" rel="stylesheet" />

        <!-- jQuery -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

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
        		
		  <div class="container">
                       <div class="Header">
                            <div class=" nav">
                                <ul id="menu">
                                    
                                    <li><a href="Index.aspx">HOME</a></li>
                                    
                                    <li><a href="About.aspx">ABOUT</a></li>
                                    
                                    <li><a href="#">______</a>
                                        <ul class="sub-menu">
                                            <li><a href="Profile.aspx">View</a></li>
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
                                    
                                    <li><a href="Wiki.aspx">Wiki</a></li>
                                    
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
                                              <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"></a>
                                              <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"></a>
                                          </div>
                                      </div>
                                      
                                      <div style=" height: 150%; width: 16%; background-color: orange;padding: 5px; margin-top: -5%">
                                         
                                      </div>
                                    
                                      <div style=" margin-right: 47% ;padding: 0px; height: 150%; width: 30%; background-image: url('images/proBack.png'); float: right; margin-top: -54%">
                                          
                                          <div style=" height: 55%; width: 100%; background-color: transparent; margin-top: 60px; margin-left: 92px; margin-bottom: -30px">
                                            <!--  <div style="height: 73%; width: 54%; background-image: url('images/proPic_backGraphic.png')">
                                                  <img src="images/proPic.jpg" width="70%" height="70%" alt="proPic"/>
                                                  
                                              </div> -->
                                                
                                            <div>
                                                <div style="margin-top: 0%">&nbsp;&nbsp;<img src="images/proPic.jpg" width="190" height="185"/></div>
                                                    <div style="height: 73%; width: 54%; margin-top: -54%; "><img src="images/proPic_backGraphic.png" width="210" height="210"/></div>
                                                    
                                            </div>
                                              
                                                  <span style="font-size: 16pt;font-weight: 700 ;margin-left: 15% ;color: white">John Doe</span><br/>
                                                  <span style="margin-left: 18% ;color: gold">&bigstar;&bigstar;&bigstar;&bigstar;&bigstar;</span>
                                              
                                          </div>
                                          
                                         <div style="height: 12%; width: 100%; background-color: #18adad; opacity: 0.5">
                                                 <div style=" color: black; margin-left: 15%; opacity: 1 ">
                                                     <br/><a href="#">Request</a> | <a href="#">Change Picture</a> | <a href="#">Chat</a></div>
                                         </div>
                                          
                                         <div style="height: 35%; width: 100%; background-color: #c3dbdb; opacity: 0.9">
                                                 <div style=" color: black; margin-left: 35%; opacity: 1 ">
                                                 <br/><a href="#">Recent Activity</a></div>
                                         </div>
                                      </div>
                                    
                            </div>
                            
                           <div class="imBanner">
                                <span style="float: right; padding-right: 1%"><a href="#"><img src="images/imBottom.png" alt="Not found" ></a></span>
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
        <script src="js/toucheffects.js"></script>
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
               $('#three').liteAccordion({ theme: 'dark', rounded: true, enumerateSlides: true, firstSlide: 1, linkable: true, easing: 'easeInOutQuart' });
               $('#four').liteAccordion({ theme: 'light', firstSlide: 3, easing: 'easeOutBounce', activateOn: 'mouseover' });


           })(jQuery, document);


        </script>
      </body>
</html>

