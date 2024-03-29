<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>index</title>
	
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/main.js"></script>
</head>
<body>
	<div class="container-sm">
		<div class="header">
			<h5 class="bg-danger"><c:out value="${errorFlash}"></c:out></h5>
			<h1>Welcome to learning platform!</h1>
		</div>
		<div class="d-flex justify-content-around mt-3">
			<div>
				<h2>Registration</h2>
				<div class="d-flex"> 
					<div class="regi_card">
						<img class="regimg" src="https://www.seekpng.com/png/full/20-200280_student-national-university-of-sciences-and-technology-teacher.pnghttps://www.seekpng.com/png/full/20-200280_student-national-university-of-sciences-and-technology-teacher.png" class="card-img-top" alt="teacher_regi">
						<br/>
						<a  class="btn btn-info mt-5 ms-2" href="/teacher_new">Register as a teacher</a>
					</div>
					<div class="regi_card">
						<img class="regimg" src="https://www.nicepng.com/png/full/126-1268312_apply-card-icon-college-student-student-icon.png" class="card-img-top" alt="student_regi">
						<br/>
						<a  class="btn btn-warning mt-5 ms-2" href="/student_new">Register as a student</a>
					</div>				
				</div>
			</div>
			
			<div>
				<h2>Log in</h2>
				<form:form action="/login" method="POST" modelAttribute="login">
							
					<form:label class="col-sm-2 col-form-label" path="email">Email: </form:label>
					<form:errors path="email"  class="text-danger"></form:errors>
					<form:input type="text" class="form-control" path="email"></form:input>		
					
					<form:label class="col-sm-2 col-form-label" path="password">Password: </form:label>
					<form:errors path="password"  class="text-danger"></form:errors>
					<form:input type="password" class="form-control" path="password"></form:input>	
				
					<input type="submit" class="btn btn-success mt-5" value="Login" />
				
				</form:form>		
			</div>		
		</div>
	</div>
</body>
</html>