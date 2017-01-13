<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="User_Register.aspx.cs" Inherits="Catch_if_you_Misbehave.User.WebForm2" %>
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
                User Registration Panel<span></span></h3>
            
                <div class="text-center" style="background-color: palevioletred; margin-top: 30px">
                    <table class="center" width="70%" >
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        
        <td>Full Name:-</td>
        <td><asp:TextBox ID="txtfullname" runat="server" Height="25px" Width="200px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="Full Name Mendatory" ControlToValidate="txtfullname"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        
        <td>Email Id:-</td>
        <td><asp:TextBox ID="txtemail_id" runat="server" Height="25px" Width="200px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="Email Address Mendatory" ControlToValidate="txtemail_id"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail_id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ErrorMessage="Invalid Email Id"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        
        <td>Contact No:-</td>
        <td><asp:TextBox ID="txtcontact_no" runat="server" Height="25px" Width="200px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Contact Number Mendatory" ControlToValidate="txtcontact_no"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ControlToValidate="txtcontact_no" ValidationExpression="^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$"
                ErrorMessage="Invalid Contact Number"></asp:RegularExpressionValidator>
        </td>
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
        <td>Qualification:-</td>
        <td><asp:TextBox ID="txtqualification" runat="server" Height="25px" Width="200px" 
                TextMode="SingleLine"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="Qualification Mendatory" ControlToValidate="txtqualification"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td></td>
        <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="35px" 
                Width="80px" onclick="btnSubmit_Click" BackColor="White"></asp:Button></td>
        <td></td>
    </tr>
    
</table>
                </div>
                <div class="clearfix">
            
            </div>
        </div>
    </div>
</asp:Content>