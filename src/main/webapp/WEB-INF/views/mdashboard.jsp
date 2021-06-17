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
	if (user.getUsertype().equals("developer")) {
		session.setAttribute("message", "You are not Manager!! Do not access this page");
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
						data-toggle="modal" data-target="#show-developer-modal">Developers</a>
				</div>
				<div class="list-group mt-2">

					<a href="#"
						class="list-group-item list-group-item-action "
						data-toggle="modal" data-target="#show-backlogs-modal">Backlogs</a>
				</div>
				<div class="list-group mt-2">

					<a href="#"
						class="list-group-item list-group-item-action "
						data-toggle="modal" data-target="#edit-task-modal">Edit
						Tasks</a>
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

				<div class="row mt-3">
					<!--first col-->
					<div class="col-md-4">
						<div class="card" data-toggle="modal"
							data-target="#show-developer-modal">
							<div class="card-body text-centre">

								<div class="container">
									<img style="max-width: 200px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/developer.png"/>"
										alt="user_icon">
								</div>
								<h1>${usize }</h1>
								<h1 class="text-muted">Developers</h1>
							</div>
						</div>


					</div>
					<!--second col-->
					<div class="col-md-4">
						<div class="card" data-toggle="modal"
							data-target="#show-backlogs-modal">
							<div class="card-body text-centre">
								<div class="container">
									<img style="max-width: 150px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/backlogs.png"/>"
										alt="user_icon">
								</div>
								<h1>${psize}</h1>
								<h1 class="text-muted">Backlogs</h1>
							</div>
						</div>

							<!--  data-toggle="modal"
							data-target="#add-user-modal" -->
					</div>
					<!--third col-->
					<div class="col-md-4">
						<div class="card" data-toggle="modal"
							data-target="#add-user-modal">
							<div class="card-body text-centre">
								<div class="container">
									<img style="max-width: 75px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/queries.png"/>"
										alt="user_icon">
								</div><br>
								<p>Click Here</p>
								<h1 class="text-muted">Assign User</h1>
							</div>
						</div>
						</a>

					</div>
				</div>

				<!--second row-->
				<div class="row mt-3">
					<!--second row first col-->
					<div class="col-md-6">


						<div class="card" data-toggle="modal"
							data-target="#edit-task-modal">
							<div class="card-body text-centre">

								<div class="container">
									<img style="max-width: 150px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/tasks.png"/>"
										alt="user_icon">
								</div>
								<p class="mt-2">Click here to Edit Tasks</p>
								<h1 class="text-muted">Edit tasks</h1>
							</div>
						</div>

					</div>



					<!--second row second col-->
					<div class="col-md-6">
						<div class="card" data-toggle="modal"
							data-target="#add-project-modal">
							<div class="card-body text-centre">

								<div class="container">
									<img style="max-width: 250px;" class="img-fluid rounded-circle"
										src="<c:url value="/resources/image/project.png"/>"
										alt="user_icon">
								</div>
								<p class="mt-2">Click here to add Projects</p>
								<h1 class="text-muted">Create new Project</h1>
							</div>
						</div>

					</div>
				</div>


			</div>





			<!-- Modal -->
			<div class="modal fade" id="edit-task-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Edit Tasks</h5>
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
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${projectPending }" var="p">
										<tr>
											<th scope="row">${p.pId }</th>
											<td>${p.pName }</td>
											<td>${p.pDesc }</td>
											<td>${p.status }</td>
											<td><a href="delete/${p.pId }"><i
													class="fas fa-trash-alt text-danger"></i></a> <a
												href="update/${p.pId }"><i
													class="fas fa-pen-nib text-primary"></i></a></td>
										</tr>


									</c:forEach>


								</tbody>
							</table>


						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="add-user-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Assign User</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
								<table class="table">
								<thead>
									<tr class="table-info">
										<th scope="col">Developer Id</th>
										<th scope="col">Developer Name</th>
										<th scope="col">Developer Email</th>
										<th scope="col">Assign Project</th>
										<th scope="col">Project Assigned</th>
										<th scope="col">Project Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${user }" var="p">
										<tr>
											<th scope="row">${p.id }</th>
											<td class="table-light">${p.name }</td>
											<td class="table-light">${p.email }</td>
											<td class="table-light"><a
												href="updateuserproject/${p.id }"><i
													class="fas fa-pen-nib text-primary"></i></a></td>
											<td class="table-light">${p.project.pName }</td>
											<td class="table-light">${p.project.status }</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
								


						</div>

					</div>
				</div>
			</div>


			<!--end of category modal-->

			<!--product modal
        <!-- Modal -->
			<div class="modal fade" id="add-project-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Create
								Project</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="addProject" method="post">


								<!--project title-->

								<div class="form-group">
									<label>Enter Project Name</label> <input type="text"
										class="form-control" name="pName"
										placeholder="Enter Project Title" required />

								</div>

								<div class="form-group">
									<label>Enter Project Description</label>
									<textarea style="height: 100px;" class="form-control"
										placeholder="Enter Project Description" name="pDesc" required></textarea>
								</div>

								<div class="form-group">
									<label>Date of Completion</label> <input type="text"
										class="form-control" name="oldDate" placeholder="dd/mm/yyyy"
										required />

								</div>
								<p>Current Status</p>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="status"
										id="exampleRadios2" value="Completed"> <label
										class="form-check-label" for="exampleRadios2">
										Completed</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="status"
										id="exampleRadios2" value="Pending"> <label
										class="form-check-label" for="exampleRadios2"> Pending</label>

								</div>


								<div class="container text-center">
									<button class="btn btn-outline-success">Start Sprint</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>


							</form>


						</div>

					</div>
				</div>
			</div>



			<div class="modal fade" id="show-developer-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Developers</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Developer Id</th>
										<th scope="col">Developer Name</th>
										<th scope="col">Developer Email</th>
										<th scope="col">Project Assigned</th>
										<th scope="col">Project Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${user }" var="p">
										<tr>
											<th scope="row">${p.id }</th>
											<td>${p.name }</td>
											<td>${p.email }</td>
											<td>${p.project.pName }</td>
											<td>${p.project.status }</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
								
						</div>

					</div>
				</div>
			</div>
			<div class="modal fade" id="show-backlogs-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom-bg text-white">
							<h5 class="modal-title" id="exampleModalLabel">Backlogs</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table table-striped table-dark">
								<thead>
									<tr>
										<th scope="col">Project ID</th>
										<th scope="col">Project Name</th>
										<th scope="col">Project Description</th>
										<th scope="col">Old Date of Submission</th>
										<th scope="col">New Date of Submission</th>
										<th scope="col">Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${project }" var="p">
										<tr>
											<th scope="row">${p.pId }</th>
											<td>${p.pName }</td>
											<td>${p.pDesc }</td>
											<td>${p.oldDate}</td>
											<td>${p.newDate }</td>
											<td>${p.status }</td>
											
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
							<h5 class="modal-title" id="exampleModalLabel">Queries</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table table-striped table-dark">
								<thead>
									<tr>
										<th scope="col">Project ID</th>
										<th scope="col">Project Name</th>
										<th scope="col">Project Description</th>
										<th scope="col">Queries</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${project }" var="p">
										<tr>
											<th scope="row">${p.pId }</th>
											<td>${p.pName }</td>
											<td>${p.pDesc }</td>
											<td>${p.querie }</td>
											
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