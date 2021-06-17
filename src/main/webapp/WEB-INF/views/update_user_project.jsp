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
<title>Assign Project</title>
</head>
<body>
<!-- edit project model -->
<%@include file="navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-black">
						<h3>Assign Project</h3>

					</div>
					<div class="card-body">
                        <form action="${pageContext.request.contextPath }/adduserproject" method="post">

                            
                            <!--product title-->
							<input type="hidden" value="${user.id }" name="id">
							<input type="hidden" value="${user.password }" name="password">
							<input type="hidden" value="${user.usertype }" name="usertype">
							
                            <div class="form-group">
                            <label>Developer Name</label>
                                <input type="text"
                                 class="form-control" 
                                 name="name"
                                 placeholder="Enter Project Title" 
                                 value="${user.name }"
                                 readonly />

                            </div>

                            
                            <div class="form-group">
                            <label>Developer Email</label>
                                <input type="text" class="form-control" name="email"  value="${user.email}" readonly />
								
                            </div>
                            
                            <div class="form-group">
                            <label>Developer Phone</label>
                                <input type="text" class="form-control" name="phone"  value="${user.phone}" readonly />
								
                            </div>
                            

                            <div class="form-group">
                            <label for="pId">Select Project</label>
                                <select class="form-control" name="project.pId" class="form-control" id="pId" >
                                    <c:forEach items="${project }" var="c">
                                    	<option value=${c.pId }>${c.pName }</option>
                                    </c:forEach>
                                </select>
							
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