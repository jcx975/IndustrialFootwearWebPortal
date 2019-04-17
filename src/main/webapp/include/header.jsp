<%
    User user = (User) request.getSession(false).getAttribute("user");

    String firstName = "";
    String lastName = "";

    if(user != null) {
		firstName = user.getFirstName();
		lastName = user.getLastName();
	}
%>


</head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-2">
    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="#">Welcome, <%=firstName%> <%=lastName%>!</a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <input class="nav-link" type="submit" value="Logout">
            </form>
        </li>
    </ul>
</nav>