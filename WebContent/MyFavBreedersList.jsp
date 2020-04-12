<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>My Account</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
		
		boolean isRootUser = request.getAttribute("isRootUser") == "true";
	%>
	
	<!-- IF TIME: Reuse BreedersList.jsp  -->
	<div id="wrapper">
		<header>
			<h1></h1>
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
		<aside>
			<nav>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="ListMyAdoptions">My Posts</a></li>
					<li><a href="ListMyFavAnimals">My Favorite Animals</a></li>
					<li><a href="ListMyFavBreeders">My Favorite Breeders</a></li>
				</ul>
			</nav>
		</aside>
		<main>
			<table border="1" cellpadding="5">
				<caption><h2>My Favorite Breeders</h2></caption>
				<tr>
					<th>Username</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Options</th>
				</tr>
				<c:forEach var="favBreeder" items="${listFavBreeders}">
					<tr>
						<td><c:out value="${favBreeder.username}"/></td>
						<td><c:out value="${favBreeder.firstName}"/></td>
						<td><c:out value="${favBreeder.lastName}"/></td>
						<td><c:out value="${favBreeder.email}"/></td>
						<td>
							<form action="RemoveFavBreeder">
								<input type="hidden" name="breederUsername" value="${favBreeder.username}">
								<input
										type="image" alt="Remove Breeder"
										src="./Images/remove_breeder.png"
										width="30px" height="30px"
								>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</main>
	</div>
</body>
</html>