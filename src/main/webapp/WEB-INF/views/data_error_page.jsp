<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="common.jsp"%>
<title>Error!!</title>
</head>
<body class="p-3 mb-2 bg-light text-dark">
<div class="container">
<div class="row">
			<div class="col-md-6 offset-md-3">
			<a><img
			src="<c:url value="/resources/image/error.png"/>" width="700"
			height="400" alt=""></a>
	<h1>Something Went Wrong!!</h1>
	<a class="btn btn-primary" href="home" role="button">Go Back To Home</a>
	</div>
	</div>
	</div>
</body>
</html>