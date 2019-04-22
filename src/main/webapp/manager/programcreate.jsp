
<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
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
				<h1 class="display-1" id="program-name-header"></h1>
			</div>
		</div>
	</div>
	<div class="container mb-5">
	<div class="row">
		<div class="col-md-12 program-buttons-container">
			<button onclick="window.location.href='company.jsp?id=<%=id%>'" type="button" class="btn btn-primary">
				Back
			</button>
		</div>
		<hr>
	</div>
	</div>
<div class="container">
		<div>
			<form action="programcreate.jsp" method="post">
				<form class="needs-validation" novalidate>
						<h2 class="mb-3">Program Information</h2>
						<div class="mb-3 form-group">
							<label for="programName">Program Name</label>
							<input type="text" class="form-control" id="programName" name="programName">
						</div>
						<div class="mb-3 form-group">
							<label for="programDesc">Program Description:</label>
							<textarea class="form-control" rows="5" id="programDesc" name ="programDesc"></textarea>
						</div>
						<div class="mb-3 form-group">
							<label for="discount">Discount:</label>
							<input type="number" class="form-control" id="discount" name ="discount">
						</div>
						<input type="hidden" value="<%=id%>" name="id">
						<input type="submit" class="btn btn-lg btn-primary btn-block mb-3" value="Submit">
				</form>
			</form>
		</div>
</div>
<%@include file="../include/footer.jsp" %>
<%
		id = request.getParameter("id");
		String name = request.getParameter("programName");
		String desc = request.getParameter("programDesc");
		String discount = request.getParameter("discount");

		
		if (ListGen.checkRequest(name)) {
			DataConnect data = DataConnect.getInstance();
			String flag = "-1";
			try {
				flag = data.programCreate(new Program(id, name, desc, discount));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!flag.equals("-1")) {
%>
<script type="text/javascript">alert("Successfully created profile!");
window.location.replace("program.jsp?programID=<%=flag%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Entry Failure");</script>
<% }
}

%>