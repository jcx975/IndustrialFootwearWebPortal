<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%
	String UID = (String) request.getSession(false).getAttribute("UID");
	String companyName = "";
	String city = "";
	String state = "";
	String email = "";
	String comments = "";
	String companyID = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Supervisor supervisor = data.getSupervisor(UID);
		companyID = supervisor.getCompanyID();
		Company company = data.getCompany(companyID);
		companyName = company.getCompanyName();
		city = company.getCity();
		state = company.getState();
		email = company.getEmail();
		comments = company.getComments();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<%@include file="../include/meta.jsp"%>
<title><%=companyName%></title>
<%@include file="../include/head.jsp"%>
<link rel="stylesheet" type="text/css" media="screen" href="../css/company.css">
<script src="../js/company.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12" id="top-buttons">
			<a href="${pageContext.request.contextPath}/supervisor/" class="btn btn-primary">Back</a>
		</div>
		<hr>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<h4><%=companyName%></h4>
			<p id="currentCompanyCity"><%=city%></p>
			<p id="currentCompanyState"><%=state%></p>
			<p id="currentCompanyEmail"><%=email%></p>
			<p id="currentCompanyComment"><%=comments%></p>
		</div>
	</div>
</div>
<div class="container mt-5 mb-5 bg-light">
	<div class="row">
		<div class="col-md-6 border programs-container">
			<div class="mb-2">
				<h2 class="text-center">Supervisor Accounts</h2>
			</div>
			<input type="text" class="form-control" id="supervisorSearch" placeholder="Search supervisors">
			<div class="row" id="supervisors-list">
				<jsp:useBean id="company" class="footwearwebportal.servlet.ListGen"/>
				<%
					try {
						out.print(ListGen.generateSupervisorListHTML(companyID, false));
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
			</div>
		</div>
		<div class="col-md-6 border programs-container">
			<div class="mb-2">
				<h2 class="text-center">Programs</h2>
			</div>
			<input type="text" class="form-control" id="programSearch" placeholder="Search programs">
			<div class="row" id="programs-list">
				<%
					try {
						out.print(ListGen.generateProgramListHTML(companyID));
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>