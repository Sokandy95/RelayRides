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
	<div class="col-xs-12 col-md-3 bg-light px-5 py-3">
		<img src="${listing.imageUrl}" alt="${listing.imageUrl}" />
	</div>
	<div class="col-xs-12 col-md-6 bg-light px-5 py-3">
		<h1 class="mb-3">Create New Booking</h1>
		<form>
			<div class="form-group">
				<label for="start_date" class="form-label">Listing Title:</label>
				<input name="start_date" class="form-control" placeholder="${listing.title}" readonly />
			</div>
			<div class="form-group">
				<label for="rate" class="form-label">Daily Rate:</label>
				<input name="rate" class="form-control" placeholder="$${listing.rate}" readonly />
			</div>
		</form>
		<form:form action="/booking/create" method="POST" modelAttribute="booking" enctype="multipart/form-data">
			<input type="hidden" path="user" value="${user.id}" />
			<input type="hidden" path="listing" value="${listing.id}" />
			<div class="form-group">
				<form:label for="start_date" path="start_date" class="form-label">Start Date:</form:label>
				<form:input type="date" name="start_date" path="start_date" class="form-control"/>
				<form:errors path="start_date" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="end_date" path="end_date" class="form-label">End Date:</form:label>
				<form:input type="date" name="end_date" path="end_date" class="form-control" />
				<form:errors path="end_date" class="text-danger" />
			</div>
			<input type="submit" class="btn btn-outline-dark mt-3" value="Request Reservation" />
		</form:form>
	</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>