<%@ page
		language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>Add Animal</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<div id="wrapper">
		<h1>Put an Animal Up for Adoption</h1>
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
		<form action="SubmitNewAnimal" method="post">
			<table border="1" cellpadding="5">
				<caption>
					<h2>Animal Information</h2>
				</caption>
				<tr>
					<th>Name:</th>
					<td>
						<input type="text" name="name" size="45" autofocus="autofocus" required/>
					</td>
				</tr>
				<tr>
					<th>Species:</th>
					<td>
					<textarea
							name="species" minlength="2" maxlength="12"
							cols="45" rows="1" pattern="[A-Za-z]" required
					></textarea>
					</td>
				</tr>
				<tr>
					<th>Birth Date:</th>
					<td>
						<!-- Checking date w/ JSP: https://bit.ly/2QZbzsy -->
						<input
								type="date" name="birthDate" min="1980-01-01" size="45"
								required
						/>
					</td>
				</tr>
				<tr>
					<th>Adoption Price: $</th>
					<td>
						<input
								type="number" name="adoptionPrice" min="0" maxlength="5" size="45"
								required
						/>
					</td>
				</tr>
				<tr>
					<th>Traits:</th>
					<td>
						<!-- CHECK: HTML5 removed support of "pattern" attribute -->
						<!-- "pattern" forces only letters and spaces to be entered -->
						<textarea
								id="traits" name="traits"
								cols="45" rows="2" maxlength="60" wrap="soft"
								pattern="[A-Za-z ]" required
						></textarea>
					</td>
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