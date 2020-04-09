<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>User Management Application</title>
</head>
<body>
	<%
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("login.jsp");                // No user session established, route to login page
		}
	%>
	<div id="wrapper">
		<header>
			<h2>All Users (Breeders?)</h2>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="PostAnimal">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="UpdateUser">My Account</a></li>
				<li><a href="LogoutUser">Log Out</a></li>
			</ul>
		</nav>
		<table border="1" width="70%" align="center">
			<!-- Output set table headers -->
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
			
			<!-- Output the info for each user in the array -->
			<c:forEach items="${listUsers}" var="users">
				<tr>
					<td>${users.username }</td>
					<td>${users.password }</td>
					<td>${users.firstname }</td>
					<td>${users.lastname }</td>
					<td>${users.email }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
