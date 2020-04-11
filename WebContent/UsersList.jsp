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
	<div id="wrapper">
		<header>
			<h1>All Breeders</h1>
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
			<table border="1" cellpadding="5">
				<caption><h2>List of Current Users</h2></caption>
				<tr>
					<th>Username</th>
					
					<!-- Show passwords only for Root -->
					<c:if test="<%=isRootUser%>">
						<th>Password</th>
					</c:if>
					
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Options</th>
				</tr>
				<c:forEach var="user" items="${listUsers}">
					<tr>
						<td><c:out value="${user.username}"/></td>
						
						<c:if test="<%=isRootUser%>">
							<td><c:out value="${user.password}"/></td>
						</c:if>
						
						<td><c:out value="${user.firstName}"/></td>
						<td><c:out value="${user.lastName}"/></td>
						<td><c:out value="${user.email}"/></td>
					</tr>
				</c:forEach>
			</table>
		</main>
	</div>
</body>
</html>