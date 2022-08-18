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
<title><c:out value="${listing.getTitle() }"></c:out></title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom">
			<div class="container-fluid">
				<a class="h1" href="/listings">RelayRides</a>
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
	<div class="container d-flex justify-content-center">
		<div class="container bg-light mb-5 p-5 col-md-10">
			<div class="row">
				<h1 class="mb-3"><c:out value="${listing.title }"></c:out></h1>
			</div>
			<div class="row">
				<div class="col-3">
					<img src="${listing.imageUrl }" alt="${listing.imageUrl }" class="img-fluid" />
				</div>
				<div class="col">
					<p>Make/Model: <c:out value="${listing.title }"></c:out></p>
					<p>Location: <c:out value="${listing.location }"></c:out></p>
					<p>Rate: <c:out value="${listing.rate }"></c:out></p>
					<p>Seats: <c:out value="${listing.seats }"></c:out></p>
					<p>Description: <c:out value="${listing.description }"></c:out></p>
					<a class="btn btn-outline-dark" href="/listing/reserve/${listing.id }">Book Now!</a>
				</div>
			</div>
			
		</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>