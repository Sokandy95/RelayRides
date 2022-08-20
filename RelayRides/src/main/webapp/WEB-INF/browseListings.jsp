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
<!-- local CSS -->
<link rel="stylesheet" type="text/css" href="/stylesheets/style.scss">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
<link rel="stylesheet" type="text/css" href="/stylesheets/listings.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700&family=M+PLUS+Rounded+1c&display=swap" rel="stylesheet">
<style type="text/css">
	.table1:not(.NonOpaque){
        opacity:0.90;
    }
    .table2:not(.NonOpaque){
        opacity:0.90;
    }
</style>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom bg-dark opacity-75">
			<div class="container-fluid">
				<a class="h1 text-white text-decoration-none siteTitle" href="/dashboard">
					<span> 
						<i class="fa-solid fa-car h1 me-2"  style ="color: #fc46be"></i>
					</span>
					RelayRides
				</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">

					<li class="nav-item mt-2">
						<a class="nav-link active text-white browseLink" href="/listing">
							<span>
								<i class="fa fa-car-on logo" style ="color: #fc46be"></i>
							</span>
							Browse Rentals</a>
					</li>
					<li class="nav-item mt-2">
						<a class="nav-link active text-white headLink" href="/dashboard">
							<span>
								<i class="fa fa-table-columns" style ="color: #fc46be"></i>
							</span>
						Dashboard</a>
					</li>
					<li class="nav-item mt-2">
						<a class="nav-link active text-white headLink" href="/profile">
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
			<div class="col-md-9 col-xs-12 d-lg-flex">
				<c:forEach var="listing" items="${listings}">
					<div class="container d-flex text-center bg-light p-4 m-2 rounded listingForm">
						<a href="/listing/${listing.getId() }"><img src="<c:out value="${listing.getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" /></a>
						<div class="container">
						<h4><c:out value="${listing.getTitle()}"></c:out></h4>
						<p>Location: <c:out value="${listing.getLocation()}"></c:out></p>
						<p>Rate: <c:out value="${listing.getRate()}"></c:out></p>
						<p>Seats: <c:out value="${listing.getSeats()}"></c:out></p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
		<script src="https://kit.fontawesome.com/3e736bf66d.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>