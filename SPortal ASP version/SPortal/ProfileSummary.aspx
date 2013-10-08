<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ProfileSummary.aspx.cs" Inherits="SPortal.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Profile Summary</title>
    <link rel="stylesheet" href="css/main.css" type="text/css" media="screen" charset="utf-8" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

      <div class="centerBlock" style="height: auto">
                                    
                                      <div class="Navblock">
                                          <ul class="Navblock1">
                                            <li><a href="">View Full Profile</a></li>
                                            <li><a href="">Send Request</a></li>
                                            <li><a href="">Help</a></li>
                                            
                                          </ul>
                                          <br/>
                                          <div class="Navblock2" style="margin-top: 4%; height: 256px">
                                              <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"></a>
                                              
                                          </div>
                                      </div>
                                    
                                 <div style="background-color: #59abb7; border-radius: 1em; height: 90.2%; width: 70%;padding-left: 0.5px">
                                     <div style="padding: 5px; background-color: white; border-radius: 0.5em; height: 100%; width: 620px; float: right;margin: 10px">
                                         <img src="images/summaryIcon.png" width="16" height="16" alt="summaryIcon"/>
                                         <label>Summary</label>
                                     </div>
                                     <div style="padding: 5px; background-color: white; border-radius: 0.5em; height: 235px; width: 620px; float: right;margin: 10px">
                                     <b>Email</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :razor@mweb.co.za<br/>
                                     <b>Gender</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :Female<br/>
                                     <b>Location</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :Africa<br/>
                                     <b>Nationality</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :South African<br/>
                                     <b>Current City</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :Pretoria<br/>
                                     <b>Quotes</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :"What is done, is done!"<br/>
                                     <b>Date Registered</b>&nbsp;&nbsp;&nbsp;&nbsp;:16 October 2000<br/>
                                     <b>Last Seen</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     :08 October 2013 14:15<br/>
                                     --------------------------------------------------------------------------------------------------------------------------<br/>
                                     <br/>
                                     </div>
                                    <ul id="twitter-widget-freebie" >
                                     <li>
                                            <div id="twitter-widget" style="margin-top: -2.5%">
                                                    <div class="user">
                                                            <div class="avatar">
                                                                <img src="images/proPic.jpg" height="100" width="100" alt="avatar"/>
                                                            </div>
                                                            <div class="data">
                                                                    <span class="name">John Doe</span>
                                                                    @Razor192
                                                            </div>
                                                    </div>
                                                    <div class="details">
                                                            <ul>
                                                                    <li><span class="number">185</span>Posts</li>
                                                                    <li><span class="number">5</span>Following</li>
                                                                    <li><span class="number">25</span>Followers</li>
                                                            </ul>
                                                    </div>
                                                    <div class="button">
                                                        <a href="#" style="padding-left: 40px"><img src="img-demo/NewButtonsFriendMe.png" width="138" height="44" alt="NewButtonsFriendMe"/></a>
                                                    </div>
                                            </div>
                                    </li>
                                 </ul>
                                </div>
                                    
                            </div>

</asp:Content>




