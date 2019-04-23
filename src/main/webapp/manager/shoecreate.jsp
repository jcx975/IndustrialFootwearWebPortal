<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%@include file="../include/meta.jsp" %>
<title>Shoe create</title>
<%@include file="../include/head.jsp" %>
<%@include file="../include/header.jsp" %>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12">
			<div class="btn-group" id="top-buttons">
				<a href="inventory.jsp" class="btn btn-primary mr-2">Back</a>
			</div>
		</div>
	</div>
	<hr>
</div>
<div class="container">
	<div>
		<form action="shoecreate.jsp" method="post">
			<form class="needs-validation" novalidate>
				<h2 class="mb-3">Shoe Information</h2>
				<div class="mb-3 form-group">
					<label for="shoeName">Shoe Name:</label>
					<input type="text" class="form-control" id="shoeName" name="shoeName">
				</div>
				<div class="mb-3 form-group">
					<label for="shoePrice">Shoe Price:</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">$</span>
						</div>
						<input type="number" class="form-control" id="shoePrice" name="shoePrice" min="0">
					</div>
				</div>
				<button class="btn btn-lg btn-primary btn-block mb-3" type="submit" formmethod="post">Submit</button>
			</form>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp" %>
<%
	String shoeName = request.getParameter("shoeName");
	String shoePrice = request.getParameter("shoePrice");


	if (ListGen.checkRequest(shoeName) && ListGen.checkRequest(shoePrice)) {
		DataConnect data = DataConnect.getInstance();
		String flag = "-1";
		try {
			flag = data.shoeCreate(new Shoe(shoeName, shoePrice));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!flag.equals("-1")) {
%>
<script type="text/javascript">alert("Successfully created shoe!");
window.location.replace("shoe.jsp?shoeID=<%=flag%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Entry Failure");</script>
<% }
}

%>