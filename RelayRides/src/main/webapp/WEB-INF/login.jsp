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
<title>RelayRides Login</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/stylesheets/style.scss">
<link rel="stylesheet" type="text/css" href="/stylesheets/login.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700&family=M+PLUS+Rounded+1c&display=swap" rel="stylesheet">

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom">
			<div class="container-fluid bg-dark opacity-75">
				<a class="h1 text-white text-decoration-none me-3 siteTitle" href="/landing">
					<span> 
						<i class="fa fa-car h1" style=" color: #fc46be;"></i> 
					</span>
					RelayRides 
				</a>
			</div>
			<!-- <div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active text-white"
						href="/login">Login</a></li>
				</ul>
			</div> -->
		</nav>
	</div>
	<div class="container">
		<div class="row justify-content-md-around body-container ">
			<div class="col-xs-12 col-md-5 p-5 m-2 bg-light rounded">
				<h2 class="head">Login</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group">
						<form:label for="email" path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:input path="password" type="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<input type="submit" class="btn btn-primary mt-3"
						value="Submit" />
				</form:form>
			</div>
			<div class="col-xs-12 col-md-5 p-5 m-2 bg-light rounded">
				<h2 class='head'>New User? Register Here!</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div class="form-group">
						<form:label for="username" path="username" class="form-label">Username:</form:label>
						<form:input path="username" class="form-control" />
						<form:errors path="username" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label for="first_name" path="first_name" class="form-label">First Name:</form:label>
						<form:input path="first_name" class="form-control" />
						<form:errors path="first_name" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label for="last_name" path="last_name" class="form-label">Last Name:</form:label>
						<form:input path="last_name" class="form-control" />
						<form:errors path="last_name" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label for="email" path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:input type="password" path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<div class="form-group">
						<form:label for="confirmPW" path="confirmPW" class="form-label">Confirm Password:</form:label>
						<form:input type="password" path="confirmPW" class="form-control" />
						<form:errors path="confirmPW" class="text-danger" />
					</div>
					<input type="submit" class="btn btn-primary mt-3" value="Submit" />
				</form:form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>