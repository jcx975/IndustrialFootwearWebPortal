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
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<body>
<nav class="navbar shadow navbar-expand-sm bg-light navbar-light mb-5">
    <h1 class="display-1 navbar-brand">Industrial Footwear Web Portal</h1>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav ml-auto">
            <li class="navbar-text pr-2 border-right">
                Welcome, <%=firstName%> <%=lastName%>!
            </li>
            <li class="nav-item">
                <a class="nav-link text-primary" href="${pageContext.request.contextPath}/userprofile.jsp">My Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-primary" href="${pageContext.request.contextPath}/logout">Log out</a>
            </li>
        </ul>
    </div>
</nav>