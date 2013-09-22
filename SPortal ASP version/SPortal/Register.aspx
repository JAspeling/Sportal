<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SPortal.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form ID="frmRegister" runat="server" enctype="multipart/form-data">
        
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" > </ajaxToolkit:ToolkitScriptManager>

        <div class="centerBlock">
                                    
            <div class="Navblock">
                <ul class="Navblock1">
                    <li><a href="#">View</a></li>
                    <li><a href="#">Register</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
                <div class="Navblock2">
                    <a href="http://www.belgiumcampus.co.za"><img src="images/bc.jpg" alt="Not found" width="150" height="160"/></a>
                    <a href="#"><img src="images/Ad1.jpg" alt="Not found" width="200" height="160"/></a>
                </div>
            </div>
            <div class="infoblock1About">
                <div>
                    <ul style="list-style-type: none; text-decoration: none;">
                        <li data-slide-name="slide-one">
                            <div style="background-color: white; width: 855px;">

                                <div style="width: 855px;">
                                    <asp:Image runat="server" ImageUrl="img-demo/RegisterBackHeader.jpg"/>
                                </div>
                            
                                <div>
                                    <div style="margin-left: 10%;">
                                        <div style="height: auto">
                                            <div style="float: left;">
                                                <span style="color: #c0c0c0;">   
                                                    <img src="img-demo/user_icon.jpg" alt="image" /><label>Name</label><br/> 
                                                    <asp:TextBox ID="txtName" runat="server" autocomplete="on" autofocus="" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>

                                                    <img src="img-demo/user_icon.jpg" alt="image" /><label>Surname</label><br/> 
                                                    <asp:TextBox ID="txtSurname" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                
                                                    <label>Date of Birth</label><br/>
                                                    <asp:TextBox ID="DateTextBox" runat="server"  />
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="img-demo/imgCalendar.png" />
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" 
                                                                                  runat="server" TargetControlID="DateTextBox" 
                                                                                  PopupButtonID="Image1">
                                                    </ajaxToolkit:CalendarExtender><br/><br/>
                                                        
                                                    <img src="img-demo/email_icon.jpg" alt="image" /><label>Email</label><br/> 
                                                    <asp:TextBox ID="txtEmail" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <label>Confirm Email</label><br/> 
                                                    <asp:TextBox ID="txtConfirmEmail" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <img src="img-demo/lock_icon.jpg" alt="image" /><label>Password</label><br/> 
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                
                                                    <img src="img-demo/lock_icon.jpg" alt="image" /><label>Confirm Password</label><br/> 
                                                    <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                
                                                    <%--<img src="img-demo/lock_icon.jpg" alt="image" /><label>Password</label><br/> --%>
                                                    <label>Username</label><br/>
                                                    <asp:TextBox ID="txtUsername" runat="server" autocomplete="on" required="" size="40" style="background-image: url('images/searchTxt.png')"></asp:TextBox><br/><br/>
                                                                
                                                    <!-- <input style="background-image: url('images/sign.png')" type="submit" value="&nbsp;Button&nbsp;"/> -->
                                                                
                                                </span><br/>
                                            </div>

                                            <div style="background-color: transparent; color: #c0c0c0; float: right; float: right; height: 300px; margin-right: 10%; width: 300px;">
                                                <label>&nbsp;&nbsp;&nbsp;Profile Picture________________</label><br/>
                                                <asp:Image ID="imgProfilePicture" ImageUrl="img-demo/Profile_Picture.png" AlternateText="Profile Picture" runat="server"/>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:FileUpload ID="FileUpload1" runat="server" onchange="frmRegister.submit();"/>
                                                <br/>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                                <!-- <i><small><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                   &nbsp;&nbsp;&nbsp;&nbsp;(click to add picture)</label></small></i> -->
                                            </div>
                                        </div>
                                
                                
                                        <div style="float: left; margin-left: 7%">
                                            <br/>
                                            <table>
                                                <tr>
                                                    <td style="width: 60%">
                                                        <asp:ImageButton ID="btnOK" runat="server" ImageUrl="img-demo/Button_Register.png" OnClick="btnOK_Click"/>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="img-demo/Button_Cancel.png" OnClick="btnCancel_Click"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>                                                   
                                    </div>
                                </div>
                                <div style="margin-top: 30px; width: 855px;">
                                    <asp:Image runat="server" ImageUrl="img-demo/RegisterBackFooter.jpg"/>
                                </div>
                            </div>
                        </li>
                        <li data-slide-name="slide-two">
                                                        
                        </li>
                    </ul>
                </div> 
            </div>
        </div>
    </form>
</asp:Content>