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
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Chivo:ital,wght@1,900&display=swap" rel="stylesheet">
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
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
	<div class="row d-flex justify-content-around">
	<div class="col-xs-12 col-md-3 bg-light px-5 py-3 rounded" style="max-height: 250px; vertical-align: middle">
		<img class="img img-thumbnail" src="/${booking.getListing().getImageUrl()}" alt="${booking.getListing().getImageUrl()}" />
		<p class="pt-3 text-center fLabel">${booking.getListing().getModel()}</p>
	</div>
	<div class="col-xs-12 col-md-6 bg-light px-5 py-3 rounded listingForm">
		<h1 class="mb-3 head">Edit/Approve Booking</h1>
		<form>
			<div class="form-group">
				<label for="title" class="form-label fLabel mt-3">Listing Title:</label>
				<input name="title" class="form-control" placeholder="${booking.getListing().getTitle()}" readonly />
			</div>
			<div class="form-group">
				<label for="rate" class="form-label fLabel mt-3">Daily Rate:</label>
				<input name="rate" class="form-control" placeholder="${booking.getListing().getRate()}" readonly />
			</div>
		</form>
		<form:form action="/booking/edit/${booking.id}" method="POST" modelAttribute="booking" enctype="multipart/form-data">
		<input type="hidden" name="_method" value="put" />
			<form:input type="hidden" path="user" value="${booking.getUser().getId()}" />
			<form:input type="hidden" path="listing" value="${booking.getListing().getId()}" />
			<div class="form-group">
				<form:label for="start_date" path="start_date" class="fLabel mt-3 form-label">Start Date:</form:label>
				<form:input type="date" name="start_date" path="start_date" class="form-control" />
				<form:errors path="start_date" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="end_date" path="end_date" class="fLabel mt-3 form-label">End Date:</form:label>
				<form:input type="date" name="end_date" path="end_date" class="form-control" />
				<form:errors path="end_date" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="numDays" path="numDays" class="fLabel mt-3 form-label">Number of Days:</form:label>
				<form:input type="number" name="numDays" path="numDays" class="form-control" min="1" max="30" />
				<form:errors path="numDays" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label for="price" path="price" class="fLabel mt-3 form-label">Total Price:</form:label>
				<form:input type="text" name="price" path="price" class="form-control" />
				<form:errors path="price" class="text-danger" />
			</div>
			<fieldset disabled>
			<div class="form-group">
				<form:label for="status" path="status" class="fLabel mt-3 form-label">Update Status:</form:label>
				<form:select name="status" path="status" class="form-control" >
					<form:option value="Pending">Pending</form:option>
					<form:option value="Approved">Approved</form:option>
				</form:select>
				<form:errors path="status" class="text-danger" />
			</div>
			</fieldset>
			<input type="submit" class="btn btn-secondary mt-3" value="Update Booking" />
		</form:form>
	</div>
	</div>
	</div>
	<script src="https://kit.fontawesome.com/3e736bf66d.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>