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
<title>Relay Rides - Browse Rentals</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="css/style.css">
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
		<div class="row">
		<div class="col-lg-3 col-xs-12">
		<div class="container">
			<h3>Location</h3>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="">Honolulu, HI</a></li>
				<li class="list-group-item"><a href="">Las Vegas, NV</a></li>
				<li class="list-group-item"><a href="">Washington, DC</a></li>
				<li class="list-group-item"><a href="">Other</a></li>
			</ul>
		</div>
		</div>
		<div class="col-md-9 col-xs-12 d-lg-flex">
			<c:forEach var="listing" items="${listings}">
				<div class="container text-center bg-light p-4 m-2">
					<img src="<c:out value="${listing.getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" />
					<h4><c:out value="${listing.getTitle()}"></c:out></h4>
					<p>Location: <c:out value="${listing.getLocation()}"></c:out></p>
					<p>Rate: <c:out value="${listing.getRate()}"></c:out></p>
					<p>Seats: <c:out value="${listing.getSeats()}"></c:out></p>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>