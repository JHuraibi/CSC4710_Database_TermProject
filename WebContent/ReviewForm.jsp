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
		
		String pageTitle;
		String animalName;
		String animalSpecies;
		
		animalName = (String) request.getAttribute("animalName");
		animalSpecies = (String) request.getAttribute("animalSpecies");
		
		if (animalName == null && animalSpecies == null) {
			pageTitle = "Animal Review Form";
		}
		else if (animalSpecies == null) {
			pageTitle = "Review " + animalName;
		}
		else {
			pageTitle = "Review " + animalName + " the " + animalSpecies;
		}
		
		System.out.println(pageTitle);
	%>
	<div id="wrapper">
		<header>
			<h1>Review an Animal</h1>
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
		<form action="SubmitReview" method="post">
			<table border="1" cellpadding="5">
				<caption>
					<h2><%=pageTitle%></h2>
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
						<textarea id="comment" name="comment" cols="35" rows="4" maxlength="140" wrap="soft"></textarea>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="animalID" value="<%=request.getParameter("animalID")%>"/>
				</tr>
				<tr>
					<input type="hidden" name="author" value="<%=request.getParameter("author")%>"/>
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