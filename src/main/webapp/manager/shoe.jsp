<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%
	String shoeID = request.getParameter("shoeID");
	String shoeName = "";
	String shoePrice = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Shoe shoe = data.getShoe(shoeID);
		shoeName = shoe.getShoeName();
		shoePrice = shoe.getShoePrice();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<%@include file="../include/meta.jsp"%>
<title><%=shoeName%></title>
<%@include file="../include/head.jsp"%>
<link rel="stylesheet" type="text/css" media="screen" href="../css/shoe.css">
<script src="../js/shoe.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12">
			<form class="needs-validation" novalidate action="deleteshoe.jsp" id="delete-form" method="POST">
				<div class="btn-group" id="top-buttons">
					<a href="inventory.jsp" class="btn btn-primary mr-2">Back</a>
					<input type="hidden" name="shoeID" value="<%=shoeID%>">
					<button type="submit" class="btn btn-danger mr-2" id="delete-button" formmethod="post">Delete Shoe</button>
					<button type="button" id="edit-button" class="btn btn-success mr-2">Edit Shoe</button>
				</div>
			</form>
		</div>
		<hr>
	</div>
	<hr>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="shoe.jsp?shoeID=<%=shoeID%>" id="shoe-form" method="POST">
				<h2 class="mb-3">Shoe Information</h2>
				<div class="mb-3 form-group">
					<label for="shoeName">Shoe Name:</label>
					<input type="text" class="form-control" id="shoeName" name="shoeName" value="<%=shoeName%>">
				</div>
				<div class="mb-3 form-group">
					<label for="shoePrice">Shoe Price:</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">$</span>
						</div>
						<input type="number" class="form-control" id="shoePrice" name="shoePrice" value="<%=shoePrice%>" min="0">
					</div>
				</div>
				<button type="submit" class="btn btn-success" formmethod="post">Submit</button>
			</form>
		</div>
		<div class="col-md-4">
			<h4><%=shoeName%></h4>
			<p>Price: $<%=shoePrice%></p>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>

<%
	shoeName =  request.getParameter("shoeName");
	shoePrice = request.getParameter("shoePrice");

	if (ListGen.checkRequest(shoeID) && ListGen.checkRequest(shoeName) && ListGen.checkRequest(shoePrice)) {
		boolean flag = false;
		try {
			flag = data.updateShoe(new Shoe(shoeID, shoeName, shoePrice));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully updated shoe!");
window.location.replace("shoe.jsp?shoeID=<%=shoeID%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}%>