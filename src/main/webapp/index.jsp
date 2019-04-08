<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="main.js"></script>
</head>
<body>
<%@ page import="java.io.*" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="#">Footwear Web Portal</a>
		</li>
	</ul>
</nav>
<div class="row justify-content-center">
	<div class="col-sm-5">
		<div class="fw-box">
			<h1> Login Page </h1><br>
			<form action="index.jsp" method="get">
				Login your account:<br/><br/>

				User Name: <input id="user" name="user" type="text"/><br/>
				Password: <input id="password" name="password" type="text"/><br/>
				<input type="submit" Value="Submit"/>
			</form>
			<%
				String user = request.getParameter("user");
				String pass = request.getParameter("password");

				if (user != null && !user.trim().equals("")) {
					DataConnect data = new DataConnect();
					boolean flag = false;
					try {
						flag = data.userlookup(user, pass);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					if (flag) {
			%>
			<script type="text/javascript">window.location.replace("retailmanager.html");</script>
			<%
			} else {
			%>
			<script type="text/javascript">window.location.replace("error.html");</script>
			<%

					}
				}

			%>
		</div>
	</div>
</div>


</body>
</html>
