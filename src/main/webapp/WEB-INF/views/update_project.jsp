<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="common.jsp" %>
<style type="text/css">
<%@include file="style.css" %>
</style>
<title>Update Project</title>
</head>
<body>
<!-- edit project model -->
<%@include file="navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-black">
						<h3>Change Project Details</h3>

					</div>
					<div class="card-body">
                        <form action="${pageContext.request.contextPath }/addProject" method="post">

                            
                            <!--product title-->
							<input type="hidden" value="${project.pId }" name="pId">
                            <div class="form-group">
                            <label>Enter Project Name</label>
                                <input type="text"
                                 class="form-control" 
                                 name="pName"
                                 placeholder="Enter Project Title" 
                                 value="${project.pName }"
                                 readonly />

                            </div>

                            <div class="form-group">
                            <label>Change Project Description</label>
                                <textarea style="height: 50px;" class="form-control" placeholder="Enter Project Description" name="pDesc" readonly>${project.pDesc }</textarea>                     
                            </div>

                            <div class="form-group">
                            <label>Old Date of Completion</label>
                                <input type="text" class="form-control" name="oldDate" placeholder="dd/mm/yyyy" value="${project.oldDate }" readonly />
								
                            </div>
                            <div class="form-group">
                            <label>Querie</label>
                                <input type="text" class="form-control" name="querie" value="${project.querie }" readonly />
								
                            </div>
                            <div class="form-group">
                            <label>Remarks</label>
                                <input type="text" class="form-control" name="remarks" value="${project.remarks }" />
								
                            </div>
                            <div class="form-group">
                            <label>New Date of Completion</label>
                                <input type="text" class="form-control" name="newDate" placeholder="dd/mm/yyyy" value="${project.newDate }" />
								
                            </div>
                           
                            <p>Current Status</p>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="status"
									id="exampleRadios2" value="Completed"> <label
									class="form-check-label" for="exampleRadios2"> Completed</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="status"
									id="exampleRadios2" value="Pending"> <label
									class="form-check-label" for="exampleRadios2">
									Pending..</label>

                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success">Update</button>
                                
                            </div>


                        </form>


                    </div>

                </div>
            </div>
        </div>
        </div>
        
</body>
</html>