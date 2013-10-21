<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SPortal.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Profile</title>
    <!-- liteAccordion css -->
    <link href="css/liteaccordion.css" rel="stylesheet" />

    <!-- jQuery -->
    <script src="js/jquery.min.js"> </script>

    <!-- easing -->
    <script src="js/jquery.easing.1.3.js"> </script>

    <!-- liteAccordion js -->
    <script src="js/liteaccordion.jquery.js"> </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
   <%-- <form id="frmProfile" runat="server">--%>
        <div class="centerBlock">
            <div style="background-color: transparent; background-image: url('../images/infoBackForum2.png'); padding: 5px; width: 26%;border-radius: 0.5em; border-style: solid; border-width: 1px; border-color: rgb(46, 46, 46); float: left; margin-top: 0%;">
                <asp:Label ID="lblUsername" runat="server" style="color: #59abb7;float: right;font-size: 12pt;font-weight: bold;margin-bottom: 0.5em;">@This is a very long username intended for testing purposes</asp:Label>
                <div style="background-color: transparent; height: 105px; padding: 5px; width: 95%;">
                    <div>
                        <div style="background-color: transparent; height: 64%; padding: 0%; width: 62%;">
                            <div>
                                <asp:Image ID="imgProfilePicture" runat="server" ImageUrl="images/proPic.jpg" Width="100" Height="95"/>
                                <div style="margin-top: -82%">
                                    <asp:Image ID="imgProfileFrame" ImageUrl="images/ProPic_Container.png" Width="102" Height="97" runat="server" style="border-radius: 0.5em; margin-top: 30%"/>
                                </div>
                            </div>
                        </div>
                    </div>
                                              
                </div>
                <asp:Panel ID="pnlProfile" runat="server" style="background-image: url('images/TopicBack4.png'); color: #59abb7; display: inline-block; font-size: 8pt; list-style: none; list-style-type: none; padding: 5px; text-decoration: none; width: 95%; border-radius: 0.5em; border-color: rgb(95, 95, 95); border-style: solid; border-width: 1px;">
                    <span style="color: #ededed; font-size: 12pt;"><u>Basic Info______________________________</u></span>
                    <div>
                        <br/>
                        <table style="border: none; border-width: 0">
                            <tr>
                                <td style="width: 120px;">
                                    <asp:Label ID="Label1" Text="&bull; Name:" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ReadOnly="true" ID="lblProfileName" Text="John Doe" ForeColor="white" BackColor="transparent" BorderStyle="none" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">
                                    <asp:Label ID="Label2" Text="&bull; Birthday:" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ReadOnly="true" ID="lblProfileBirthday" Text="05 December 1990" ForeColor="white" BackColor="transparent" BorderStyle="none" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">
                                    <asp:Label ID="Label3" Text="&bull; Gender:" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ReadOnly="true" ID="lblProfileGender" Text="Male" ForeColor="white" BackColor="transparent" BorderStyle="none" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">
                                    <asp:Label ID="Label4" Text="&bull; Status:" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ReadOnly="true" ID="lblProfileStatus" Text="Student" ForeColor="white" BackColor="transparent" BorderStyle="none" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">
                                    <asp:Label ID="Label5" Text="&bull; Email:" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ReadOnly="true" ID="lblProfileEmail" Text="JohnD@mweb.com" ForeColor="white" BackColor="transparent" BorderStyle="none" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 120px;">
                                    <asp:Label ID="Label6" Text="&bull; Institution:" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ReadOnly="true" ID="lblProfileInstitution" Text="Belgium Campus" ForeColor="white" BackColor="transparent" BorderStyle="none" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table> <%--Left Status Pane --%>
                    </div>
                    <div>
                        <br/>
                        <table style="border-color: transparent; border-width: 0; margin-left: 38px;">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="btnProfileUpdate" runat="server" ImageUrl="img-demo/NewButtonsEdit.png" Width="116" Height="33" AlternateText="Button" OnClick="btnProfileUpdate_OnClick"/>
                                </td>
                            </tr>
                        </table>
                        <span style="color: #ededed">_____________________________________________________</span>
                    </div>
                </asp:Panel>

                <div style="background-color: transparent; padding: 5px; width: 95%;">
                </div>
            </div>
                                    
            <asp:Panel ID="pnlTimelineBody" style="background-image: url('../images/infoBackForum2.png'); padding: 13px; width: 65%; float: left; margin-left: 1em; border-radius: 0.5em" runat="server">
                <div style="background-image: url('images/pro_lineGraphic.png'); height: 44px; margin-left: -2%; margin-top: -2%; width: 104%;border-radius: 0.5em"></div>
                <asp:Panel runat="server" ID="pnlTimelineContainer" style="background-image: url('images/TopicBack4.png'); width: 100%; margin-top: 1em; padding-bottom: 1em;background-image: url('images/TopicBack4.png'); width: 100%; margin-top: 1em; padding-bottom: 1em; border-radius: 0.5em; border-color: rgb(95, 95, 95); border-style: solid; border-width: 1px;float: left">
                    <br/>
                    <asp:TextBox style="float: right; margin-right: 20px;border-radius: 0.5em;" type="text" ID="txtSearchTimeline" value=""  runat="server" Width="400px"/>
                    <asp:Label style="color: white; float: right; margin-right: 10px;" ID="Label7" runat="server" >&nbsp;&star;&nbsp;SEARCH TIMELINE</asp:Label>&nbsp;
                    <br/><br/><hr/><br/>
       
                </asp:Panel>
            </asp:Panel>
        </div>
<%--    </form>--%>
</asp:Content>