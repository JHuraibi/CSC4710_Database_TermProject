<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:8080/4710_TermProject/CSS/stylesheet.css" rel="stylesheet">
	<title>User Management Application</title>
</head>
<body>
	<%
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("UsersList.jsp");                // No user session established, reroute to login page
		}
	%>
	<div id="wrapper">
		<h1>All Breeders</h1>
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
		<table border="1" cellpadding="5">
			<caption><h2>List of Current Users</h2></caption>
			<tr>
				<th>Username</th>
				
				<!-- Hide password info unless Root user -->
				<c:if test="${sessionScope.sUsername == root}">
					<th>Password</th>
				</c:if>
				
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Extras</th>
			</tr>
			<c:forEach var="user" items="${listUsers}">
				<tr>
					<td><c:out value="${user.username}"/></td>
					
					<c:if test="${sessionScope.sUsername == root}">
						<td><c:out value="${user.password}"/></td>
					</c:if>
					
					<td><c:out value="${user.firstName}"/></td>
					<td><c:out value="${user.lastName}"/></td>
					<td><c:out value="${user.email}"/></td>
					
					<c:if test="${sessionScope.myBreeders == true}">
						<td>
							<a href="delete?id=<c:out value='${user.username}' />">Delete from my Fav Breeders</a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>