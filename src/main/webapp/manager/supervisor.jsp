<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>

<%
	String supervisorID = request.getParameter("supervisorID");
	String companyID = request.getParameter("companyID");

	String companyName = "";
	String username = "";
	String firstNameNew = "";
	String lastNameNew = "";
	String email = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Company company = data.getCompany(companyID);
		User supervisor = data.getUserInfo(supervisorID);
		companyName = company.getCompanyName();
		username = supervisor.getUsername();
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
<link rel="stylesheet" type="text/css" media="screen" href="../css/supervisor.css">
<script src="../js/supervisor.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12" id="top-buttons">
			<a href="company.jsp?id=<%=companyID%>" class="btn btn-primary">Back</a>
			<form class="needs-validation" novalidate action="deletesupervisor.jsp" id="delete-form" method="POST">
				<input type="hidden" name="companyID" value="<%=companyID%>">
				<input type="hidden" name="supervisorID" value="<%=supervisorID%>">
				<button type="submit" class="btn btn-primary mt-auto" formmethod="post">Delete Supervisor</button>
			</form>
			<button type="button" id="edit-button" class="btn btn-success">Edit Supervisor</button>
		</div>
		<hr>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="supervisor.jsp?id=<%=supervisorID%>&companyID=<%=companyID%>" id="profile-form" method="POST">
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
					<input type="submit" class="btn btn-success" value="Submit">
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
<%@include file="../include/footer.jsp"%>
<%
	firstNameNew = request.getParameter("firstNameNew");
	lastNameNew = request.getParameter("lastNameNew");
	email = request.getParameter("email");

	if (supervisorID != null && !supervisorID.trim().equals("") && firstNameNew != null && !firstNameNew.trim().equals("")) {
		boolean flag = false;
		try {
			flag = data.updateUserBasic(firstNameNew, lastNameNew, email, supervisorID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully updated supervisor!");
window.location.replace("supervisor.jsp?supervisorID=<%=supervisorID%>&companyID=<%=companyID%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}%>