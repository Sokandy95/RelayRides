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
<title>RelayRides</title>
<!-- CSS only -->
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
				<a class="h1 text-white text-decoration-none siteTitle" href="/listings">
					<span> 
						<i class="fa-solid fa-car h1 me-2"  style ="color: #fc46be"></i>
					</span>
					RelayRides
				</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">

					<li class="nav-item mt-2">
						<a class="nav-link active text-white browseLink" href="/listings">
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
		<h1 class="mb-5 text-white head">Welcome, <c:out value="${ user.getFirst_name() }"></c:out>!</h1>
		<div class="container bg-dark mb-5 body-container table1">
			<h3 class='head pt-3 pb-1'>My Renter Dashboard</h3>
			<a class="btn btn-secondary mb-3" href="/listings">Browse Available Rentals</a>
			<table class="table text-nowrap text-white" id="tbl">
				<thead class="NonOpaque">
				<tr>
					<th scope="col">Thumbnail</th>
					<th scope="col">Location</th>
					<th scope="col">Car Make/Model</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					<th scope="col">Status</th>
					<th scope="col">Actions</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${bookings}">
						<tr>
							<td><img src="<c:out value="${booking.getListing().getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" style="max-width: 200px" /></td>
							<td><c:out value="${booking.getListing().getLocation()}"></c:out></td>
							<td><c:out value="${booking.getListing().getModel()}"></c:out></td>
							<td><c:out value="${booking.getFormattedStartDate()}"></c:out></td>
							<td><c:out value="${booking.getFormattedEndDate()}"></c:out></td>
							<td><c:out value="${listing.getStatus()}"></c:out></td>
							<td>
								<a class="btn btn-secondary me-2" href="/edit/<c:out value="${booking.getId()}"></c:out>">Edit</a>
								<a class="btn btn-secondary me-2" href="/delete/<c:out value="${booking.getId()}"></c:out>">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
			<div class="container bg-dark mb-5 body-container table2">
			<h3 class='head pt-3 pb-1'>My Owner Dashboard</h3>
			<a class="btn btn-secondary mb-2" href="/listing/new">List a New Car</a>
			<h5 class="text-white mt-3">My Cars</h5>
			<table class="table text-nowrap text-white" id="tbl">
				<thead class="NonOpaque">
				<tr>
					<th scope="col">Thumbnail</th>
					<th scope="col">Listing Title</th>
					<th scope="col">Car Make/Model</th>
					<th scope="col">Description</th>
					<th scope="col">Listing Actions</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="listing" items="${listings}">
						<tr>
							<td><img src="<c:out value="${listing.getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" style="max-width: 200px" /></td>
							<td><c:out value="${listing.getTitle()}"></c:out></td>
							<td><c:out value="${listing.getModel()}"></c:out></td>
							<td><c:out value="${listing.getDescription()}"></c:out></td>
							<td>

								<a class="btn btn-secondary me-2" href="/listing/edit/<c:out value="${listing.getId()}"></c:out>">Edit</a>
								<a class="btn btn-secondary me-2" href="/listing/delete/<c:out value="${listing.getId()}"></c:out>">Delete</a>
								<form:form class="d-inline" action="/listing/delete/${listing.id}" method="post">
									<input type="hidden" name="_method" value="delete">
								</form:form>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h5 class='text-white mt-3'>Customer Reservations/Requests</h5>
			<table class="table text-nowrap text-white" id="tbl">
				<thead>
				<tr>
					<th scope="col">Thumbnail</th>
					<th scope="col">Renter Name</th>
					<th scope="col">Listing Title</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					<th scope="col">Status</th>
					<th scope="col">Actions</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${bookings}">
						<tr>
							<td><img src="<c:out value="${booking.getListing().getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" style="max-width: 200px" /></td>
							<td><c:out value="${booking.getUser().getFirst_name}"></c:out> <c:out value="${booking.getUser().getLast_name}"></c:out></td>
							<td><c:out value="${booking.getListing().getTitle()}"></c:out></td>
							<td><c:out value="${booking.getFormattedStartDate()}"></c:out></td>
							<td><c:out value="${booking.getFormattedEndDate()}"></c:out></td>
							<td><c:out value="${booking.getStatus()}"></c:out></td>
							<td>
								<a class="btn btn-secondary me-2" href="/booking/edit/<c:out value="${booking.getId()}"></c:out>">Edit/Approve</a>
								<a class="btn btn-secondary me-2" href="/listing/delete/<c:out value="${booking.getId()}"></c:out>">Deny</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<script src="https://kit.fontawesome.com/3e736bf66d.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>