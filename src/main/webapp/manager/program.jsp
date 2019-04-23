<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%

	String programID = request.getParameter("programID");
	String companyID = "";
	String programName = "";
	String programDesc = "";
	String discount = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Program prog = data.getProgram(programID);
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
		<div class="col-md-12">
			<form class="needs-validation" novalidate action="deleteprogram.jsp" id="delete-form" method="POST">
				<div class="btn-group" id="top-buttons">
					<a href="company.jsp?id=<%=companyID%>" class="btn btn-primary mr-2">Back</a>
						<input type="hidden" name="companyID" value="<%=companyID%>">
						<input type="hidden" name="programID" value="<%=programID%>">
						<button type="submit" class="btn btn-danger mr-2" id="delete-button" formmethod="post">Delete Program</button>
						<button type="button" id="edit-button" class="btn btn-success mr-2">Edit Program</button>
					</div>
				</div>
		</form>
		<hr>
	</div>
	<hr>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="program.jsp?programID=<%=programID%>&companyID=<%=companyID%>" id="program-form" method="POST">
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
					<input type="number" class="form-control" id="discount" name="discount" value="<%=discount%>">
				</div>
				<button type="submit" class="btn btn-success" formmethod="post">Submit</button>
			</form>
		</div>
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
				<form action="program.jsp?programID=<%=programID%>" method="POST">
					<label for="shoeID">Shoe: </label><select class="form-control" id="shoeID" name="shoeID">
						<% try {
							out.print(ListGen.generateShoeSelectHTML());
						} catch (SQLException e) {
							e.printStackTrace();
						}%>
					</select>

					<input class="btn btn-primary" type="submit" value="Add shoe"></form>
			</div>
			<div class="row" id="shoe-list">
				<jsp:useBean id="shoe" class="footwearwebportal.servlet.ListGen"/>
				<%
					try {
						out.print(ListGen.generateProgramShoeListHTML(programID));
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<%
	programID =  request.getParameter("programID");
	programName = request.getParameter("programName");
	programDesc = request.getParameter("programDesc");
	discount = request.getParameter("discount");
	String removeShoe = request.getParameter("removeShoe");
	String shoeID = request.getParameter("shoeID");

	if(ListGen.checkRequest(programID) && ListGen.checkRequest(removeShoe)){
			try {
				data.removeShoeProgram(programID, removeShoe);
				%><script type="text/javascript">

window.location.replace("program.jsp?programID=<%=programID%>")</script><%
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	if(ListGen.checkRequest(programID) && ListGen.checkRequest(shoeID)){
		try {
			data.addShoeProgram(programID, shoeID);
%><script type="text/javascript">

    window.location.replace("program.jsp?programID=<%=programID%>")</script><%
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	if (ListGen.checkRequest(programName) && ListGen.checkRequest(programID)) {
		boolean flag = false;
		try {
			flag = data.updateProgram(new Program(programID,companyID, programName, programDesc, discount));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully update program!");
window.location.replace("program.jsp?programID=<%=programID%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}%>