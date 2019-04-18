
<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>
<%@include file="../include/meta.jsp" %>
<title>Edit Program</title>
<%@include file="../include/head.jsp" %>
<%@include file="../include/header.jsp" %>
<%
   	String id = request.getParameter("id");
%>
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
							<label for="programDesc">Program Description:</label>
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
<%@include file="../include/footer.jsp" %>
<%

		String name = request.getParameter("programName");
		String desc = request.getParameter("programDesc");
		String discount = request.getParameter("discount");

		
		if (name != null && !name.trim().equals("")) {
			DataConnect data = DataConnect.getInstance();
			String flag = "-1";
			try {
				flag = data.programCreate(new Program(id, name, desc, discount));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!flag.equals("-1")) {
%>script type="text/javascript">alert("Successfully created profile!");
window.location.replace("program.jsp?id=<%=flag%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Entry Failure");</script>
<% }
}

%>