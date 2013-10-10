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

            <div style="height: 30px"><img src="images/bottomTopic.png" alt="Not found" width="895" height="35"></div>
            <div class="mainBlack">
                <asp:Panel runat="server" id="pnlTopic" style="padding-left: 28px; padding-top: 30px;">
                   
                </asp:Panel>
                <br/>
                
 
                <asp:Panel ID="pnlTopicPost" runat="server" style="float: left; margin-bottom: 2em; margin-left: 2em; width: 96%;">
                    
                </asp:Panel>
                

                <%--<asp:Panel runate="server" id="pnlTopicPost" style="float: left; margin-bottom: 2em; margin-left: 2em; width: 96%;">
                    <div style="font-family: 'Dekar'; font-size: 25pt;">Post your Reply</div>
                    <hr/>
                    
                    <div style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; float: left; font-size: 10pt; height: auto; margin-top: 1em; padding: 10px; width: 90%;">
                        <asp:TextBox ID="txtPost" runat="server" CssClass="myTextAreas" TextMode="MultiLine" Width="98%" Font-Names="Arial" Height="170"/>
                        <asp:ImageButton runat="server" ImageUrl="~/img-demo/NewButtonsComment.png" Height="33" Width="103" ID="btnPostReply" style="float: right; margin-right: 0.5em; margin-top: 0.4em;" CssClass="confirmPost" OnClick="btnPostReply_OnClick"/>
                    </div>
                </asp:Panel>--%>
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

        $('.confirmPost').click(function() {
            return confirm('Upload your Reply?');
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