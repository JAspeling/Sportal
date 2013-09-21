<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Wiki.aspx.cs" Inherits="SPortal.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <Title>Wiki</Title>
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
                <li><a href="">View</a></li>
                <li><a href="">Register</a></li>
                <li><a href="">Help</a></li>
            </ul>
            <div class="Navblock2">
                <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"></a>
                <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"></a>
            </div>
        </div>
        <div class="infoblock1About">
            <div>
                <ol>
                    <li data-slide-name="slide-one">
                        <div style="background-image: url('img-demo/Wiki.jpg'); height: 600px; width: 855px;">
                            <div style="margin-left: 0%; padding-top: 280px;">
                                <center>
                                    <span style="color: #ededed;"> 
                                        <input type="text" name="txt1" value="" size="78" style="background-image: url('images/searchTxt.png')"/><br/><br/><br/>
                                        <!-- <input style="background-image: url('images/sign.png')" type="submit" value="&nbsp;Button&nbsp;"/> -->
                                        <a href="#"><img src="img-demo/button.png" width="293" height="44" alt="button"/></a>
                                    </span>
                                </center>
                            </div>
                        </div>
                    </li>
                    <li data-slide-name="slide-two">
                        <img src="img-demo/ResultsBack.jpg" alt="image" />
                    </li>
                </ol>
                <noscript>
                    <p>Please enable Java Script to get the full experience.</p>
                </noscript>
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
            $('#three').liteAccordion({ theme: 'dark', rounded: true, enumerateSlides: true, firstSlide: 1, linkable: true, easing: 'easeInOutQuart' });
            $('#four').liteAccordion({ theme: 'light', firstSlide: 3, easing: 'easeOutBounce', activateOn: 'mouseover' });


        })(jQuery, document);

        </script>
</asp:Content>