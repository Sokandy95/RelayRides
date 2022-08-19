<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Profile page</title>
</head>
<body>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom">
			<div class="container-fluid">
				<a class="h1" href="/dashboard">RelayRides</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" href="">Browse Rentals</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/dashboard">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/profile">My Profile</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/logout">Logout</a>
					</li>
					<li class="nav-item">
						<img src="" alt="" />
					</li>
				</ul>
			</div>
		</nav>
	</div>
	</div>
	<div>
		<h1>My Profile</h1>

		<img src="<c:out value="${updateUser.getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" style="max-width: 200px" />

		<form action="/profile" enctype="multipart/form-data" method="post">
			<div>
				<label for="image" path="imageUrl" class="form-label">Image:</label>
				<input type="file" name="file" class="form-control" accept=".jpg, .jpeg, .png" />
		
			</div>
			<div class="form-row">
				
				<label for="username" name="username" class="text">Display Name:</label>
				<input type="text" name="username" class="form-control" value = "${updateUser.username }"/>
			</div>
			<div class="form-row">
			
				<label for="myBio" name="myBio" class="text">My Bio</label>
				<input type="text" name="myBio" class="form-control"  value = "${updateUser.myBio }"/>
			</div>

			<div>
				<input type="submit" value="Update Profile" class="btn-primary" />
			</div>
			<button class="btn-warning">
				<a href="/dashboard">Go Back!</a>
			</button>
		</form>
	</div>
</body>
</html>