<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SPortal.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>About</title>
    
    <!-- liteAccordion css -->
    <link href="css/liteaccordion.css" rel="stylesheet" />

    <!-- jQuery -->
    <script src="js/jquery.min.js"> </script>

    <!-- easing -->
    <script src="js/jquery.easing.1.3.js"> </script>

    <!-- liteAccordion js -->
    <script src="js/liteaccordion.jquery.js"> </script>
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
                <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"/></a>
                <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"/></a>
            </div>
        </div>
        <div class="infoblock1About">
                                          
            <div id="three">
                <ol>
                    <li data-slide-name="slide-one">
                        <h2><span style="color: #ededed">Abstract<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                            </span></h2>
                        <div>
                            <img src="img-demo/1.jpg" alt="image" />
                        </div>
                    </li>
                    <li data-slide-name="slide-two">
                        <h2><span style="color: #ededed">Introduction<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                            </span></h2>
                        <div>
                            <img src="img-demo/2.jpg" alt="image" />
                        </div>
                    </li>
                    <li data-slide-name="slide-three">
                        <h2><span style="color: #ededed">Values<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                            </span></h2>
                        <div>
                            <img src="img-demo/3.jpg" alt="image" />
                        </div>
                    </li>
                    <li data-slide-name="slide-four">
                        <h2><span style="color: #ededed">The Team<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                            </span></h2>
                        <div>
                            <img src="img-demo/4.jpg"  alt="image" />
                        </div>
                    </li>
                    <li data-slide-name="slide-five">
                        <h2><span style="color: #ededed">Contact Us<br/>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;
                            </span></h2>
                        <div>
                            <img src="img-demo/5.jpg" alt="image" />
                        </div>
                    </li>
                </ol>
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
</asp:Content>