<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%

	String id = request.getParameter("id");
	String companyID = "";
	String programName = "";
	String programDesc = "";
	String discount = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Program prog = data.getProgram(id);
		companyID = prog.getCompanyID();
		programName = prog.getProgramName();
		programDesc = prog.getProgramDesc();
		discount = prog.getDiscount();

	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<%@include file="../include/meta.jsp"%>
<title><%=programName%></title>
<%@include file="../include/head.jsp"%>
<link rel="stylesheet" type="text/css" media="screen" href="../css/program.css">
<script src="../js/program.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12" id="top-buttons">
			<a href="program.jsp" class="btn btn-primary">Back</a>
			<button onclick="window.location.href='deleteprogram.jsp?id=<%=id%>'" type="button" id="delete-button" class="btn btn-danger">Delete Profile</button>
			<button type="button" id="edit-button" class="btn btn-success">Edit Program</button>
		</div>
		<hr>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="program.jsp?id=<%=id%>" id="company-form" method="POST">
				<input type="hidden" value="<%=id%>" name="id">
				<h2 class="mb-3">Program Information</h2>
				<div class="mb-3 form-group">
					<label for="programName">Program Name</label>
					<input type="text" class="form-control" id="programName" name="programName" value="<%=programName%>">
				</div>
				<div class="mb-3 form-group">
					<label for="programDesc">Program Description:</label>
					<textarea class="form-control" rows="5" id="programDesc" name="programDesc"><%=programDesc%></textarea>
				</div>
				<div class="form-group">
					<label for="discount">Discount:</label>
					<input type="text" class="form-control" id="discount" name="discount" value="<%=discount%>">
				</div>
				<input type="hidden" value="<%=id%>" name="id" />
				<button type="submit" class="btn btn-success" formmethod="post">Submit</button>
			</form>
		</div>
		<div class="col-md-4">
			<h4><p id="currentProgramName"><%=programName%></p></h4>
			<p id="currentProgramDesc"><%=programDesc%></p>
			<p id="currentDiscount"><%=discount%></p>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>

<%
	id =  request.getParameter("id");
	programName = request.getParameter("programName");
	programDesc = request.getParameter("programDesc");
	discount = request.getParameter("discount");



	if (programName != null && !programName.trim().equals("") && id != null && !id.trim().equals("")) {
		boolean flag = false;
		try {
			flag = data.updateProgram(new Program(id,companyID, programName, programDesc, discount));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully update profile!");
window.location.replace("program.jsp?id=<%=id%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}%>