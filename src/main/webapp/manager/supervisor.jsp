<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>

<%

	String id = request.getParameter("id");
	String companyID = request.getParameter("companyID");

	String companyName = "";
	String username = "";
	String password = "";
	String firstNameNew = "";
	String lastNameNew = "";
	String email = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Company company = data.getCompany(id);
		User supervisor = data.getUserInfo(id);
		companyName = company.getCompanyName();
		username = supervisor.getUsername();
		password = supervisor.getPassword();
		firstNameNew = supervisor.getFirstName();
		lastNameNew = supervisor.getLastName();
		email = supervisor.getEmail();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

<%@include file="../include/meta.jsp"%>
<title><%=companyName%> supervisor <%=firstNameNew%> <%=lastNameNew%></title>
<%@include file="../include/head.jsp"%>
<link rel="stylesheet" type="text/css" media="screen" href="../css/userprofile.css">
<script src="../js/supervisor.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 welcome-banner">
			<h1 class="display-2">Profile</h1>
		</div>
	</div>
</div>
<div class="container">
	<div class="col-md-12" id="top-buttons">
		<button type="button" id="edit-button" class="btn btn-success">Edit Supervisor</button>
	</div>
	<hr>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="supervisor.jsp?id=<%=id%>" id="profile-form" method="POST">
				<h2 class="mb-3">User Information</h2>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="firstNameNew">First Name</label>
							<input type="text" class="form-control" id="firstNameNew" name="firstNameNew" value="<%=firstNameNew%>">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="lastNameNew">Last Name</label>
							<input type="text" class="form-control" id="lastNameNew" name="lastNameNew" value="<%=lastNameNew%>">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" class="form-control" id="email" name="email" value="<%=email%>">
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4">
			<h4 id="fullName"><%=firstNameNew%> <%=lastNameNew%></h4>
			<p id="currentUsername"><%=username%></p>
			<p id="currentEmail"><%=email%></p>
		</div>
	</div>
</div>

<%
	firstNameNew = request.getParameter("firstNameNew");
	lastNameNew = request.getParameter("lastNameNew");
	email = request.getParameter("email");

	if (id != null && !id.trim().equals("") && firstNameNew != null && !firstNameNew.trim().equals("")) {
		boolean flag = false;
		try {
			flag = data.updateUserBasic(firstNameNew, lastNameNew, email, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully updated supervisor!");
window.location.replace("supervisor.jsp?id=<%=id%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}%>