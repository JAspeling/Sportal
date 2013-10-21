<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="GroupRegister.aspx.cs" Inherits="SPortal.GroupRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <%--    </form>--%>
         <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" > </ajaxToolkit:ToolkitScriptManager>
            

    <div class="centerBlock" style="height: auto; width: 50%; margin-left: 25%;">
                                    
        <div>
            <div>
                <div style="background-color: white; width: 95%; border-radius: 1em">

                    <div style="width: 100%;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="img-demo/RegisterBackHeader.jpg" style="width: 100%"/>
                    </div>
                            
                    <div style="height: auto; background-color: white;" >
                        <div style="margin-left: 10%; background-color: white;">
                            <div>
                                <div style="background-color: white;">
                                    <span style="color: #1f92cb">   
 
                                        <img src="img-demo/user_icon.jpg" alt="image" /><label>Group Name____________________</label><br/> 
                                        <asp:TextBox ID="txtName" runat="server" autocomplete="on" autofocus="" size="40" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <br/><br/>

                                        <img src="img-demo/user_icon.jpg" alt="image" /><label>Description_____________________</label><br/> 
                                        <asp:TextBox TextMode="MultiLine" ID="txtDescription" Rows="4" Columns="31" runat="server" autocomplete="on" style="background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em"></asp:TextBox>
                                        <br/><br/>
                                                
                                        <img src="img-demo/user_icon.jpg" alt="image" /><label>Privacy Settings________________

                                        </label><br/>
                                        <asp:DropDownList ID="dropLimited" runat="server" style="width:33%; background-image: url('images/searchTxt.png'); border: double #ccccff; border-radius: 0.5em">
                                            <asp:ListItem Value="Private"></asp:ListItem>
                                            <asp:ListItem Value="Public"></asp:ListItem>
                                        </asp:DropDownList>
                                        
                                     </span>
                                    <br/>
                                        
                                    <br/>
                            <table>
                                <tr>
                                    <td style="width: 30%">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img-demo/NewButtonsOK.png" OnClick="ImageButton1_Click"/>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="img-demo/NewButtonsCancel.png"/>
                                    </td>
                                </tr>
                            </table>
                                    <br />
                                    <br />
                                    </div>
                                    
                                 </div>
                                
                            </div>
                        </div>
                    <div style="height: auto; margin-top: 30px; width: 100%;">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="img-demo/RegisterBackFooter.jpg" Width="100%"/>
                                        <div style="margin-top: -6em;">
                                            </div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <%--    </form>--%>
</asp:Content>