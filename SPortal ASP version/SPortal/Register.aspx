<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SPortal.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <%--<form id="frmRegister" runat="server" enctype="multipart/form-data">--%>
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" > </ajaxToolkit:ToolkitScriptManager>

    <div class="centerBlock" style="height: auto">
                                    
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
                <div style="background-color: white; width: 855px;">

                    <div style="width: 855px;">
                        <asp:Image runat="server" ImageUrl="img-demo/RegisterBackHeader.jpg"/>
                    </div>
                            
                    <div style="height: auto; background-color: white;" >
                        <div style="margin-left: 10%; background-color: white;">
                            <div>
                                <div style="float: left;">
                                    <span style="color: #1f92cb">   

                                        <img src="img-demo/user_icon.jpg" alt="image" /><label>Name__________________________</label><br/> 
                                        <asp:TextBox ID="txtName" runat="server" autocomplete="on" autofocus="" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <%--<asp:CompareValidator ID="TestNameString" runat="server" ControlToValidate="txtName" ErrorMessage="Enter a valid Name" Operator="DataTypeCheck">*</asp:CompareValidator>--%>
                                        <asp:RegularExpressionValidator ID="TestNameString" runat="server" ErrorMessage="Please enter a valid Name" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z]+$">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="testNameRequired" runat="server" ErrorMessage="Name Required" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
                                        <br/><br/>

                                        <img src="img-demo/user_icon.jpg" alt="image" /><label>Surname_______________________</label><br/> 
                                        <asp:TextBox ID="txtSurname" runat="server" autocomplete="on" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <%--<asp:CompareValidator ID="TestSurnameString" runat="server" ControlToValidate="txtSurname" ErrorMessage="Enter a valid Surname" Operator="DataTypeCheck">*</asp:CompareValidator>--%>
                                        <asp:RegularExpressionValidator ID="TestSurnameString" runat="server" ErrorMessage="Please enter a valid Surname" ControlToValidate="txtSurname" ValidationExpression="^[a-zA-Z]+$">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="testSurnameRequired" runat="server" ErrorMessage="Surname Required" ControlToValidate="txtSurname">*</asp:RequiredFieldValidator>
                                        <br/><br/>
                                                
                                        <label>Date of Birth_______</label><br/>
                                        <asp:TextBox TextMode="DateTime" ID="txtDoB" runat="server" style="border: double #ccccff; border-radius: 0.5em" />
                                        <asp:Image ID="Image1" runat="server" ImageUrl="img-demo/imgCalendar.png" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" 
                                                                      runat="server" TargetControlID="txtDoB" 
                                                                      PopupButtonID="Image1">
                                        </ajaxToolkit:CalendarExtender>
                                                
                                        <asp:CompareValidator
                                            id="dateValidator" runat="server" 
                                            Type="Date"
                                            Operator="DataTypeCheck"
                                            ControlToValidate="txtDoB" 
                                            ErrorMessage="Please enter a valid date.">*
                                        </asp:CompareValidator>
                                                
                                        <asp:RangeValidator ID="RangeValidator1" runat="server"
                                                            ControlToValidate="txtDoB" ErrorMessage="Invalid Range"
                                                            Type="Date">
                                        </asp:RangeValidator>
                
                                        <%--<ajaxToolkit:ValidatorCalloutExtender runat="server" Enabled="True" TargetControlID="RangeValidator1"></ajaxToolkit:ValidatorCalloutExtender>--%>
                                                

                                        <%--<asp:RangeValidator ID="dateRangeValidator" runat="server" ErrorMessage="Enter a valid date (Out of Range)" ControlToValidate="txtDoB" Text="*" Type="Date" Display="Dynamic"></asp:RangeValidator>--%>
                                        <br/><br/>
                                                    
                                                
                                                        
                                        <img src="img-demo/email_icon.jpg" alt="image" /><label>Email__________________________</label><br/> 
                                        <asp:TextBox ID="txtEmail" runat="server" autocomplete="on" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="EmailValidation" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="testEmailRequired" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                                        <br/><br/>
                                                                
                                        <img src="img-demo/email_icon.jpg" alt="image" /><label>Confirm Email__________________</label><br/> 
                                        <asp:TextBox ID="txtConfirmEmail" runat="server" autocomplete="on" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareEmailValidator" runat="server" ErrorMessage="Emails dont match" ControlToCompare="txtConfirmEmail" ControlToValidate="txtEmail">*</asp:CompareValidator><br/>
                                        <asp:RequiredFieldValidator ID="testConfirmEmailRequired" runat="server" ErrorMessage="Confirmation Email Required" ControlToValidate="txtConfirmEmail">*</asp:RequiredFieldValidator>
                                        <br/>
                                                                
                                        <img src="img-demo/lock_icon.jpg" alt="image" /><label>Password_______________________</label><br/> 
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="on" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPasswordConfirm" ControlToValidate="txtPassword" ErrorMessage="Passwords doesn't match">*</asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="testPasswordRequired" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
                                        <br/><br/>
                                                
                                        <img src="img-demo/lock_icon.jpg" alt="image" /><label>Confirm Password_______________</label><br/> 
                                        <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" autocomplete="on" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="testPasswordConfirmRequired" runat="server" ErrorMessage="Confirmation Password Required" ControlToValidate="txtPasswordConfirm">*</asp:RequiredFieldValidator><br/><br/>
                                        <%--<img src="img-demo/lock_icon.jpg" alt="image" /><label>Password</label><br/> --%>
                                        <img src="img-demo/user_icon.jpg" alt="image" /><label>Username______________________</label><br/>
                                        <asp:TextBox ID="txtUsername" runat="server" autocomplete="on" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox><br/><br/>
                                        <asp:RequiredFieldValidator ID="TestUsernameRequired" runat="server" ErrorMessage="Username Required" ControlToValidate="txtUsername">*</asp:RequiredFieldValidator>
                                        <!-- <input style="background-image: url('images/sign.png')" type="submit" value="&nbsp;Button&nbsp;"/> -->
                                                                
                                    </span><br/>
                                </div>

                                                

                                <div style="background-color: transparent; color: #1f92cb; float: right; height: 300px; margin-right: 10%; width: 300px;">
                                    <label>&nbsp;&nbsp;&nbsp;Profile Picture________________</label><br/>
                                    <asp:Image ID="imgProfilePicture" ImageUrl="img-demo/Profile_Picture.png" AlternateText="Profile Picture" runat="server"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="if (confirm('Upload ' + this.value + '?')) this.form.submit();"/>
                                    <br/>
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                    <!-- <i><small><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                       &nbsp;&nbsp;&nbsp;&nbsp;(click to add picture)</label></small></i> -->
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                </div>
                            </div>
                                
                                
                                    
                        </div>
                    </div>
                            
                    <div style="height: auto; margin-top: 30px; width: 855px;">
                        <asp:Image runat="server" ImageUrl="img-demo/RegisterBackFooter.jpg"/>
                        <div style="margin-top: -8em;">
                                        
                            <br/>
                            <table>
                                <tr>
                                    <td style="width: 30%">
                                        <asp:ImageButton ID="btnOK" runat="server" ImageUrl="img-demo/NewButtonsOK.png" OnClick="btnOK_Click"/>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="img-demo/NewButtonsCancel.png" OnClick="btnCancel_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
    <%--    </form>--%>
</asp:Content>