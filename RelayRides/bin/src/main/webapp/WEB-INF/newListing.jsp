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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Relay Rides - New Listing</title>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom">
			<div class="container-fluid">
				<a class="h1" href="/landing">RelayRides</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" href="">Browse Rentals</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">My Profile</a>
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
	<div class="container">
	<div class="row d-flex justify-content-center">
	<div class="col-xs-12 col-md-6 bg-light px-5 py-3">
		<h1 class="mb-3">Create New Listing</h1>
		<form:form action="/listing/create" method="POST" modelAttribute="listing" enctype="multipart/form-data">
			<input type="hidden" path="user" value="${user.id}" />
			<div class="form-group">
				<form:label for="title" path="title" class="form-label">Listing Title:</form:label>
				<form:input name="title" path="title" class="form-control"/>
				<form:errors path="title" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="model" path="model" class="form-label">Make/Model:</form:label>
				<form:input name="model" path="model" class="form-control" />
				<form:errors path="model" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="rate" path="rate" class="form-label">Daily Rate:</form:label>
				<form:input name="rate" class="form-control" path="rate" />
				<form:errors path="rate" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="location" path="location" class="form-label">Location:</form:label>
				<form:input path="location" name="location" class="form-control" />
				<form:errors path="location" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="description" path="description" class="form-label">Description:</form:label>
				<form:input path="description" name="description" class="form-control" />
				<form:errors path="description" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="seats" path="seats" class="form-label">Seats:</form:label>
				<form:input type="number" min="1" max="18" path="seats" name="seats" class="form-control" />
				<form:errors path="seats" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="image" path="imageUrl" class="form-label">Image:</form:label>
				<input type="file" name="file" class="form-control" accept=".jpg, .jpeg, .png" />
				<form:errors path="imageUrl" class="text-danger" />
			</div>
			<input type="submit" class="btn btn-outline-dark mt-3" value="Create Listing" />
		</form:form>
	</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>