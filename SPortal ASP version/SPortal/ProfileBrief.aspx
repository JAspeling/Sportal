<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ProfileBrief.aspx.cs" Inherits="SPortal.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>View Profile</title>
    
    <link href="css/liteaccordion.css" rel="stylesheet" />

    <!-- jQuery -->
    <script src="js/jquery.min.js"> </script>

    <!-- easing -->
    <script src="js/jquery.easing.1.3.js"> </script>

    <!-- liteAccordion js -->
    <script src="js/liteaccordion.jquery.js"> </script>
    
    <script src="js/toucheffects.js"> </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
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
                                      
        <div style="background-color: orange; height: 150%; margin-top: -5%; padding: 5px; width: 16%;">
                                         
        </div>
                                    
        <div style="background-image: url('images/proBack.png'); float: right; height: 150%; margin-right: 47%; margin-top: -54%; padding: 0px; width: 30%;">
                                          
            <div style="background-color: transparent; height: 55%; margin-bottom: -30px; margin-left: 92px; margin-top: 60px; width: 100%;">
                <!--  <div style="height: 73%; width: 54%; background-image: url('images/proPic_backGraphic.png')">
                          <img src="images/proPic.jpg" width="70%" height="70%" alt="proPic"/>
                                                  
                      </div> -->
                                                
                <div>
                    <div style="margin-top: 0%">&nbsp;&nbsp;<img src="images/proPic.jpg" width="190" height="185"/></div>
                    <div style="height: 73%; margin-top: -54%; width: 54%;"><img src="images/proPic_backGraphic.png" width="210" height="210"/></div>
                                                    
                </div>
                                              
                <span style="color: white; font-size: 16pt; font-weight: 700; margin-left: 15%;">John Doe</span><br/>
                <span style="color: gold; margin-left: 18%;">&bigstar;&bigstar;&bigstar;&bigstar;&bigstar;</span>
                                              
            </div>
                                          
            <div style="background-color: #18adad; height: 12%; opacity: 0.5; width: 100%;">
                <div style="color: black; margin-left: 15%; opacity: 1">
                    <br/><a href="#">Request</a> | <a href="#">Change Picture</a> | <a href="#">Chat</a></div>
            </div>
                                          
            <div style="background-color: #c3dbdb; height: 35%; opacity: 0.9; width: 100%;">
                <div style="color: black; margin-left: 35%; opacity: 1">
                    <br/><a href="#">Recent Activity</a></div>
            </div>
        </div>
                                    
    </div>
    
    
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
</asp:Content>