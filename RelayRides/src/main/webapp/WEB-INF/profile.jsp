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
<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Profile page</title>
</head>
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
				<li class="nav-item"><img src="" alt="" /></li>
			</ul>
		</div>
	</nav>
</div>
</div>
<div class="container">

	<h1 class="profileHead bg-dark opacity-75 text-white rounded">My Profile</h1>
	<div class="card" style="height: 570px">
		<div class="card-header">Welcome to your RelayProfile,
			${updateUser.username}</div>
		<div class="card-body">
			<div class="d-flex justify-content-between">
				<div>
					<h5 class="card-title">Your Current Details:</h5>
					<p>First Name: ${updateUser.first_name}</p>
					<p>Last Name: ${updateUser.last_name}</p>
					<p>Email: ${updateUser.email}</p>
				</div>
				<div>
					<img src="<c:out value="${updateUser.getImageUrl()}"></c:out>"
						class="img-fluid img-thumbnail" style="max-width: 200px" />
				</div>
			</div>

			<form action="/profile" enctype="multipart/form-data" method="post">
				<div>
					<label for="image" path="imageUrl" class="form-label mt-3">Image:</label>
					<input type="file" name="file" class="form-control"
						accept=".jpg, .jpeg, .png" />

				</div>
				<div class="form-row">

					<label for="username" name="username" class="text mt-3">Display
						Name:</label> <input type="text" name="username" class="form-control mt-2"
						value="${updateUser.username }" />
				</div>
				<div class="form-row">

					<label for="myBio" name="myBio" class="text mt-3">My Bio</label>
					<textarea name="myBio" class="form-control mt-2" rows="2"
						value="${updateUser.myBio}"></textarea>
				</div>

				<div>
					<input type="submit" value="Update Profile"
						class="btn btn-secondary mt-3" />
				</div>
				<a href="/dashboard"> <input type="button" value="Go Back"
					class="btn btn-primary mt-3" />
				</a>
			</form>
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