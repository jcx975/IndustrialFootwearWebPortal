<%@ page import="footwearwebportal.ProfileList" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Company Profiles</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="js/profiles.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-2">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="#">Footwear Web Portal</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="index.jsp">Log out</a>
			</li>
		</ul>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12 welcome-banner">
				<h1 class="display-1">Company Profiles</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-5">
				<div class="form-group">
					<button onclick="window.location.href='companycreate.jsp'" type="button" class="btn btn-lg btn-primary mt-auto">Create new company profile</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-2">
				<h2>Current Profiles:</h2>

			</div>
			<div class="col-md-12 mb-2">
				<div class="form-group">
					<label for="profiles-search">Search:</label>
					<input type="text" class="form-control" id="profiles-search">
				</div>
			</div>
		</div>
		<div class="row" id="profiles-list">
			<jsp:useBean id="profiles" class="footwearwebportal.ProfileList"/>
			<%
				ProfileList profileList = new ProfileList();
				try {
					out.print(profileList.createList());
				} catch (SQLException e) {
					e.printStackTrace();
				}
			%>
		</div>
	</div>
</body>
</html>