
<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.*" %>

<%
	String UID = (String) request.getSession(false).getAttribute("UID");

	String username = "";
	String firstNameNew = "";
	String lastNameNew = "";
	String email = "";
	String group = "";

	DataConnect data = DataConnect.getInstance();

	if(ListGen.checkRequest(UID)) {
		try {
			User user = data.getUserInfo(UID);
			username = user.getUsername();
			firstNameNew = user.getFirstName();
			lastNameNew = user.getLastName();
			email = user.getEmail();
			group = user.getGroup();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
%>

<%@include file="include/meta.jsp"%>
<title>User Profile</title>
<%@include file="include/head.jsp"%>
<link rel="stylesheet" type="text/css" media="screen" href="css/userprofile.css">
<script src="js/userprofile.js"></script>
<%@include file="include/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 welcome-banner">
			<h1 class="display-2">Profile</h1>
		</div>
	</div>
</div>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12" id="top-buttons">
			<a href="${pageContext.request.contextPath}/<%=group%>/" class="btn btn-primary">Back</a>
			<button type="button" id="edit-button" class="btn btn-success">Edit Profile</button>
		</div>
		<hr>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="userprofile.jsp" id="profile-form" method="POST">
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

			<form class="needs-validation" novalidate action="userprofile.jsp" id="password-form" method="post">
				<div class="col-md-12">
					<div class="form-group">
						<label for="oldPassword">Old password</label>
						<input type="password" class="form-control" id="oldPassword" name="oldPassword" value="">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="newPassword">New password</label>
						<input type="password" class="form-control" id="newPassword" name="newPassword" value="">
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
<%@include file="include/footer.jsp"%>

<%
	firstNameNew = request.getParameter("firstNameNew");
	lastNameNew = request.getParameter("lastNameNew");
	email = request.getParameter("email");

	if (ListGen.checkRequest(UID) && ListGen.checkRequest(firstNameNew)
			&& ListGen.checkRequest(lastNameNew) && ListGen.checkRequest(email)) {
		boolean flag = false;
		try {
			flag = data.updateUserBasic(firstNameNew, lastNameNew, email, UID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully updated user!");
window.location.replace("userprofile.jsp")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}

	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	if (ListGen.checkRequest(UID) && ListGen.checkRequest(oldPassword) && ListGen.checkRequest(newPassword)) {
		String rightPassword;
		boolean flag = false;
		try {
			rightPassword = data.userLogin(username, oldPassword);
			if(rightPassword.equals(UID)){
				flag = data.updateUserPassword(UID, newPassword);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag) {%>
<form name="logout" action="${pageContext.request.contextPath}/logout" method="post">
	<input type="hidden" value="Logout">
</form>

<script type="text/javascript">alert("Successfully updated user password!");
document.logout.submit();</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}

%>