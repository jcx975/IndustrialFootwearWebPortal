<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@ page import="footwearwebportal.*" %>
<%@ page import="java.sql.SQLException" %>
<%@include file="include/meta.jsp"%>
<title>Edit company</title>
<%@include file="include/head.jsp"%>
<%@include file="include/header.jsp"%>
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
			<button onclick="window.location.href='profiles.jsp'" type="button" class="btn btn-lg btn-primary mt-auto"><
				Back
			</button>
			<hr>
		</div>
	</div>
</div>
<div class="container">
	<div>
		<form action="companycreate.jsp" method="post">
			<form class="needs-validation" novalidate>
				<h2 class="mb-3">Company Information</h2>
				<div class="mb-3 form-group">
					<label for="companyName">Company Name</label>
					<input type="text" class="form-control" id="companyName" name="companyName">
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="state">State:</label>
							<select class="form-control" id="state" name="state">
								<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AZ">Arizona</option>
								<option value="AR">Arkansas</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="DC">District Of Columbia</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="HI">Hawaii</option>
								<option value="ID">Idaho</option>
								<option value="IL">Illinois</option>
								<option value="IN">Indiana</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="ME">Maine</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NV">Nevada</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PA">Pennsylvania</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VT">Vermont</option>
								<option value="VA">Virginia</option>
								<option value="WA">Washington</option>
								<option value="WV">West Virginia</option>
								<option value="WI">Wisconsin</option>
								<option value="WY">Wyoming</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="city">City:</label>
							<input type="text" class="form-control" id="city" name="city">
						</div>
					</div>
				</div>
				<div class="mb-3 form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="comment" name="comments"></textarea>
				</div>
				<h2>Contact information</h2>
				<div class="form-group">
					<label for="email">Email:</label>
					<input type="email" class="form-control" id="email" name="email">
				</div>
				<button class="btn btn-lg btn-primary btn-block mb-3" type="submit" formmethod="post">Submit</button>
			</form>
		</form>
	</div>
</div>
<%
	String name = request.getParameter("companyName");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String email = request.getParameter("email");
	String comments = request.getParameter("comments");


	if (name != null && !name.trim().equals("")) {
		DataConnect data = DataConnect.getInstance();
		boolean flag = false;
		try {
			flag = data.profileCreate(new CompanyData(name, city, state, email, comments));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully created profile!");
window.location.replace("profiles.jsp")</script>
<%
} else { %>
<script type="text/javascript">alert("Entry Failure");</script>
<% }
}

%>