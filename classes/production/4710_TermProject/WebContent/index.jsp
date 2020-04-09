<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:8080/4710_TermProject/CSS/stylesheet.css" rel="stylesheet">
	<title>Adoption Database</title>
</head>
<body>
	<%
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("login.jsp");                // No user session established, reroute to login page
		}
	%>
	<div id="wrapper">
		<header>
			<h1>Adoption Homepage</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UpdateUsersForm.jsp">Edit My Info</a></li>
				<li><a href="PostAnimal">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
				<li><a href="index.jsp">My Account</a></li>
			</ul>
		</nav>
		<footer>
			<!-- IF TIME: Make this not a form -->
			<form action="LogoutUser" method="post">
				<input type="submit" value="Logout"/>
			</form>
		</footer>
	</div>
</body>
</html>


