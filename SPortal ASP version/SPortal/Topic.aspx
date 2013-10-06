<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Topic.aspx.cs" Inherits="SPortal.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Topic</title>
    <script src="js/jquery.min.js"> </script>
<%--    <script src="js/autogrow.js"> </script>--%>
    <script src="js/jquery.elastic.source.js"> </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <body >
        
    <%--onload=" javascript:document.getElementById('div1').scrollTop = document.getElementById('scroll').value; "--%>
    <%--<div id="div1" style="overflow: auto; height: 100px;" onscroll="javascript:document.getElementById('scroll').value = this.scrollTop">--%>
        <div class="centerBlock">
            <div style="height: 30px"><img src="images/bottomTopic.png" alt="Not found" width="895" height="35"></div>
            <div class="mainBlack">
                <asp:Panel runat="server" id="pnlTopic" style="padding-left: 28px; padding-top: 30px;">
                    <%--<div class="TopicHeader">Software Engineering
                    <span>
                        &nbsp;
                        <img src="images/fire.png" alt="Not found" width="25" height="26">
                        &nbsp;
                        <img src="images/fire.png" alt="Not found" width="25" height="26">
                        &nbsp;
                        <img src="images/fire.png" alt="Not found" width="25" height="26">
                    </span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> 
                <div style="color: grey; height: 7px; margin-top: -10px"></div>
                <span style="color: grey;"><hr/></span>
                <br/><br/>
                                           
                     
               
                
                                      
                <div style="background-color: transparent; height: 80px; width: 92%;">
                    <!--Rating-->
                    <div style="background-color: transparent; height: 100%; padding-left: 5%; width: 10%;">
                                                   
                        <a href="#"><img src="images/VotingIconUp.png" width="35" height="23" alt="VotingIconDown"/></a>
                        <div style="background-color: grey; border-radius: 2em; color: white; font-size: 12pt; height: 25px; margin-top: -6%; padding-top: 4px; width: 33px;">
                            <center>60</center>
                        </div>
                        <a href="#"><img src="images/VotingIconDown.png" width="35" height="23" alt="VotingIconDown"/></a>

                    </div>
                    <!--Profile Picture-->
                    <div style="background-color: blue; height: 100%; margin-left: 13%; margin-top: -9%; width: 15%;">
                        <div style="background-color: #899caa; border-radius: 1em; height: 100%; width: 100%;">
                            <div>                                                                                              
                                <img src="images/proPic.jpg" width="100%" height="100%" alt="proPic"/>
                            </div>
                            <div style="border: solid black; border-radius: 0.5em; border-width: 5px; height: 74px; margin-top: -73%; position: relative; width: 95%;"></div>
                        </div>
                    </div>
                    <!--Profile Details-->
                    <div style="background-color: transparent; height: 88%; margin-left: 25%; margin-top: -10%; padding: 5px; padding-left: 50px; width: 10%;">
                        <!--Username-->
                        <div style="background-color: transparent; color: #18adad; font-weight: bold; height: 30%; width: 100%;">
                            <a style="color: #18adad" href="ProfileBrief.aspx">@Razor192</a>
                        </div>
                        <!--Topics-->
                        <div style="background-color: transparent; color: grey; height: 30%; width: 100%;">
                            Topics(2)
                        </div>
                        <!--Rating-->
                        <div style="background-color: transparent; color: gold; height: 30%; width: 100%;">
                            &bigstar;&bigstar;&bigstar;&bigstar;&bigstar;
                        </div>
                    </div>
                    <!--Post Navigation-->
                    <div style="background-color: transparent; color: lightsteelblue; height: 100%; margin-left: 40%; margin-top: -10%; width: 60%;">
                        <!--Post links-->
                        <div style="background-color: transparent; height: 27%; padding: 9px; padding-left: 30px; width: 92%;">
                            &nbsp;&bullet;&nbsp;<a href="#" style="color: #18adad;">SPortalChat</a>
                            &nbsp;&bullet;&nbsp;<a href="#" style="color: #18adad;">Facebook</a>
                            &nbsp;&bullet;&nbsp;<a href="#" style="color: #18adad;">Tweeter</a>
                            &nbsp;&bullet;&nbsp;<a href="#" style="color: #18adad;">Instagram</a>&nbsp;&bullet;
                        </div>
                        <!--Post buttons-->
                        <div style="background-color: transparent; height: 27%; padding: 9px; padding-left: 30px; width: 92%;">
                            <a href="#"><img class="showComment" src="img-demo/NewButtonsComment.png" alt="Not found" width="103" height="33"></a>
                            <a href="#"><img src="img-demo/NewButtonsProfile.png" alt="Not found" width="103" height="33"></a>
                            <a href="#"><img src="img-demo/NewButtonsShare.png" alt="Not found" width="103" height="33"></a>
                            <a href="#"><img src="img-demo/NewButtonsReport.png" alt="Not found" width="103" height="33"></a>
                        </div>
                    </div>
                </div>
                <br/><br/>
                                         
                <div style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; margin-top: 10px; padding: 10px; width: 90%;">
                        
                    <asp:Label ID="lblPostBody" runat="server" Text="Test" Width="820px"></asp:Label>
                        
                </div>
                <div id="postComment" class="">
                    <a href="#" style="color: grey">Comment</a>
                    <div style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 92%;">
                        <asp:TextBox CssClass="myTextAreas" ID="TextBox1" runat="server" TextMode="MultiLine" Width="790px"  Font-Names="Arial"></asp:TextBox>
                    </div>
                    <hr/>
                    <br/><br/>
                </div>--%>
                
                    <%--<hr style="background-color: #40e0d0; border-color: #40e0d0;"/>

                <div style="font-family: 'Dekar';">
                    <h2>New Post:</h2>
                </div>
                
                
                <div style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 92%;">
                    <asp:TextBox CssClass="myTextAreas" runat="server" TextMode="MultiLine" Height="22px" Width="790px" Font-Names="Arial"></asp:TextBox>
                </div>
                <br/>
                <a href="#" style="float: right; margin-right: 5%"><img src="img-demo/NewButtonsPost.png" alt="Not found" width="138" height="44"></a>
                --%>
                </asp:Panel>
                <br/>
            </div>
        </div>
    </body>
    <script>
        $('.showComment').click(function() {
            $(this).next().slideToggle('slow', function() {
            });
            $(this).next().removeClass('hidden');
            //slideToggle('fast', function () {
            // Animation complete.
        });
    //});
    </script>
    
    <script>
        $('.myTextAreas').elastic();
    </script>

    <%--<script>
        $('.myTextAreas').autogrow();
    </script>--%>
    
    <script>
        function ToggleVisibility(element) {
            //alert(element);
            //alert(document.getElementById(element).className);
            if (document.getElementById(element).className == "hidden") {
                document.getElementById(element).className = "shown";
            } else {
                document.getElementById(element).className = "hidden";
            }
            //alert(element.class);
        }
    </script>
</asp:Content>