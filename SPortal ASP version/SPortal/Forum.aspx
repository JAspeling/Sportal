<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="SPortal.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title id="titleForum">SPortal</title>
    <script src="js/jquery.min.js"> </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

    <body>	
                            
        <div class="centerBlock">
                                    
                                  
            <div class="Navblock">
                <ul class="Navblock1">
                    <li><a href="">View</a></li>
                    <li><a href="">Register</a></li>
                    <li><a href="">Help</a></li>
                    <li><a href="">View</a></li>
                    <li><a href="">Register</a></li>
                    <li><a href="">Help</a></li>
                    <li><a href="">View</a></li>
                    <li><a href="">Register</a></li>
                    <li><a href="">Help</a></li>
                </ul>
                <div class="Navblock2">
                    <%-- ReSharper disable once Asp.Image --%>
                    <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"></a>
                    <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"></a>
                </div>
            </div>
            <div style="background-image: url('images/pro_lineGraphic.png'); height: 6px; margin-left: 0; width: 69%;"></div>
            <div class="mainBlack" style="">
                <!-- General Topics -->
                <div style="padding-left: 28px; padding-top: 20px;">
                    <div style="font-family: 'Dekar'; font-size: 25pt">General Topics</div>
                    <%--<div style="background-image: url('images/pro_lineGraphic.png'); height: 2px; margin-bottom: -1.5%; margin-left: 0; margin-top: 1%; width: 91%;"></div>--%>                                      
                    <hr/>
                    <div class="clickme" style="width: 30px; height: 24px;">
                        <asp:Image runat="server" ImageUrl="images/dropDown.png" AlternateText="Show More"/>
                    </div>
                    
                    <asp:Panel ID="pnlGeneral" runat="server" style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; float: left; font-size: 10pt; height: auto; padding: 10px; width: 90%;">
                        <!--<table style="float: left;">
                                <tr>
                                    <td>    <%--Image--%>
                                        <asp:Image runat="server" ImageUrl="~/images/LOGO.png" Height="50" Width="50"/>
                                    </td>
                                </tr>
                            </table>-->

                        <%--<asp:Table ID="Table1" runat="server" style="border-style: solid; border-width: 0px; border-bottom: 1px white solid;" Width="90%">
                            <asp:TableRow runat="server" BorderColor="White" BorderStyle="Solid" BorderWidth="1">
                                <asp:TableCell runat="server" >Topic Name<hr/></asp:TableCell>
                                <asp:TableCell runat="server" HorizontalAlign="Center">Replies<hr/></asp:TableCell>
                                <asp:TableCell runat="server" HorizontalAlign="Center">Created<hr/></asp:TableCell>
                                <asp:TableCell runat="server" HorizontalAlign="Center">Last Reply<hr/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" Width="70%">This is a topic description</asp:TableCell>
                                <asp:TableCell runat="server">123</asp:TableCell>
                                <asp:TableCell runat="server">1 hour 12 min ago</asp:TableCell>
                                <asp:TableCell runat="server">1 min 10 sec ago</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>--%>

                        <%--<table>
                            <tr style="border-bottom: 1px solid white;">
                                <td>Topic Name
                                </td>
                                <td align="center">Replies</td>
                                <td align="center">Created</td>
                                <td align="center">Last Reply</td>
                            </tr>
                            <tr>
                                <td style="width: 70%">
                                    This is a topic description which may be longer than one line so the word wrapping must work
                                </td>
                                <td align="center">
                                    132
                                </td>
                                <td align="center">
                                    1 hour 12 min ago by olderbutwiser
                                </td>
                                <td align="center">
                                    1 min 10 sec ago by jumanji
                                </td>
                            </tr>
                        </table>--%>
                        <%--<hr style="border-color: #40e0d0; background-color: #40e0d0"/>--%>
                    </asp:Panel>

                    <%--<div style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%;">
                        <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a>+ Business.M 300</a> | <a href="#">+ Software Engineering</a>
                    </div>--%>
                                           
                </div>
                <!-- Institution Topics -->                                   
                <div style="padding-left: 28px; padding-top: 20px;">
                    <div style="font-family: 'Dekar'; font-size: 25pt">Institution Topics</div>
                    <%--<div style="background-image: url('images/pro_lineGraphic.png'); height: 2px; margin-bottom: -1.5%; margin-left: 0; margin-top: 1%; width: 91%;"></div>--%>                                      
                    <hr/>
                    <%--<a href="#"><img src="images/dropDown.png" alt="Not found"></a>--%>
                    <div class="clickme" style="width: 30px; height: 24px;">
                        <asp:Image runat="server" ImageUrl="images/dropDown.png" AlternateText="Show More"/>
                    </div>
                    
                    <asp:Panel ID="pnlInstitution" runat="server" style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%;">
                        
                    </asp:Panel>

                    <%--<div style="background-image: url('images/TopicBack4.png'); border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%;">
                        <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Business.M 300</a> | <a>+ Software Engineering</a>
                    </div>--%>
                </div>
                <!-- Group Topics -->                                  
                <div style="padding-left: 28px; padding-top: 20px;">
                    <div style="font-family: 'Dekar'; font-size: 25pt">Group Topics</div>
                    <%--<div style="background-image: url('images/pro_lineGraphic.png'); height: 2px; margin-bottom: -1.5%; margin-left: 0; margin-top: 1%; width: 91%;"></div>--%>                                      
                    <hr/>
                    <%--<a href="#"><img src="~/images/dropDown.png" alt="Not found"></a>--%>
                    <div class="clickme" style="width: 30px; height: 24px;">
                        <asp:Image runat="server" ImageUrl="images/dropDown.png" AlternateText="Show More"/>
                    </div>
                    
                    <asp:Panel ID="pnlGroup" runat="server" style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%;">
                        
                    </asp:Panel>

                    <%--<div style="background-image: url('images/TopicBack4.png'); border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%;">
                        <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Software Engineering</a> | <a href="#">+ Business.M 300</a> | <a href="#">+ Software Engineering</a>
                    </div>--%>
                                           
                </div>
                <br/><br/><br/>
            </div>
            <div style="height: 30px"><img src="images/bottomTopic.png" alt="Not found" width="895" height="35"></div>
            <div class="mainWhite">
                <div style="padding-left: 28px; padding-top: 30px;">
                    <div style="color: grey; font-family: 'Dekar'; font-size: 25pt">Software Engineering <span>&nbsp;<img src="images/fire.png" alt="Not found" width="25" height="26">&nbsp;<img src="images/fire.png" alt="Not found" width="25" height="26">&nbsp;<img src="images/fire.png" alt="Not found" width="25" height="26"></span></div> 
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
                                <a href="#"><img src="img-demo/NewButtonsComment.png" alt="Not found" width="103" height="33"></a>
                                <a href="#"><img src="img-demo/NewButtonsProfile.png" alt="Not found" width="103" height="33"></a>
                                <a href="#"><img src="img-demo/NewButtonsShare.png" alt="Not found" width="103" height="33"></a>
                                <a href="#"><img src="img-demo/NewButtonsReport.png" alt="Not found" width="103" height="33"></a>
                            </div>
                        </div>
                    </div>
                                           
                                         
                    <div style="background-color: #899caa; border-radius: 1em; height: 105px; padding: 10px; width: 92%;">
                        
                        <asp:Label ID="lblPostBody" runat="server" Text="Test" Width="820px"></asp:Label>
                        
                    </div>
                    <a href="#" style="color: grey">Comment</a>
                    <div style="background-color: #899caa; border-radius: 0.5em; font-family: 'Century Gothic'; height: 100px; padding: 10px; width: 92%;">
                        <asp:TextBox ID="TextBox1" runat="server" Height="90px" TextMode="MultiLine" Width="790px" Text="Hello" Font-Names="Arial"></asp:TextBox>
                    </div>
                    <hr/>
                    <br/><br/>
                                          
                    <h2>New Post:</h2>
                                           
                                           
                    <div style="background-color: #18adad; border-radius: 0.5em; font-family: 'Century Gothic'; height: 25px; padding: 5px; width: 50%;">
                        <textarea  name="" rows="1" cols="50" style="border-color: #b0e3e4; border-radius: 0.5em;">Username...</textarea>
                    </div>
                    <div style="background-color: #18adad; border-radius: 1em; height: 105px; padding: 10px; width: 92%;">
                        <textarea  name="" rows="6" cols="96" style="border-color: #18adad; border-radius: 1em;">                                                                                              
                                               </textarea>
                    </div>
                    <br/>
                    <a href="#" style="float: right; margin-right: 5%"><img src="img-demo/NewButtonsPost.png" alt="Not found" width="138" height="44"></a>
                                          
                </div>
                <br/>
            </div> 
                                      
        </div>
                            
    </body>
    
    <script> 
        $('.clickme').click(function() {
            $(this).next().slideToggle('fast', function() {
                // Animation complete.
            });
        });
    </script>

</asp:Content>