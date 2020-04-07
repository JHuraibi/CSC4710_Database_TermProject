<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%------------------------------------------%>
<%--|	  FORMERLY: UserForm.jsp         |--%>
<%--|  Split into New and Update Forms   |--%>
<%------------------------------------------%>

<html>
<head>
	<title>Edit My Account</title>
</head>
<body>
	<div>
		<header>
			<h1>Edit Your Account Information</h1>
		</header>
	</div>
	<nav>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="BeginPostAnimalProcess">Put an Animal Up for Adoption</a></li>
			<li><a href="ListAnimals">All Animals</a></li>
			<li><a href="ListBreeders">All Breeders</a></li>
			<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
		</ul>
	</nav>
	<!-- IF TIME: Implement method to block root user from editing their own info from within website-->
	<div id="wrapper">
		<form action="UpdateUser" method="post">
			<table border="1" cellpadding="5">
				<input type="hidden" name="username" value="<c:out value='${user.username}' />"/>
				<tr>
					<!-- IF TIME: Implement a confirmation feature if changing their username -->
					<th>Username:</th>
					<td>
						<input type="text" name="username" size="45"
							   value="<c:out value='${user.username}' />"
						/>
					</td>
				</tr>
				<tr>
					<!-- IF TIME: Implement a "passwords must match" feature -->
					<th>Password:</th>
					<td>
						<input type="password" name="password" size="45"
							   value="<c:out value='${user.password}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>First Name:</th>
					<td>
						<input type="text" name="firstName" size="45"
							   value="<c:out value='${user.firstName}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<td>
						<input type="text" name="lastName" size="45"
							   value="<c:out value='${user.lastName}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>Email:</th>
					<td>
						<input type="email" name="email" size="45"
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