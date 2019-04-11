<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>

<%
	String id = request.getParameter("id");
	String delete = request.getParameter("delete");
	String companyName = "";

	DataConnect data = serverInit.getConnection();

	if (delete != null && !delete.trim().equals("")) {
		boolean flag = false;
		try {
			flag = data.deleteProfile(delete);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
		<script type="text/javascript">alert("Delete Success");
        window.location.replace("profiles.jsp");</script>
		<%
		} else { %>
		<script type="text/javascript">alert("Delete Failure");
        window.location.replace("company.jsp?id=<%=id%>")</script>
		<% }
		}

	try {
		CompanyData company = data.getCompany(id);
		companyName = company.getCompanyName();
	} catch (SQLException e) {
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Deleting <%=companyName%>
	</title>
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

<div class="container">
	<div class="row">
		<div>
			Are you sure you want to delete company: <%=companyName%> ?
		</div>
	</div>
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-12 company-buttons-container">
				<button onclick="window.location.href='deletecompany.jsp?delete=<%=id%>'" type="button"
						class="btn btn-primary mt-auto">
					Yes, delete company profile
				</button>
				<button onclick="window.location.href='company.jsp?id=<%=id%>'" type="button" class="btn btn-success">
					No, go back
				</button>
				<hr>
			</div>
		</div>
	</div>

</div>

</body>
</html>
