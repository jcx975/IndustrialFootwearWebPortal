<%@ page import="footwearwebportal.ProfileList" %>
<%@ page import="java.sql.SQLException" %>
<%@include file="../include/meta.jsp"%>
<title>Company Profiles</title>
<%@include file="../include/head.jsp"%>
<script src="../js/profiles.js"></script>
<%@include file="../include/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 welcome-banner">
			<h1 class="display-1">Company Profiles</h1>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12 mb-5">
			<div class="form-group">
				<button onclick="window.location.href='retailmanager.jsp'" type="button" class="btn btn-lg btn-primary mt-auto"><
					Back
				</button>
				<button onclick="window.location.href='companycreate.jsp'" type="button" class="btn btn-lg btn-success mt-auto">Create new company profile</button>
			</div>
		</div>
	</div>
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
		<jsp:useBean id="profiles" class="footwearwebportal.ProfileList"/>
		<%
			ProfileList profileList = new ProfileList();
			try {
				out.print(profileList.generateListHTML());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		%>
	</div>
</div>
<%@include file="../include/footer.jsp"%>