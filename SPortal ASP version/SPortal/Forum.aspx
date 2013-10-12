<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="SPortal.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title id="titleForum">SPortal</title>
    <script src="js/jquery-1.9.1.js"> </script>
    <script src="js/jquery.min.js"> </script>
    <script src="js/jquery.elastic.source.js"> </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <body>
        <div class="centerBlock" style="margin-bottom: 2em;">
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
                    <hr/>
                    <div class="clickme" style="width: 30px; height: 24px;">
                        <asp:Image runat="server" ImageUrl="images/dropDown.png" AlternateText="Show More"/>
                    </div>
                    
                    <asp:Panel ID="pnlGeneral" runat="server" style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; float: left; font-size: 10pt; height: auto; padding: 10px; width: 90%; margin-bottom: 1em;">

                    </asp:Panel><br/>
                </div>
                <!-- Institution Topics -->                                   
                <div style="padding-left: 28px; padding-top: 20px;">
                    <div style="font-family: 'Dekar'; font-size: 25pt">Institution Topics</div>
                    <hr/>

                    <div class="clickme" style="width: 30px; height: 24px;">
                        <asp:Image runat="server" ImageUrl="images/dropDown.png" AlternateText="Show More"/>
                    </div>
                    
                    <asp:Panel ID="pnlInstitution" runat="server" style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%; float: left; margin-bottom: 1em;">
                        
                    </asp:Panel><br/>

                </div>
                <!-- Group Topics -->                                  
                <div style="padding-left: 28px; padding-top: 20px;">
                    <div style="font-family: 'Dekar'; font-size: 25pt">Group Topics</div>
                    <hr/>

                    <div class="clickme" style="width: 30px; height: 24px;">
                        <asp:Image runat="server" ImageUrl="images/dropDown.png" AlternateText="Show More"/>
                    </div>
                    
                    <asp:Panel ID="pnlGroup" runat="server" style="background-image: url('images/TopicBack4.png'); background-repeat: repeat-y; border: solid black; border-radius: 1em; border-width: 2px; font-size: 10pt; height: auto; padding: 10px; width: 90%; float: left; margin-bottom: 2em;">

                    </asp:Panel><br/>
                    
                </div>
                <br/><br/><br/>
            </div>
                                      
        </div>
                            
    </body>
    
    <script> 
        $('.clickme').click(function() {
            $(this).next().slideToggle('medium', function() {
                //$(this).next().slideup('medium', function () {
                // Animation complete.
            });
        });
       
    </script>
    
    <script>
        $('.myTextAreas').elastic();
    </script>
    
    <script>
        function AlertPost(element, type) {
            if (confirm('Create post ' + element.value + ' in ' + type.value + '?'))
                this.form.submit();
        }
    </script>
    
    <script>
        function validate(name, description, post) {
            var errors = new Array();
            var showError = false;

            //debugger;
            //alert(document.getElementById(name).value + ', ' + document.getElementById(description).value + ', ' + CKEDITOR.instances[post].getData());

            if (document.getElementById(name).value == '' || document.getElementById(description).value == '' || CKEDITOR.instances[post].getData() == '') {
                if (document.getElementById(name).value == '')
                    errors.push('Supply a Topic Name');
                if (document.getElementById(description).value == '')
                    errors.push('Supply a Topic Description');
                if (CKEDITOR.instances[post].getData() == '')
                    errors.push('Supply a Topic Body');
                showError = true;
            }
            
            if (showError) {
                var errorMessage = 'Error submitting the post:\n';

                errors.forEach(function(error) {
                    errorMessage += error + '\n\n';
                });

                alert(errorMessage);
                return false;
            }

            return confirm('Upload the post?');;
        }
    </script>
    
</asp:Content>