<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="(old)Profile.aspx.cs" Inherits="SPortal.Profile" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/baseCSS.css" type="text/css">
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
        <form id="frmProfile" runat="server">	
            <div class="container">
                <div class="Header">
                    <div class=" nav">
                        <ul id="menu">
                                    
                            <li><a href="Index.aspx">HOME</a></li>
                                    
                            <li><a href="About.aspx">ABOUT</a></li>
                                    
                            <li><a href="#">______</a>
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
                                <li><a href="Register.aspx">Register</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                            <div class="Navblock2">
                                <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"></a>
                                <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"></a>
                            </div>
                        </div>
                                      
                        <div style="background-color: transparent; background-image: url('images/infoBack.png'); height: 150%; margin-top: -5%; padding: 5px; width: 16%;">
                            <div style="background-color: transparent; height: 105px; padding: 5px; width: 95%;">
                                <div>
                                    <div style="background-color: transparent; height: 64%; padding: 0%; width: 62%;">
                                        <div>
                                            <img src="images/proPic.jpg" width="100" height="95"/>
                                            <div style="margin-top: -82%"><img src="images/ProPic_Container.png" width="102" height="97"/></div>
                                        </div>
                                    </div>
                                    <span style="color: #59abb7; float: right; font-size: 12pt; font-weight: bold; margin-right: 3%; margin-top: -50%">
                                        @RaZor192
                                    </span>
                                </div>
                                              
                            </div>
                            <div style="background-color: transparent; color: #59abb7; display: inline-block; font-size: 8pt; height: 165px; list-style: none; list-style-type: none; padding: 5px; text-decoration: none; width: 95%;">
                                <span style="color: #ededed; font-size: 12pt;"><u>Basic Info_______________</u></span>
                                <ul style="margin-left: -10%">
                                    <li>Name:</li>
                                    <li>Birthday:</li>
                                    <li>Gender:</li>
                                    <li>Status:</li>
                                    <li>Email:</li>
                                    <li>Institution:</li>
                                </ul>
                                <div style="color: white; margin-left: 45%; margin-top: -54.5%">
                                    John Doe<br/>
                                    05 June 1990<br/>
                                    Male<br/>
                                    Student<br/>
                                    JohnD@mweb.com<br/>
                                    Belgium Campus<br/>
                                </div>
                                <div>
                                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="#"><img src="img-demo/button.png" width="146" height="22" alt="button"/></a>
                                    <br/><span style="color: #ededed">_________________________________</span>
                                </div>
                            </div>
                            <div style="background-color: transparent; height: 165px; padding: 5px; width: 95%;">
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#"><img src="img-demo/button.png" width="146" height="22" alt="button"/></a>
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#"><img src="img-demo/button.png" width="146" height="22" alt="button"/></a>
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#"><img src="img-demo/button.png" width="146" height="22" alt="button"/></a>
                            </div>
                        </div>
                                    
                        <asp:Panel ID="pnlTimelineBody" style="background-image: url('images/proBack.jpg'); float: right; margin-top: -36%; padding: 13px; width: 50%;" runat="server">
                            <div style="background-image: url('images/pro_lineGraphic.png'); height: 44px; margin-left: -2%; margin-top: -2%; width: 104%;"></div>
                            <asp:Panel runat="server" ID="pnlTimelineContainer" style="background-image: url('images/infoBack.png'); width: 100%;">
                                <br/>
                                <asp:Label runat="server" style="color: white">&nbsp;&star;&nbsp;SEARCH TIMELINE</asp:Label>&nbsp;
                                <asp:TextBox type="text" ID="txtSearchTimeline" value=""  runat="server" Width="400px"/>
                                <br/><br/><br/>

                                <!-- POST    
                                    <div>
                                        <div style=" color: white ;margin-left: 14.5% ;background-color: transparent; height: 25px; width: 80%">
                                            <asp:Label ID="Label3" style="float: left" runat="server">POST #1</asp:Label>
                                            <asp:Label ID="Label4" style="float: right" runat="server">2 hours</asp:Label>
                                        </div>
                                        <div style="border-color: black; border-width: 20px; border: solid; padding: -1px; color: black ;margin-left: 14.5% ;background-color: whitesmoke; height: 100px; width: 80%">
                                            <asp:TextBox ID="TextBox1" runat="server" Height="88px" Width="506px"></asp:TextBox>
                                                          
                                        </div>   

                                        <div style=" padding: 3px; color: black ;margin-left: 14.5% ;background-image: url('images/sign_Back.png'); height: 23px; width: 80%">
                                            <center>
                                                <a href="#"><img src="img-demo/button.png" width="170" height="22" alt="button"/></a>
                                                <a href="#"><img src="img-demo/button.png" width="170" height="22" alt="button"/></a>
                                                <a href="#"><img src="img-demo/button.png" width="170" height="22" alt="button"/></a>
                                            </center>
                                        </div>

                                    </div>
                                    -->
                                                    
                                              
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                            
                    <div class="imBanner">
                        <span style="float: right; padding-right: 1%"><a href="#"><img src="images/imBottom.png" alt="Not found" ></a></span>
                    </div>
                           
                </div>
                      
                <div class="Signblock" style="margin-left: 65.3%; width: 500px">
                                        
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