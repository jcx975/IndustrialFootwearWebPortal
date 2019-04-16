<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.*" %>
<%

	String id = request.getParameter("id");
	String companyName = "";
	String city = "";
	String state = "";
	String email = "";
	String comments = "";

	DataConnect data = DataConnect.getInstance();

	try {
		Company company = data.getCompany(id);
		companyName = company.getCompanyName();
		city = company.getCity();
		state = company.getState();
		email = company.getEmail();
		comments = company.getComments();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<%@include file="include/meta.jsp"%>
<title><%=companyName%></title>
<%@include file="include/head.jsp"%>
<link rel="stylesheet" type="text/css" media="screen" href="css/company.css">
<script src="js/company.js"></script>
<%@include file="include/header.jsp"%>
<div class="container mt-2 mb-5">
	<div class="row">
		<div class="col-md-12" id="top-buttons">
			<a href="profiles.jsp" class="btn btn-primary">Back</a>
			<button onclick="window.location.href='deletecompany.jsp?id=<%=id%>'" type="button" id="delete-button" class="btn btn-danger">Delete Profile</button>
			<button type="button" id="edit-button" class="btn btn-success">Edit Profile</button>
		</div>
		<hr>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-8" id="edit-form">
			<form class="needs-validation" novalidate action="company.jsp?id=<%=id%>" id="company-form" method="POST">
				<input type="hidden" value="<%=id%>" name="id">
				<h2 class="mb-3">Company information</h2>
				<div class="mb-3 form-group">
					<label for="companyName">Company Name</label>
					<input type="text" class="form-control" id="companyName" name="companyName" value="<%=companyName%>">
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
							<script type="text/javascript">
								document.getElementById('state').value = '<%=state%>';
							</script>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="city">City:</label>
							<input type="text" class="form-control" id="city" name="city" value="<%=city%>">
						</div>
					</div>
				</div>
				<div class="mb-3 form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="comment" name="comments"><%=comments%></textarea>
				</div>
				<h2>Contact information</h2>
				<div class="form-group">
					<label for="email">Email:</label>
					<input type="email" class="form-control" id="email" name="email" value="<%=email%>">
				</div>
				<input type="hidden" value="<%=id%>" name="id" />
				<button type="submit" class="btn btn-success" formmethod="post">Submit</button>
			</form>
		</div>
		<div class="col-md-4">
			<h4><p id="currentCompanyName"><%=companyName%></p></h4>
			<p id="currentCompanyCity"><%=city%></p>
			<p id="currentCompanyState"><%=state%></p>
			<p id="currentCompanyEmail"><%=email%></p>
			<p id="currentCompanyComment"><%=comments%></p>
		</div>
	</div>
</div>
<%@include file="include/footer.jsp"%>

<%
	id = request.getParameter("id");
	companyName = request.getParameter("companyName");
	city = request.getParameter("city");
	state = request.getParameter("state");
	email = request.getParameter("email");
	comments = request.getParameter("comments");


	if (companyName != null && !companyName.trim().equals("") && id != null && !id.trim().equals("")) {
		boolean flag = false;
		try {
			flag = data.updateProfile(new Company(id, companyName, city, state, email, comments));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (flag) {%>
<script type="text/javascript">alert("Successfully update profile!");
window.location.replace("company.jsp?id=<%=id%>")</script>
<%
} else { %>
<script type="text/javascript">alert("Update Failure");</script>
<% }
}%>