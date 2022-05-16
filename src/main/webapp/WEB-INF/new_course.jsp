<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title Here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/main.js"></script>
    <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
        crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

</head>
<body>
    
<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/dashboard">
            <img src="https://www.pngitem.com/pimgs/m/157-1576568_clip-art-learning-icon-learning-icon-hd-png.png" alt="LearningPlatform icon logo" width="40" height="35">
        </a>
        <a class="navbar-brand" href="/dashboard">LearningPlatform</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav dashboardUL">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/my_courses">MyCourses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/courses">AllCourses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                </ul> 
                <span class="search">
                    <form class="d-flex">
                        <input class=" form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </span>

                    <a href="/my_information"><i class="bi bi-person-circle"></i></a>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <a href = "/logout" class="btn btn-sm btn-outline-danger logout">Logout</a>
            </div>
    </div>
</nav>
<!-- navbar ends -->


	<div class="container">
		<h3 class="m-2">Add a course!</h3>
			<div class="form-container mt-3">
				<form:form action="/add_course" method="POST" modelAttribute="course">
							
					<form:label class="col-sm-2 col-form-label" path="title">Course Title: </form:label>
					<form:errors path="title" class="text-danger"></form:errors>
					<form:input type="text" class="form-control" path="title"></form:input>		
<<<<<<< HEAD
					<br>
=======
					
					<form:label path="instructor">Choose Instructor:</form:label>
                	<form:errors class="alert-danger" path="instructor"/>
                	<form:select path="instructor">
                    <c:forEach items="${allTeachers}" var="instructor">
                        <form:option value="${teacher.id}" label="${teacher.firstName}">
                        </form:option> 
                    </c:forEach>
                	</form:select>
					<br>

					<form:label class="col-sm-2 col-form-label" path="credit">Credits: </form:label>
					<form:errors path="credit" class="text-danger"></form:errors>
					<form:input type="number" class="form-control" path="credit"></form:input>	
					
					<form:label class="col-sm-2 col-form-label" path="price">Cost: </form:label>
					<form:errors path="price" class="text-danger"></form:errors>
					<form:input type="number" class="form-control" path="price"></form:input>

>>>>>>> 6e73b820e7ed40a78731e9b876b2714a22a45d36
					<form:label class="col-sm-2 col-form-label" path="description">Description: </form:label>

					<form:errors path="description" class="text-danger"></form:errors>
					<form:input type="text" class="form-control" path="description"></form:input>	


					<form:label class="col-sm-2 col-form-label" path="price">Cost: </form:label>
					<form:errors path="price" class="text-danger"></form:errors>
					<form:input type="number" class="form-control" path="price"></form:input>		

					
					<form:label class="col-sm-2 col-form-label" path="startDate">Start at: </form:label>
					<form:errors path="startDate" class="text-danger"></form:errors>
					<form:input type="date" class="form-control" path="startDate"></form:input>		

					<form:errors path="credit" class="text-danger"></form:errors>
					<textarea type="text" class="form-control" rows="3" path="description"></textarea>
					<br>
					<form:label class="col-sm-2 col-form-label" path="credit">Credit: </form:label>
					<form:errors path="credit" class="text-danger"></form:errors>
					<form:input type="number" class="form-control" path="credit"></form:input>
					<br>
					<form:label class="col-sm-2 col-form-label" path="price">Price: </form:label>
					<form:errors path="credit" class="text-danger"></form:errors>
					<form:input type="number" class="form-control" path="price"></form:input>
					<br>
					<form:label class="col-sm-2 col-form-label" path="required">Required: </form:label>
					<form:errors path="credit" class="text-danger"></form:errors>
					<form:input placeholder="Yes or No" type="text" class="form-control" path="required"></form:input>
					<br>
					<div >
						<form:label class="col-sm-2 col-form-label" path="startDate">Starts at: </form:label>
						<form:errors path="startDate" class="text-danger"></form:errors>
						<form:input type="date" class="form-control w-25" path="startDate"></form:input>	
						
<<<<<<< HEAD
						<%-- <form:label class="col-sm-2 col-form-label" path="teacher">Select Professor:</form:label>				
						<form:select class="form-control w-25" path = "teacher">
							<c:forEach var = "i" items = "${allTeachers}">
							<form:option  value="${i.id}">${i.firstName} ${i.lastName}</form:option>
							</c:forEach>	    	
						</form:select> --%>
=======
					
					<form:label class="col-sm-2 col-form-label" path="startDate">Start at: </form:label>
					<form:errors path="startDate" class="text-danger"></form:errors>
					<form:input type="date" class="form-control" path="startDate"></form:input>	
					
					<form:label class="col-sm-2 col-form-label" path="teacher">Select Professor:</form:label>				
					<form:select path = "teacher">
	    				<c:forEach var = "i" items = "${allTeachers}">
	    				<form:option value="${i.id}">${i.firstName} ${i.lastName}</form:option>
	    				</c:forEach>	    	
	    			</form:select>

					
					<div>
						<a href="/dashboard" class="btn btn-info mt-2">Cancel</a>
									
						<input type="submit" class="btn btn-success ms-2 mt-2" value="Submit" />
					
>>>>>>> 6e73b820e7ed40a78731e9b876b2714a22a45d36
					</div>
					
					
					<div class="newCourse-btns">
						<a href="/dashboard" class="cancel btn btn-lg btn-outline-dark ms-5 mt-2">Cancel</a>
						<a href="/dashboard"><input type="submit" class="submit btn btn-lg btn-outline-dark ms-5 mt-2" value="Submit" /></a>
					</div>
				</form:form>
			</div>			
				
	</div>
</body>
</html>