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

<title>Login Here!</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-black">
						<h3>Login Here</h3>

					</div>
					<div class="card-body">
						<%@include file="message.jsp"%>
						<form action="loginProcess" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
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
									class="form-check-label" for="exampleRadios2">
									Developer</label>
							</div>
							<a href="register" class="text-centre d-block mt-3 mb-2">If
								not registred click here </a>

							<div class="container text-centre">
								<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>

						</form>

					</div>




				</div>


			</div>
		</div>
	</div>
</body>
</html>