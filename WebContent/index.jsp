<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>Adoption Database</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("login.jsp");
		}
	%>
	<div id="wrapper">
		<header>
			<h1>Adoption Homepage</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UpdateUsersForm.jsp">Edit My Info</a></li>
				<li><a href="BeginPostAnimalProcess">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
			</ul>
		</nav>
		<main>
			<!-- Main -->
		</main>
		<footer>
			<!-- IF TIME: Make this not a form -->
			<form action="LogoutUser" method="post">
				<input type="submit" value="Logout"/>
			</form>
		</footer>
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
		color: #1e4f88;
	}
	
	nav a:hover {
		color: #00d7c6;
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