<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Search_File.aspx.cs" Inherits="Catch_if_you_Misbehave.User.WebForm4" %>
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
										<li><a class="active" href="Search_File.aspx">Search Files</a></li>
										<li><a href="View_File_Status.aspx">File Status</a></li>
                                        <li><a href="Send_Query.aspx">Query</a></li>
										<li><a href="Give_Feedback.aspx">Feedback</a></li>
										<li><a href="Give_Feedback.aspx">Feedback</a></li>
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
                Search Files<span></span></h3>
                <br/>
            <div  style="float:none; text-align: center" >
                <asp:TextBox ID="txtSearch" runat="server" Width="300px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Button ID="btnSearch"
                    runat="server" Text="Search"  Width="100px" onclick="btnSearch_Click"/>
            </div>
                <div class="text-center" style=" margin-top: 30px">
                    <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         Width="100%" AllowPaging="True" 
                        AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="file_id" HeaderText="File Id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="file_id" >
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="full_name" HeaderText="Full Name" 
                                SortExpression="full_name" >
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="file_name" HeaderText="File Name" 
                                SortExpression="file_name" >
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="upload_date" HeaderText="Upload Date" 
                                SortExpression="upload_date" >
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="description" HeaderText="Description" 
                                SortExpression="description" >
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="file_id" 
                                DataNavigateUrlFormatString="Search_File.aspx?msg=send&amp;file_id={0}" HeaderText="Access Request" 
                                Text="Send Request" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                   
                </div>
                <div class="clearfix">
            
            </div>
        </div>
    </div>
</asp:Content>
