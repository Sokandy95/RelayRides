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
<title>RelayRides Login</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
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
						<a class="nav-link active" href="/login">Login</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row justify-content-md-around">
			<div class="col-xs-12 col-md-5 p-5 m-2 bg-light">
				<h2>Login</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group">
						<form:label for="email" path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:input path="password" type="password" class="form-control" />
						<form:errors path="password" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-outline-dark mt-3" value="Submit" />
				</form:form>
			</div>
			<div class="col-xs-12 col-md-5 p-5 m-2 bg-light">
				<h2>New User? Register Here!</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div class="form-group">
						<form:label for="username" path="username" class="form-label">Username:</form:label>
						<form:input path="username" class="form-control"/>
						<form:errors path="username" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="first_name" path="first_name" class="form-label">First Name:</form:label>
						<form:input path="first_name" class="form-control"/>
						<form:errors path="first_name" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="last_name" path="last_name" class="form-label">Last Name:</form:label>
						<form:input path="last_name" class="form-control"/>
						<form:errors path="last_name" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="email" path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:input type="password" path="password" class="form-control" />
						<form:errors path="password" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="confirmPW" path="confirmPW" class="form-label">Confirm Password:</form:label>
						<form:input type="password" path="confirmPW" class="form-control" />
						<form:errors path="confirmPW" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-outline-dark mt-3" value="Submit" />
				</form:form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>