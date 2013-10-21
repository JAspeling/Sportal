<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="SPortal.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Group Information</title>
    
    <script type="text/javascript">
        function tryPlaceholder(txtbox, placehold) {
            if (txtbox.value.length == 0) {
                txtbox.value = placehold.toString();
                txtbox.style.color = "#959595";
            }
            else {
                if (txtbox.value == placehold.toString()) {
                    txtbox.value = '';
                    txtbox.style.color = "#000000";
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="centerBlock">            
        <asp:Panel ID="pnlTimelineBody" style="background-image: url('../images/infoBackForum2.png'); padding: 13px; width: 65%; float: left; margin-left: 1em; border-radius: 0.5em" runat="server">
            <div style=" height: 44px; margin-left: -2%; margin-top: -2%; width: 104%;border-radius: 0.5em"></div>
            <asp:Panel runat="server" ID="pnlTimelineContainer" style="background-image: url('images/TopicBack4.png'); width: 100%; margin-top: 1em; padding-bottom: 1em;background-image: url('images/TopicBack4.png'); width: 100%; margin-top: 1em; padding-bottom: 1em; border-radius: 0.5em; border-color: rgb(95, 95, 95); border-style: solid; border-width: 1px;float: left">
                <br/>
                <asp:Label runat="server" Font-Size="25pt" Font-Names="Dekar" Text="Group Information" style="color: white; float: left;"></asp:Label>
                <div style="float: right;">
                    <asp:TextBox ID="txtSearch" runat="server" style="width: 63%; float: left;" ></asp:TextBox>
                    <asp:Button runat="server" Text="Search" style="float: left; width: 35%; margin-left: 1%" OnClick="Unnamed2_Click"/>
                </div>
            </asp:Panel>
            <hr/>

        </asp:Panel>
    </div>
</asp:Content>
