<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>

<%
	String shoeID = request.getParameter("shoeID");
	String delete = request.getParameter("delete");

	String shoeName = "";

	DataConnect data = DataConnect.getInstance();

	if (delete != null && delete.equals("delete")){
		boolean flag = false;
		try {
			flag = data.deleteShoe(shoeID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Delete Success");
window.location.replace("inventory.jsp");</script>
<%
} else { %>
<script type="text/javascript">alert("Delete Failure");
window.location.replace("shoe.jsp?shoeID=<%=shoeID%>")</script>
<% }
}

	try {
		Shoe shoe = data.getShoe(shoeID);
		shoeName = shoe.getShoeName();
	} catch (SQLException e) {
		e.printStackTrace();
	}

%>
<%@include file="../include/meta.jsp"%>
<title>Deleting <%=shoeName%></title>
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
			Are you sure you want to delete shoe <%=shoeName%> ?
		</div>
	</div>
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-12 company-buttons-container">
				<form class="needs-validation" novalidate action="deleteshoe.jsp" id="shoe-form" method="POST">
					<input type="hidden" name="shoeID" value="<%=shoeID%>">
					<input type="hidden" name="delete" value="delete">
					<button type="submit" class="btn btn-primary mt-auto" formmethod="post">Delete</button>
				</form>
				<button onclick="window.location.href='shoe.jsp?id=<%=shoeID%>'" type="button" class="btn btn-success">
					No, go back
				</button>
				<hr>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>