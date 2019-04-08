<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" media="screen" href="main.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="main.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">Footwear Web Portal</a>
    </li>
  </ul>
</nav>
<div class="row justify-content-center">
  <div class="col-sm-5">
    <div class="fw-box">
      <h1> Login Page </h1><br>
      <form action="${pageContext.request.contextPath}/index.jsp">
        Login: <label>
        <input type="text" name="Username">
      </label>Username<br><br>
        Password: <label>
        <input type="text" name="Password">
      </label>Password<br><br>
        <input type="submit" value="Submit">
      </form>
    </div>
  </div>
</div>



</body>
</html>