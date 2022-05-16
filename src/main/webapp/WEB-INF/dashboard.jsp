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
                        <a class="nav-link active" aria-current="page" href="/my_courses">MyCourses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/courses">AllCourses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                </ul> 
                <span class="search">
                    <form class="d-flex" action="/search"  method="get">
                        <input class=" form-control me-2" type="search"  name = "search" required  placeholder="Search" aria-label="Search"  />
                        &nbsp;
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </span>
                <%-- <span class="search">
                    <form class="d-flex" th:action="@{/search}" >
                        <input class=" form-control me-2" type="text"  name = "keyword" required  placeholder="Search" aria-label="Search"  />
                        &nbsp;
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </span> --%>

                    <a href="/my_information"><i class="bi bi-person-circle"></i></a>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <a href = "/logout" class="btn btn-sm btn-outline-danger logout">Logout</a>
            </div>
    </div>
</nav>
<!-- navbar ends -->

<div class="container"> <!-- Beginning of Container -->
<h1 class="mt-2 mb-5">Welcome back ${user.firstName}!</h1>

<!-- courses  -->
        <div class="courses-add">
            <h3 class="text-start">Courses</h3> 
            <c:if test="${user.role == 'teacher' }"><a href="/new_course"><i class="bi bi-plus-circle-dotted"></i></a></c:if>
        </div>
    <i class="bi bi-arrow-left-circle"></i>
    <div class="row row-cols-1 row-cols-md-3 g-4 card-container">
        <div class="col">
            <div class="card h-100">
                <img src="https://careerswithstem.com.au/wp-content/uploads/2021/01/Should-I-study-computer-science.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center"><a href="/courses">Computer Science</a></h5>
                    <p class="card-text text-center">Learn the study of computers and computing as well as their theoretical and practical applications.</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Apply by...</small>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://livegamefully.com/wp-content/uploads/2021/01/online-course-business.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center"><a href="/dashboard">Business</a></h5>
                    <p class="card-text text-center">This course covers such topics as risk taking and entrepreneurship, forms of ownership, planning, organizing, managing etc.</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Apply by...</small>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://static.standard.co.uk/s3fs-public/thumbnails/image/2019/01/14/16/dr-alexandru-stavrica-166342-unsplash.jpg?width=968&auto=webp&quality=50&crop=968%3A645%2Csmart" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center"><a href="/dashboard">Photography</a></h5>
                    <p class="card-text text-center">The lessons in this course apply to basic camera skills, the elements of art and principles of design, landscape, low-light scenes, motion, and portraiture.</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Apply by...</small>
                </div>
            </div>
        </div>
    </div>
    <i class="bi bi-arrow-right-circle"></i>
    <!-- courses ends -->
    

    <br>
    <br>
    <br>




    <%-- <div>
        <table>
            <tbody>
                <c:forEach var = "i" items = "${allCourses}">
                    <tr>
                        <td><p> <a href="/oneCourse/${i.id }">
                            <c:out value = "${i.title }"></c:out></a>
                            </p>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div> --%>
        <%-- <div>
    		<a  href="/courses" class="btn btn-primary mt-5" >Show me All courses!</a>
        </div> --%>


</div> <!-- End of Container -->



</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>