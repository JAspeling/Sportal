<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SPortal.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Home</title>
    <script src="js/modernizer.custom.js"> </script>
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
        <div class="infoblock1">
            <div class="infoblock1A" style="border-radius: 1em">
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
            <div class="infoblock1B"  style="border-radius: 1em">
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
            <div class="infoblock1C"  style="border-radius: 1em">
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
        <div class="infoblock2" style="border-top-left-radius: 0.5em;border-top-right-radius: 0.5em">
            <div class="infoQuote">
            </div>
        </div>
        <div class="infoblock3" style=" margin-top: -1.1%;border-bottom-left-radius: 0.5em;border-bottom-right-radius: 0.5em">
        </div>
    </div>
</asp:Content>