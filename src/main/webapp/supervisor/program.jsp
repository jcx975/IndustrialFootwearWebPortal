<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%

	String programID = request.getParameter("programID");
	String programName = "";
	String programDesc = "";
	String discount = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Program prog = data.getProgram(programID);
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
		<div class="col-md-12">
				<div class="btn-group" id="top-buttons">
					<a href="company.jsp" class="btn btn-primary mr-2">Back</a>
				</div>
			<hr>
		</div>
		<hr>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h4><%=programName%></h4>
				<p>Program description: <%=programDesc%></p>
				<p>Discount: <%=discount%>%</p>
			</div>
		</div>
	</div>
	<div class="container mt-5 mb-5 bg-light">
		<div class="row">
			<div class="col-md-6 border shoes-container">
				<div class="mb-2">
					<h2 class="text-center">Shoes</h2>
				</div>
				<div class="row" id="shoe-list">
					<jsp:useBean id="shoe" class="footwearwebportal.servlet.ListGen"/>
					<%
						try {
							out.print(ListGen.generateProgramShoeListHTML(programID, false));
						} catch (SQLException e) {
							e.printStackTrace();
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>