<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Catch_if_you_Misbehave.User.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <div class="banner w3ls">
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
										<li><a class="active" href="Home.aspx">Home</a></li>
										<li><a href="Search_File.aspx">Search Files</a></li>
										<li><a href="View_File_Status.aspx">File Status</a></li>
                                        <li><a href="Send_Query.aspx">Query</a></li>
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
    <div class="welcome all_pad wthree">
	<div class="container">
		<h3 class="title">Welcome To Royal Furnish<span></span></h3>
		<div class="wel-grids">
			<div class="col-md-6 wel-grid-one bor_one text-center wow bounceInUp" data-wow-duration="1.5s" data-wow-delay="0s">
				<div class="wel-img">
					<img src="images/111.png" alt=" " />
				</div>
				<h4>voluptatem</h4>
				<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur 
				aut odit aut fugit, sed quia consequuntur magni dolores eos.</p>
			</div>
			<div class="col-md-6 wel-grid-one bor_two text-center wow bounceInUp" data-wow-duration="1.5s" data-wow-delay="0.1s">
				<div class="wel-img">
					<img src="images/222.png" alt=" " />
				</div>
				<h4>consequntur</h4>
				<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur 
				aut odit aut fugit, sed quia consequuntur magni dolores eos.</p>
			</div>
			<div class="col-md-6 wel-grid-one bor_three text-center wow bounceInUp" data-wow-duration="1.5s" data-wow-delay="0.2s">
				<div class="wel-img">
					<img src="images/333.png" alt=" " />
				</div>
				<h4>aspernatur</h4>
				<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur 
				aut odit aut fugit, sed quia consequuntur magni dolores eos.</p>
			</div>
			<div class="col-md-6 wel-grid-one bor_four text-center wow bounceInUp" data-wow-duration="1.5s" data-wow-delay="0.3s">
				<div class="wel-img">
					<img src="images/444.png" alt=" " />
				</div>
				<h4>doloremque </h4>
				<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur 
				aut odit aut fugit, sed quia consequuntur magni dolores eos.</p>
			</div>
			<div class="clearfix"></div>
			<div class="dot">
				<span></span>
			</div>
		</div>
	</div>
</div>
</asp:Content>