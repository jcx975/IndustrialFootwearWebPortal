<%
    String userID = null;
    String sessionID = null;

    Cookie[] cookies = request.getCookies();

    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("userID"))
                userID = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID"))
                sessionID = cookie.getValue();
        }
    }

    User user = new User();
    DataConnect userData = DataConnect.getInstance();
    try {
        user = userData.getUserInfo(userID);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    String firstName = user.getFirstName();
    String lastName = user.getLastName();
%>


</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-2">
    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="#">Welcome, <%=firstName%> <%=lastName%>!</a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <form action="logout" method="post">
                <input class="nav-link" type="submit" value="Logout">
            </form>
        </li>
    </ul>
</nav>