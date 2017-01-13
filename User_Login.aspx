<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="Catch_if_you_Misbehave.User.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <div class="banner w3ls page_head">
        <div class="container">
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="teachers all_pad agile">
        <div class="container">
            <h3 class="title">
                User Login Panel<span></span></h3>
            
                <div class="text-center" style="background-color: palevioletred; margin-top: 30px">
                    <table class="center" width="60%" >
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        
        <td>Username:-</td>
        <td><asp:TextBox ID="txtusername" runat="server" Height="25px" Width="200px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Username Mendatory" ControlToValidate="txtusername"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><asp:TextBox ID="txtpassword" runat="server" Height="25px" Width="200px" 
                TextMode="Password"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Password Mendatory" ControlToValidate="txtpassword"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td></td>
        <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="btnLogin" runat="server" Text="Login" Height="35px" 
                Width="80px" onclick="btnLogin_Click" BackColor="White"></asp:Button></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>
            <h3><a class="" href="User_Register.aspx">User Register</a></h3>
        <td></td>
    </tr>
</table>
                </div>
                <div class="clearfix">
            
            </div>
        </div>
    </div>
</asp:Content>