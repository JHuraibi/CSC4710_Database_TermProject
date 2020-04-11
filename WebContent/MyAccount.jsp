<%@ page
		language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>User Management Application</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	
	<!-- !! TODO: If this page is NOT called thru ControlServlet, the info will be empty -->
	<div id="wrapper">
		<header>
			<h1>My Account</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="PostAnimal">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
			</ul>
		</nav>
		<aside>
			<nav>
				<ul>
					<li><a href="ListMyAdoptions">My Posts</a></li>
					<li><a href="ListMyFavAnimals">My Animals</a></li>
					<li><a href="ListMyFavBreeders">My Breeders</a></li>
					<li><a href="UpdateUsersForm.jsp">Edit My Info</a></li>
				</ul>
			</nav>
		</aside>
		<main>
			<table border="1" cellpadding="5">
				<caption><h2>My Info</h2></caption>
				<tr>
					<th>Username</th>
					<th>Password</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Options</th>
				</tr>
				<tr>
					<td><c:out value="${user.username}"/></td>
					<td><c:out value="${user.password}"/></td>
					<td><c:out value="${user.firstName}"/></td>
					<td><c:out value="${user.lastName}"/></td>
					<td><c:out value="${user.email}"/></td>
					<td>
						<a href="UpdateUser">Edit&nbsp;MyInfo</a>
						<br>
						<a href="DeleteUser">Delete My Account</a>
					</td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>