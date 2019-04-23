<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
	<link rel="stylesheet" type="text/css" media="screen" href="css/login.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</head>
<body class="bg-light">
<div class="container">
	<form class="form-signin text-center">
		<div class="row">
			<div class="col-md-6 border-right d-flex align-items-center">
				<h1 class="display-4">Industrial Footwear Web Portal</h1>
			</div>
			<div class="col-md-6">
				<div class="form-group mb-5 ml-5 mr-5">
					<form action="login" method="post">
						<h4 class="mb-3 font-weight-normal">Sign in to your account</h4>
						<label for="username"></label><input type="text" class="form-control" id="username" placeholder="Username" name="username" required autofocus>
						<label for="password"></label><input type="password" class="form-control mb-3" id="password" placeholder="Password" name="password" required>
						<div class="checkbox mb-3">
							<label>
								<input type="checkbox" value="remember-me">
								remember me
							</label>
							<br>
						</div>
						<button class="btn btn-lg btn-primary btn-block mb-3" type="submit" formmethod="post" formaction="login">Sign in
						</button>
					</form>
					<a href="#">Reset password</a>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>



