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