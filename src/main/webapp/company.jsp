<%@ page import="footwearwebportal.ProfileList" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Edit company</title>
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
				<button onclick="window.location.href='profiles.jsp'" type="button" class="btn btn-lg btn-primary mt-auto"><
					Back
				</button>
				<button type="button" class="btn btn-danger">Delete Profile</button>
				<button type="button" class="btn btn-success">Update Profile</button>
				<hr>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<!-- <form> -->
				<div class="col-md-8">
					<form class="needs-validation" novalidate>
						<h2 class="mb-3">Company information</h2>
						<div class="mb-3 form-group">
							<label for="companyName">Company Name</label>
							<input type="text" class="form-control" id="companyName">
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="state">State:</label>
									<select class="form-control" id="state">
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
									<input type="text" class="form-control" id="city">
								</div>
							</div>
						</div>
						<div class="mb-3 form-group">
							<label for="comment">Comment:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
						<h2>Contact information</h2>
						<div class="form-group">
							<label for="email">Email:</label>
							<input type="email" class="form-control" id="email">
						</div>
					</form>
				</div>
				<div class="col-md-4">
					<h4>Current information:</h4>
					<jsp:useBean id="company" class="footwearwebportal.ProfileList"/>
					<%
						String id = request.getParameter("id");
						ProfileList profileList = new ProfileList();
						try {
							out.print(profileList.generateProfileInfoHTML(id));
						} catch (SQLException e) {
							e.printStackTrace();
						}
					%>
				</div>
			<!-- </form> -->
		</div>
	</div>
</body>
</html>