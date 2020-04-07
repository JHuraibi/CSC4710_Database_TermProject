<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>User Management Application</title>
</head>
<body>
	<%
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("UsersList.jsp");                // No user session established, reroute to login page
		}
	%>
	<div>
		<h1>All Breeders</h1>
		<h2>
			<a href="new">Add New User</a>
			&nbsp;&nbsp;&nbsp;
			<a href="list">List All User</a>
		</h2>
	</div>
	<div id="wrapper">
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
					<td>
						<a href="edit?id=<c:out value='${user.username}' />">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="delete?id=<c:out value='${user.username}' />">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>


<!-- CSS here for now 🙃 🙃 🙃 -->
<style>
	/*-- Class Selectors --*/
	.text {
		text-align: left;
	}
	
	.resort {
		font-size: 1.2em;
		color: #000033;
	}
	
	/*--| id Selectors |--*/
	#wrapper {
		background-color: #90c7e3;
		box-shadow: 3px 3px 3px #333;
		min-width: 700px;
		max-width: 1024px;
		margin-left: auto;
		margin-right: auto;
		width: 80%;
	}
	
	/*--| Element Selectors |--*/
	table {
		margin: auto;
		border: 1px solid #3399cc;
		width: 90%;
		border-collapse: collapse;
	}
	
	td, th {
		border: 1px solid #3399cc;
		padding: 5px;
	}
	
	td {
		text-align: center;
	}
	
	tr:nth-of-type(even) {
		background-color: #f5fafc;
	}
	
	
	header, nav, main, footer {
		display: block; /* Ensures compatibility with older browsers */
	}
	
	header {
		background-color: #000033;
		color: #ffffff;
		font-family: Verdana, Arial, sans-serif;
	}
	
	body {
		background-color: #ffffff;
		color: #666666;
		font-family: Verdana, Arial, sans-serif;
	}
	
	nav {
		font-weight: bold;
		float: left;
		width: 160px;
		padding: 20px 5px 0 20px;
	}
	
	nav a {
		text-decoration: none;
	}
	
	nav a:link {
		color: #000033;
	}
	
	nav a:visited {
		color: #344873;
	}
	
	nav a:hover {
		color: #ffffff;
	}
	
	nav ul {
		list-style-type: none; /* Removes list markers */
		margin: 0;
		padding-left: 0;
	}
	
	main {
		padding: 1px 1px 20px 20px;
		background-color: #ffffff;
		margin-left: 170px;
	}
	
	h1 {
		background-position: right;
		background-size: 100% 100%;
		background-repeat: no-repeat;
		color: #ffffff;
		padding-left: 20px;
		height: 72px;
		line-height: 200%;
		margin-bottom: 0;
	}
	
	h2 {
		color: #3399CC;
		font-family: Verdana, Arial, sans-serif;
	}
	
	h3 {
		color: #000033;
	}
	
	dt {
		color: #000033;
		font-weight: bold;
	}
	
	footer {
		font-size: 0.70em;
		font-style: italic;
		padding: 10px;
		text-align: center;
		background-color: #ffffff;
		margin-left: 170px;
	}

</style>