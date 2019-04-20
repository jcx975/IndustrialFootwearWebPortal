<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.servlet.ListGen" %>
<%@include file="../include/meta.jsp" %>
<title>Shoe create</title>
<%@include file="../include/head.jsp" %>
<%@include file="../include/header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-12 welcome-banner">
			<h1 class="display-1" id="company-name-header"></h1>
		</div>
	</div>
</div>
<div class="container mb-5">
	<div class="row">
		<div class="col-md-12 company-buttons-container">
			<button onclick="window.location.href='inventory.jsp'" type="button" class="btn btn-lg btn-primary mt-auto">
				Back
			</button>
			<hr>
		</div>
	</div>
</div>
<div class="container">
	<div>
		<form action="shoecreate.jsp" method="post">
			<form class="needs-validation" novalidate>
				<h2 class="mb-3">Shoe Information</h2>
				<div class="mb-3 form-group">
					<label for="shoeName">Shoe Name</label>
					<input type="text" class="form-control" id="shoeName" name="shoeName">
				</div>
				<div class="mb-3 form-group">
					<label for="shoePrice">Price:</label>
					<textarea class="form-control" rows="5" id="shoePrice" name="shoePrice"></textarea>
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