<%@ page import="java.sql.SQLException" %>
<%@ page import="footwearwebportal.DataConnect" %>
<%@ page import="footwearwebportal.serverInit" %>
<%@ page import="footwearwebportal.CompanyData" %>

<%
	String id = request.getParameter("id");
	String companyName = "";
	String city = "";
	String state = "";
	String email = "";
	String comments = "";

	DataConnect data = serverInit.getConnection();
	try {
		CompanyData company = data.getCompany(id);
		companyName = company.getCompanyName();
		city = company.getCity();
		state = company.getState();
		email = company.getEmail();
		comments = company.getComments();
	} catch (SQLException e) {
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Edit <%=companyName%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%--	<script src="js/company.js"></script>--%>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-2">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="#">Footwear Web Portal</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="#">Log out</a>
			</li>
		</ul>
	</nav>
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
				<button onclick="window.location.href='company.jsp?id=<%=id%>'" type="button" class="btn btn-primary mt-auto"><
					Back
				</button>
				<button onclick="window.location.href='deletecompany.jsp?id=<%=id%>'" type="button" class="btn btn-danger">Delete Profile</button>
				<hr>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<!-- <form> -->
				<div class="col-md-8">
					<form class="needs-validation" novalidate action="editcompany.jsp" method="post">
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
					<h4>Current information:</h4>

					<p id="currentCompanyName"><%=companyName%></p>
					<p id="currentCompanyCity"><%=city%></p>
					<p id="currentCompanyState"><%=state%></p>
					<p id="currentCompanyEmail"><%=email%></p>
					<p id="currentCompanyComment"><%=comments%></p>

				</div>
			<!-- </form> -->
		</div>
	</div>
</body>
</html>

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
			flag = data.updateProfile(id, companyName, city, state, email, comments);
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