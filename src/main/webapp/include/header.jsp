<%
    String headerID = (String) request.getSession(false).getAttribute("UID");

    String firstName = "";
    String lastName = "";

    DataConnect userData = DataConnect.getInstance();

    if(headerID != null && !headerID.trim().equals("")) {
        try {
            User user = userData.getUserInfo(headerID);
            firstName = user.getFirstName();
            lastName = user.getLastName();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
            <a class="nav-link" href="${pageContext.request.contextPath}/userprofile.jsp">Welcome, <%=firstName%> <%=lastName%>!</a>
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