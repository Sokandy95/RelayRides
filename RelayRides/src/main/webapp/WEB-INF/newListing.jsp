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
<link rel="stylesheet" type="text/css" href="/stylesheets/style.scss">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700&family=M+PLUS+Rounded+1c&display=swap" rel="stylesheet">
<style type="text/css">
	.listingForm {
        opacity:0.91;
    }
</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom bg-dark opacity-75">
			<div class="container-fluid">
				<a class="h1 text-white text-decoration-none siteTitle" href="/landing">
					<span> 
						<i class="fa fa-car h1 me-2"  style ="color: #fc46be"></i>
					</span>
					RelayRides
				</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">

					<li class="nav-item mt-2">
						<a class="nav-link active text-white browseLink" href="">
							<span>
								<i class="fa fa-car-on logo" style ="color: #fc46be"></i>
							</span>
							Browse Rentals</a>
					</li>
					<li class="nav-item mt-2">
						<a class="nav-link active text-white headLink" href="">
							<span>
								<i class="fa fa-table-columns" style ="color: #fc46be"></i>
							</span>
							Dashboard</a>
					</li>
					<li class="nav-item mt-2">
						<a class="nav-link active text-white headLink" href="">
							<span>
								<i class="fa fa-user-circle me-1" style ="color: #fc46be"></i>
							</span>
							My Profile</a>
					<li class="nav-item">
						<a class="btn btn-secondary me-2" href="/logout">
							Logout</a>
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
	<div class="col-xs-12 col-md-6 bg-light px-5 py-3 rounded listingForm">
		<h1 class="mb-3 head">Create New Listing</h1>
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
			<input type="submit" class="btn btn-secondary mt-3" value="Create Listing" />
		</form:form>
	</div>
	</div>
	</div>
	<script src="https://kit.fontawesome.com/3e736bf66d.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>