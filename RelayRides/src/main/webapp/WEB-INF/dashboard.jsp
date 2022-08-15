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
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
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
		<h1 class="mb-5">Welcome, <c:out value="${ user.getFirst_name() }"></c:out>!</h1>
		<div class="container bg-light mb-5">
			<h3>My Renter Dashboard</h3>
			<a class="btn btn-outline-dark" href="">Browse Available Rentals</a>
			<table class="table text-nowrap" id="tbl">
				<thead>
				<tr>
					<th scope="col">Thumbnail</th>
					<th scope="col">Location</th>
					<th scope="col">Car Make/Model</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					<th scope="col">Status</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="galleryPiece" items="${galleryPieces}">
						<tr>
							<td><img src="<c:out value="${booking.getListing().getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" style="max-width: 200px" /></td>
							<td><c:out value="${booking.getListing().getLocation()}"></c:out></td>
							<td><c:out value="${booking.getListing().getModel()}"></c:out></td>
							<td><c:out value="${booking.getStart_date()}"></c:out></td>
							<td><c:out value="${booking.getEnd_date()}"></c:out></td>
							<td><c:out value="${booking.getStatus()}"></c:out></td>
							<td>
								<a class="btn btn-outline-dark" href="/edit/<c:out value="${booking.getId()}"></c:out>">Edit</a>
								<a class="btn btn-outline-danger" href="/delete/<c:out value="${booking.getId()}"></c:out>">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>