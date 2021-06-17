<%@page import="pmtool.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <div class="container">
        <a class="navbar-brand" href="#"> <img
			src="<c:url value="/resources/image/logo.png"/>" width="50"
			height="50" class="d-inline-block align-top" alt=""> <label
			style="font-size: 30px;">Catlina</label>
		</a>
        
        <%

            User user1 = (User) session.getAttribute("current-user");


        %>      


        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
               
            </ul>
          
            <ul class="navbar-nav ml-auto">
                
                
                
                <%              if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login">Login </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register">Register </a>
                </li>

                <%
                } else {

                %>
                <li class="nav-item active">
                    <a class="nav-link" ><%= user1.getName()%> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="logout">Logout </a>
                </li>
                <%
                    }
                %>





            </ul>
        </div>
    </div>
</nav>