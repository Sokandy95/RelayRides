<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RelayRides</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.scss">
<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700&family=M+PLUS+Rounded+1c&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Chivo:ital,wght@1,900&display=swap"
	rel="stylesheet">
<style type="text/css">
.table1:not(.NonOpaque) {
	opacity: 0.90;
}

.table2:not(.NonOpaque) {
	opacity: 0.90;
}
</style>
<body>
	<div class="container">
		<nav
			class="navbar navbar-expand-lg mb-5 border-bottom bg-dark opacity-75">
			<div class="container-fluid">
				<a class="h1 text-white text-decoration-none siteTitle"
					href="/dashboard"> <span> <i
						class="fa-solid fa-car h1 me-2" style="color: #fc46be"></i>
				</span> RelayRides
				</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">

					<li class="nav-item mt-2"><a
						class="nav-link active text-white browseLink" href="/listings">
							<span> <i class="fa fa-car-on logo" style="color: #fc46be"></i>
						</span> Browse Rentals
					</a></li>
					<li class="nav-item mt-2"><a
						class="nav-link active text-white headLink" href="/dashboard">
							<span> <i class="fa fa-table-columns"
								style="color: #fc46be"></i>
						</span> Dashboard
					</a></li>
					<li class="nav-item mt-2"><a
						class="nav-link active text-white headLink" href="/profile"> <span>
								<i class="fa fa-user-circle me-1" style="color: #fc46be"></i>
						</span> My Profile
					</a>
					<li class="nav-item"><a class="btn btn-secondary me-2"
						href="/logout"> Logout</a></li>

				</ul>
			</div>
		</nav>
	</div>
	<div class="container d-flex justify-content-center">
		<div class="card mb-5 p-5 col-md-10" >
			<img src="/${listing.getImageUrl() }" class="card-img-top" alt="${listing.getImageUrl() }">
			<div class="card-body">
				<h1 class="card-title mb-3 text-center head">
					<c:out value="${listing.title }"></c:out>
				</h1>
				<p class="card-text">Description: <c:out value="${listing.description }"></c:out></p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">Location: <c:out value="${listing.location }"></c:out></li>
				<li class="list-group-item">Rate: $<c:out value="${listing.rate }"></c:out> per day</li>
				<li class="list-group-item">Seats: <c:out value="${listing.seats }"></c:out></li>
			</ul>
			<div class="card-body">
				<a class="btn btn-secondary mt-3" href="/listing/reserve/${listing.id }">Book Now!</a>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/3e736bf66d.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>