<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>Adoption Database</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
		
		boolean isRootUser = request.getAttribute("isRootUser") == "true";
	%>
	<div id="wrapper">
		<header>
			<h1>Adoption Homepage</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="PostAnimal">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
				<li><a href="MyAccount">My Account</a></li>
				<li><a href="LogoutUser">Log Out</a></li>
			</ul>
		</nav>
		<main>
			<!-- IF TIME -->
			<!-- Main empty. Probably add like "5 most recently posted animal" -->
			<!--  -->
		</main>
		<aside>
			<nav>
				<ul>
					<li><a href="PartThree_8">[Q8]</a></li>
					<li><a href="PartThree_9">[Q9]</a></li>
					<li><a href="PartThree_10">[Q10]</a></li>
				</ul>
			</nav>
		</aside>
		
		<footer>
			<!-- [ EMPTY AREA IF NEEDED ] -->
		</footer>
	</div>
</body>
</html>


