<%@ page import="footwearwebportal.ProfileList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%

	String id = request.getParameter("id");
	String companyName = "";
	String city = "";
	String state = "";
	String email = "";
	String comments = "";

	DataConnect data = serverInit.getConnection();
	try {
		CompanyData company = data.getCompany(id);
		companyName = company.getCompanyName();
		city = company.getCity();
		state = company.getState();
		email = company.getEmail();
		comments = company.getComments();
	} catch (SQLException e) {
		e.printStackTrace();
	}

%><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><%=companyName%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<%--	<script src="js/company.js"></script>--%>
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
			<a class="nav-link" href="#">Log out</a>
		</li>
	</ul>
</nav>
<div class="container">
	<div class="row">
		<div class="col-md-12 welcome-banner">
			<h1 class="display-1" id="company-name-header"></h1>
		</div>
	</div>
</div>
<div class="container mb-5">
	<div class="row">
		<div class="col-md-12 company-buttons-container">
			<button onclick="window.location.href='profiles.jsp'" type="button" class="btn btn-primary mt-auto"><
				Back
			</button>
			<button type="button" class="btn btn-danger">Delete Profile</button>
			<button onclick="window.location.href='editcompany.jsp?id=<%=id%>'" type="button" class="btn btn-success">Update Profile</button>
			<hr>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<h4><p id="currentCompanyName"><%=companyName%></p></h4>
			<p id="currentCompanyCity"><%=city%></p>
			<p id="currentCompanyState"><%=state%></p>
			<p id="currentCompanyEmail"><%=email%></p>
			<p id="currentCompanyComment"><%=comments%></p>
		</div>
	</div>
</div>
</body>
</html>