<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="pmtool.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login");
	return;
} else {
	if (user.getUsertype().equals("manager")) {
		session.setAttribute("message", "You are not Developer!! Do not access this page");
		response.sendRedirect("login");
		return;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="common.jsp"%>
<style type="text/css">
<%@include file="style.css" %>
</style>
<title>Welcome ${username }</title>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<script src="<c:url value="/resources/js/script.js" />"></script>



	<div class="container-fluid">
		<%@include file="message.jsp"%>
		<div class="row mt-3 mx-2">
			<div class="col-md-2 bg-dark">
				<div class="list-group mt-4">

					<a href="#"
						class="list-group-item list-group-item-action "
						data-toggle="modal" data-target="#show-project-modal">Projects</a>
				</div>
				<div class="list-group mt-2">

					<a href="#"
						class="list-group-item list-group-item-action "
						data-toggle="modal" data-target="#add-querie-modal">Queries</a>
				</div>
			</div>
			<div class="container mdashboard bg-light text-dark">
				<!-- <div class="container-fluid mt-3">
                <!%@include file="components/message.jsp" %>
            </div> -->

				<!--second row-->
				<div class="row mt-3">
					<!--second row first col-->
					<div class="col-md-6">


						<div class="card" data-toggle="modal"
							data-target="#show-project-modal">
							<div class="card-body text-centre">

								<div class="container">
									<img style="max-width: 150px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/tasks.png"/>"
										alt="user_icon">
								</div>
								<h1 class="mt-2">1</h1>
								<h1 class="text-muted">Project</h1>
							</div>
						</div>

					</div>



					<!--second row second col-->
					<div class="col-md-6">
						<div class="card" data-toggle="modal"
							data-target="#add-querie-modal">
							<div class="card-body text-centre">

								<div class="container">
									<img style="max-width: 285px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/project.png"/>"
										alt="user_icon">
								</div>
								<p class="mt-2">Click here to add Queries</p>
								<h1 class="text-muted">Queries</h1>
							</div>
						</div>

					</div>
				</div>


			</div>





			<!-- Modal -->
			<div class="modal fade" id="show-project-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Projects</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">Sl.No.</th>
										<th scope="col">Project Name</th>
										<th scope="col">Project Description</th>
										<th scope="col">Date of Submission</th>
										<th scope="col">Revised Date</th>
										<th scope="col">Remarks</th>
										<th scope="col">Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userproject }" var="p">
										<tr>
											<th scope="row">${p.project.pId }</th>
											<td>${p.project.pName }</td>
											<td>${p.project.pDesc }</td>
											<td>${p.project.oldDate}</td>
											<td>${p.project.newDate }</td>
											<td>${p.project.remarks }</td>
											<td>${p.project.status }</td>
										</tr>


									</c:forEach>


								</tbody>
							</table>
							

						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="add-querie-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Add Queries</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">Sl.No.</th>
										<th scope="col">Project Name</th>
										<th scope="col">Project Description</th>
										<th scope="col">Status</th>
										<th scope="col">Add Queries</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userproject }" var="p">
										<tr>
											<th scope="row">${p.project.pId }</th>
											<td>${p.project.pName }</td>
											<td>${p.project.pDesc }</td>
											<td>${p.project.status }</td>
											<td><a
												href="updateproject/${p.project.pId }/${id}"><i
													class="fas fa-pen-nib text-primary"></i></a></td>
										</tr>


									</c:forEach>


								</tbody>
							</table>


						</div>
						
					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>