<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>Add Animal</title>
</head>
<body>
	<%
		if (session == null) {
			System.out.println("ReviewForm.jsp: USER NULL");
			response.sendRedirect("login.jsp");                // No user session established, reroute to login page
		}
	%>
	<div id="wrapper">
		<header>
			<h1>Review an Animal</h1>
		</header>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UpdateUser">Edit My Info</a></li>
				<li><a href="PostAnimal">Put an Animal Up for Adoption</a></li>
				<li><a href="ListAnimals">All Animals</a></li>
				<li><a href="ListBreeders">All Breeders</a></li>
				<li><a href="SearchByTrait.jsp">Search for an Animal</a></li>
			</ul>
		</nav>
		<form action="SubmitReview" method="post">
			<table border="1" cellpadding="5">
				<caption>
					<!-- IF TIME: Print out the animal's name the user is reviewing -->
					<h2>Animal Review</h2>
				</caption>
				<tr>
					<th>Animal Rating</th>
					<td>
						<select size="1" name="rating" id="ratingDropMenu">
							<option>Select a Rating:</option>
							<option value="Totes Adorbs">Totes Adorbs</option>
							<option value="Adorbs">Adorbs</option>
							<option value="Cray">Cray</option>
							<option value="Cray-Cray">Cray-Cray</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>Comments:</th>
					<td>
						<!-- Max-length matches [ comments varchar(140) ] attribute in table [ Reviews ] -->
						<textarea id="comment" name="comment" cols="35" rows="4" maxlength="140" wrap="soft"></textarea>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="animalID" value="<%=request.getParameter("animalID")%>"/>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Submit"/>
					</td>
				</tr>
			</table>
		</form>
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


</style>