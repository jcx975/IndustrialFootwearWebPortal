<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>

<%
	String id = request.getParameter("id");
	String delete = request.getParameter("delete");
	String companyName = "";

	DataConnect data = DataConnect.getInstance();

	if (ListGen.checkRequest(delete)) {
		boolean flag = false;
		try {
			flag = data.deleteProfile(delete);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
		<script type="text/javascript">alert("Delete Success");
        window.location.replace("profiles.jsp");</script>
		<%
		} else { %>
		<script type="text/javascript">alert("Delete Failure");
        window.location.replace("company.jsp?id=<%=id%>")</script>
		<% }
		}

	try {
		Company company = data.getCompany(id);
		companyName = company.getCompanyName();
	} catch (SQLException e) {
		e.printStackTrace();
	}

%>
<%@include file="../include/meta.jsp"%>
<title>Deleting <%=companyName%></title>
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
			Are you sure you want to delete company: <%=companyName%> ?
		</div>
	</div>
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-12 company-buttons-container">
				<button onclick="window.location.href='deletecompany.jsp?delete=<%=id%>'" type="button"
						class="btn btn-primary mt-auto">
					Yes, delete company profile
				</button>
				<button onclick="window.location.href='company.jsp?id=<%=id%>'" type="button" class="btn btn-success">
					No, go back
				</button>
				<hr>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>