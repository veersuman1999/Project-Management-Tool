<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="common.jsp" %>
<link href="<c:url value="/resources/css/style.css" />">
<script src="<c:url value="/resources/js/script.js" />"></script>
<title>Register</title>
</head>
<body>
	<nav class="navbar navbar-light bg-info">
		<a class="navbar-brand" href="#"> <img
			src="<c:url value="/resources/image/logo.png"/>" width="50"
			height="50" class="d-inline-block align-top" alt=""> <label
			style="font-size: 30px;">Catlina</label>
		</a>
	</nav>
	<div class="container mt-5 col-md-6 offset-md-3 p-3 mb-2 bg-light text-dark" >
		<h3 class="text-center">Register Here!</h3>
		<p class="text-center"></p>
		<form action="registerform" method="post">
			<div class="form-group">
				<label for="useremail">Email Address</label> <input type="email"
					class="form-control" id="useremail" name="email"
					aria-describedby="emailHelp" placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="username">Full Name</label> <input type="text"
					class="form-control" id="username" name="name"
					aria-describedby="emailHelp" placeholder="Enter Your Name">
			</div>
			<div class="form-group">
				<label for="userpassword">Password</label> <input type="password"
					class="form-control" id="userpassword" name="password"
					placeholder="Enter Password">
			</div>
			<div class="form-group">
				<label for="userphone">Phone</label> <input type="text"
					class="form-control" id="userphone" name="phone"
					placeholder="Enter Phone">
			</div>
			<p>Please select your preferred type:</p>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="usertype"
					id="exampleRadios2" value="manager"> <label
					class="form-check-label" for="exampleRadios2"> Manager</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="usertype"
					id="exampleRadios2" value="developer"> <label
					class="form-check-label" for="exampleRadios2"> Developer</label>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Sign Up</button>
			</div>
			
			
		</form>



	</div>

</body>
</html>