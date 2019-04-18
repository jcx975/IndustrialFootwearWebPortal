
<%
	String id = "4";
	String username = "test";
	String email = "test@example.com";
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
<div class="container">
	<div class="col-md-12" id="top-buttons">
		<button type="button" id="edit-button" class="btn btn-success">Edit Profile</button>
	</div>
	<hr>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="userprofile.jsp" id="profile-form" method="POST">
				<input type="hidden" value="<%=id%>" name="id">
				<h2 class="mb-3">User Information</h2>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="firstName">First Name</label>
							<input type="text" class="form-control" id="firstName" name="firstName" value="<%=firstName%>">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="lastName">Last Name</label>
							<input type="text" class="form-control" id="lastName" name="lastName" value="<%=lastName%>">
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
			<h4 id="fullName"><%=firstName%> <%=lastName%></h4>
			<p id="currentUsername"><%=username%></p>
			<p id="currentEmail"><%=email%></p>
		</div>
	</div>
</div>