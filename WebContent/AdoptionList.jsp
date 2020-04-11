<%------------------------------------------------------------------------------------------------------//
//	Notes:																								//
//	 	!!	- JavaBeans: To access an object's data fields, the field needs a corresponding				//
//				getter with the same case-level to match the field (lower- vs upper-case). Failure		//
//				to do so will produce a "Property [X] is not found on object							//
//				e.g.																					//
//					[ FILE: Animal.java ]																//
//					int animalID [and] getanimalID() → CORRECT											//
//					int animalID [and] getAnimalID() → INCORRECT										//
//																										//
//	 		- Variables used within this file:															//
//				listAnimals: ArrayList<Animal> from AnimalDAO.listAllAnimals()							//
//				animal: local object reference															//
//			- JSTL foreach similar to java foreach: "for (Animal animal : listAnimal)"					//
//			- "AdoptionsListExtras.jsp" is a bare-bones HTML file. By including it within the table
//				cell data (using a JSP include directive), it exclusively becomes what handles
//				the output in that cell
//				the "Extras" column (column 5) of the HTML table.										//
//																										//
//------------------------------------------------------------------------------------------------------%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>Available Adoptions</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<div id="wrapper">
		<header>
			<h1>List of Animals</h1>
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
				<tr>
					<th>Name</th>
					<th>Species</th>
					<th>Owner</th>
					<th>Price to Adopt</th>
					<th>Traits</th>
					<th>Extras</th>
				</tr>
				
				<c:forEach var="animal" items="${listAnimals}">
					<tr>
						<td><c:out value="${animal.name}"/></td>
						<td><c:out value="${animal.species}"/></td>
						<td><c:out value="${animal.ownerUsername}"/></td>
						<td>$<c:out value="${animal.adoptionPrice}"/></td>
						
						<%@ include file='AdoptionListExtras.jsp'%>            <!-- See: Notes -->
					</tr>
				</c:forEach>
			</table>
			<h3 align="center">
				<a href="BeginPostAnimalProcess">Post an Animal</a>&nbsp;&nbsp;&nbsp;
			</h3>
		</main>
	</div>
</body>
</html>
