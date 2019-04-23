<%@ page import="footwearwebportal.servlet.ListGen" %>
<%@ page import="java.sql.SQLException" %>
<%@include file="../include/meta.jsp"%>
<title>Company Profiles</title>
<%@include file="../include/head.jsp"%>
<script src="../js/profiles.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 welcome-banner">
			<h1 class="display-2">Company Profiles</h1>
		</div>
	</div>
</div>
<div class="container mb-5">
	<div class="row">
		<div class="col-md-12">
			<div class="btn-group" id="top-buttons">
				<a href="index.jsp" class="btn btn-primary mr-2">Back</a>
				<a href="companycreate.jsp" class="btn btn-success mr-2">Create new company profile</a>
			</div>
		</div>
	</div>
	<hr>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12 mb-2">
			<h2>Current Profiles:</h2>
		</div>
		<div class="col-md-12 mb-2">
			<div class="form-group">
				<label for="profiles-search">Search:</label>
				<input type="text" class="form-control" id="profiles-search">
			</div>
		</div>
	</div>
	<div class="row" id="profiles-list">
		<jsp:useBean id="profiles" class="footwearwebportal.servlet.ListGen"/>
		<%
			try {
				out.print(ListGen.generateListHTML());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		%>
	</div>
</div>
<%@include file="../include/footer.jsp"%>