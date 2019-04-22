<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>

<%
	String programID = request.getParameter("programID");
	String companyID = request.getParameter("companyID");
	String delete = request.getParameter("delete");

	String companyName = "";
	String programName = "";

	DataConnect data = DataConnect.getInstance();

	if (ListGen.checkRequest(delete)) {
		boolean flag = false;
		try {
			flag = data.deleteProgram(programID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Delete Success");
window.location.replace("company.jsp?id=<%=companyID%>");</script>
<%
} else { %>
<script type="text/javascript">alert("Delete Failure");
window.location.replace("company.jsp?id=<%=companyID%>")</script>
<% }
}

	try {
		Company company = data.getCompany(companyID);
		Program program = data.getProgram(programID);
		companyName = company.getCompanyName();
		programName = program.getProgramName();
	} catch (SQLException e) {
		e.printStackTrace();
	}

%>
<%@include file="../include/meta.jsp"%>
<title>Deleting <%=programName%> from <%=companyName%></title>
<%@include file="../include/head.jsp"%>
<%@include file="../include/header.jsp"%>
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
			Are you sure you want to delete program <%=programName%> from <%=companyName%> ?
		</div>
	</div>
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-12 company-buttons-container">
				<form class="needs-validation" novalidate action="deleteprogram.jsp" id="company-form" method="POST">
					<input type="hidden" name="companyID" value="<%=companyID%>">
					<input type="hidden" name="programID" value="<%=programID%>">
					<input type="hidden" name="delete" value="delete">
					<button type="submit" class="btn btn-primary mt-auto" formmethod="post">Delete</button>
				</form>
				<button onclick="window.location.href='company.jsp?id=<%=companyID%>'" type="button" class="btn btn-success">
					No, go back
				</button>
				<hr>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>