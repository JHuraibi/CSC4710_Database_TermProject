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
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("UserAccount.jsp");                // No user session established, reroute to login page
		}
	%>
	<div id="wrapper">
		<header>
			<h1>My Account</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UpdateUser">Edit My Info</a></li>
				<li><a href="PostAnimal">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
				<li><a href="ListMyFavoriteAnimals">Show My Adoptions</a></li>
			</ul>
		</nav>
		<table border="1" cellpadding="5">
			<caption><h2>Current User Information</h2></caption>
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
			<tr>
				<td><c:out value="${user.username}"/></td>
				
				<c:if test="${sessionScope.sUsername == root}">
					<td><c:out value="${user.password}"/></td>
				</c:if>
				
				<td><c:out value="${user.firstname}"/></td>
				<td><c:out value="${user.lastname}"/></td>
				<td><c:out value="${user.email}"/></td>
				<td>
					<a href="edit?id=<c:out value='${user.username}' />">Edit</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="delete?id=<c:out value='${user.username}' />">Delete</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>