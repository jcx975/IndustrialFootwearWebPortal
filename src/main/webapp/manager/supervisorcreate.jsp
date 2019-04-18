<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>
<%@include file="../include/meta.jsp" %>
<title>Edit company</title>
<%@include file="../include/head.jsp" %>
<%@include file="../include/header.jsp" %>
<% String id = request.getParameter("id"); %>
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
			<button onclick="window.location.href='profiles.jsp'" type="button" class="btn btn-lg btn-primary mt-auto">
				Back
			</button>
			<hr>
		</div>
	</div>
</div>
<div class="container">
	<div>
		<form action="supervisorcreate.jsp" method="post">
			<form class="needs-validation" novalidate>
				<h2 class="mb-3">Supervisor Information</h2>
				<div class="mb-3 form-group">
					<label for="companyName">Username</label>
					<input type="text" class="form-control" id="companyName" name="username">
				</div>
				<div class="mb-3 form-group">
					<label for="companyName">Password</label>
					<input type="text" class="form-control" id="password" name="password">
				</div>
				<div class="mb-3 form-group">
					<label for="firstName">First name</label>
					<input type="text" class="form-control" id="firstName" name="firstName">
				</div>
				<div class="mb-3 form-group">
					<label for="companyName">Last name</label>
					<input type="text" class="form-control" id="lastName" name="lastName">
				</div>
				<div class="mb-3 form-group">
					<label for="companyName">Email</label>
					<input type="text" class="form-control" id="email" name="email">
				</div>
				<input type="hidden" value="<%=id%>" name="id" />
				<button class="btn btn-lg btn-primary btn-block mb-3" type="submit" formmethod="post">Submit</button>
			</form>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp" %>
<%
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	String group = "supervisor";
	String firstNameNew = request.getParameter("firstName");
	String lastNameNew = request.getParameter("lastName");
	String email = request.getParameter("email");


	if (name != null && !name.trim().equals("")) {
		DataConnect data = DataConnect.getInstance();
		String flag = "-1";
		try {
			flag = data.supervisorCreate(new Supervisor(name, password, group, firstNameNew, lastNameNew, email, id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!flag.equals("-1")) {
%>
<script type="text/javascript">alert("Successfully created supervisor!");
window.location.replace("company.jsp?id=<%=id%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Entry Failure");</script>
<% }
}

%>