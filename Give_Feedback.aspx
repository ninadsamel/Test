<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Give_Feedback.aspx.cs" Inherits="Catch_if_you_Misbehave.User.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <div class="banner w3ls page_head">
            <div class="container">
            
    <div class="header-nav wow fadeInUp animated" data-wow-delay=".5s">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header logo">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<h1>
									<a class="navbar-brand" href="Home.aspx"><img src="images/logo.png" alt=" " /></a>
								</h1>
								
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
								<nav class="cl-effect-1">
									<ul class="nav navbar-nav ">
										<li><a  href="Home.aspx">Home</a></li>
										<li><a href="Search_File.aspx">Search Files</a></li>
										<li><a href="View_File_Status.aspx">File Status</a></li>
                                        <li><a  href="Send_Query.aspx">Query</a></li>
										<li><a class="active" href="Give_Feedback.aspx">Feedback</a></li>
										<li><a href="User_Login.aspx?msg=logout">Logout</a></li>
									</ul>
								</nav>
				</div>
				<!-- /navbar-collapse -->
			</nav>
		</div>
        </div>
        </div>
        <div class="clearfix"></div>
		
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="teachers all_pad agile">
        <div class="container">
            <h3 class="title">
                Give Feedback<span></span></h3>
            
                <div class="text-center" style=" margin-top: 30px">
                    <table class="center" width="60%" >
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        
        <td>Owner Name:-</td>
        <td>
            <asp:DropDownList ID="ddlownername" runat="server" Height="30px" Width="200px"  AppendDataBoundItems=""
                DataSourceID="SqlDataSource1" DataTextField="full_name" 
                DataValueField="owner_id">
                <asp:ListItem Selected="True" Value="0" Text="Select Owner Name"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:catch_if_you_misbehaveConnectionString %>" 
                SelectCommand="SELECT [owner_id], [full_name] FROM [Owner_Master]"></asp:SqlDataSource>
        </td>
        <td></td>
    </tr>
    <tr>
        
        <td>Subject:-</td>
        <td><asp:TextBox ID="txtsubject" runat="server" Height="25px" Width="200px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ControlToValidate="txtsubject" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Subject Mendatory"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        
        <td>Description:-</td>
        <td><asp:TextBox ID="txtdescription" runat="server" Height="106px" Width="204px" 
                Rows="4" TextMode="MultiLine"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Description Mendatory" ControlToValidate="txtdescription"></asp:RequiredFieldValidator></td>
    </tr>
    
    
    <tr>
        <td></td>
        <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="35px" 
                Width="80px"  BackColor="White" onclick="btnSubmit_Click" ></asp:Button></td>
        <td></td>
    </tr>
    
</table>
                </div>
                <div class="clearfix">
            
            </div>
        </div>
    </div>
</asp:Content>