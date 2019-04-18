
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Edit Program</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="company.js"></script>
</head>
<body>
<%@ page import="java.io.*" %> 
<%@ page import="footwearwebportal.*" %>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-2">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="#">Create A Program</a>
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
				<button type="button" class="mr-4 btn btn-primary">< Back</button>
				<hr>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
				<div class="col-md-8">
					<form action="programcreate.jsp" method="get">
						<form class="needs-validation" novalidate>
						<h2 class="mb-3">Program Information</h2>
						<div class="mb-3 form-group">
							<label for="programName">Program Name</label>
							<input type="text" class="form-control" id="programName">
						</div>
						<div class="row">
						</div>
						<div class="mb-3 form-group">
							<label for="programDesc">Program Desc:</label>
							<textarea class="form-control" rows="5" id="programDesc"></textarea>
						</div>
						<div class="form-group">
							<label for="discount">Discount:</label>
							<input type="text" class="form-control" id="discount">
						</div>
						<input type="submit" Value="Submit" ></input>
					</form>
				</div>
				<div class="col-md-4">
					<h4>Current information:</h4>
					<p id="currentProgramName"></p>
					<p id="currentProgramDesc"></p>
					<p id="currentDiscount"></p>
				</div>
				</form>
				</div>
	</div>
<%
		String id = "Htest";
//talk to Tim to see how ID's are incremented. also how to get program and company ID's

		String programName = request.getParameter("programName");
		String programDesc = request.getParameter("programDesc");
		String discount = request.getParameter("discount");
					Program prog = new Program(id,programName,programDesc,discount);
		
		DataConnect DBentry=new DataConnect();
		boolean flag=DBentry.programCreate(prog);

%>				
</body>
</html>
