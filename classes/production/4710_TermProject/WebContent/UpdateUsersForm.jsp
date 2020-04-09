<%@ page
		language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%------------------------------------------%>
<%--|	  FORMERLY: UserForm.jsp         |--%>
<%--|  Split into New and Update Forms   |--%>
<%------------------------------------------%>

<html>
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:8080/4710_TermProject/CSS/stylesheet.css" rel="stylesheet">
	<title>Edit My Account</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>Edit Your Account Information</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
			</ul>
		</nav>
		<!-- IF TIME: Implement method to block root user from editing their own info from within website-->
		<form action="UpdateUser" method="post">
			<table border="1" cellpadding="5">
				<input type="hidden" name="username" value="<c:out value='${user.username}' />"/>
				<tr>
					<!-- IF TIME: Implement a confirmation feature if changing their username -->
					<th>Username:</th>
					<td>
						<input
								type="text" name="username" size="45"
								value="<c:out value='${user.username}' />"
						/>
					</td>
				</tr>
				<tr>
					<!-- IF TIME: Implement a "passwords must match" feature -->
					<th>Password:</th>
					<td>
						<input
								type="password" name="password" size="45"
								value="<c:out value='${user.password}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>First Name:</th>
					<td>
						<input
								type="text" name="firstName" size="45"
								value="<c:out value='${user.firstName}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<td>
						<input
								type="text" name="lastName" size="45"
								value="<c:out value='${user.lastName}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>Email:</th>
					<td>
						<input
								type="email" name="email" size="45"
								value="<c:out value='${user.email}' />"
						/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Submit Changes"/>
					</td>
				</tr>
			</table>
		</form>
		<a href="index.jsp">Return to Home</a>
	</div>
</body>
</html>
