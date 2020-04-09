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
	<title>New User Signup</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<h1>New User Information Form</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UpdateUser">Edit My Info</a></li>
				<li><a href="index.jsp">My Account</a></li>
			</ul>
		</nav>
		<form action="InsertUser" method="post">
			<table border="1" cellpadding="5">
				<tr>
					<th>Username:</th>
					<td>
						<input type="text" name="username"/>
					</td>
				</tr>
				<tr>
					<!-- IF TIME: Implement a "passwords must match" feature -->
					<th>Password:</th>
					<td>
						<input type="password" name="password" size="45" required/>
					</td>
				</tr>
				<tr>
					<th>First Name:</th>
					<td>
						<input type="text" name="firstName" size="45"/>
					</td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<td>
						<input type="text" name="lastName" size="45"/>
					</td>
				</tr>
				<tr>
					<th>Email:</th>
					<td>
						<input type="email" name="email" size="45"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="reset" value="Clear all Fields">
						<input type="submit" value="Register"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>