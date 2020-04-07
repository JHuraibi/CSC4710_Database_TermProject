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
//																										//
//------------------------------------------------------------------------------------------------------%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Available Adoptions</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("AdoptionList.jsp");
		}
	%>
	<div id="wrapper">
		<header>
			<h1>List of All Animals Available for Adoption</h1>
		</header>
		
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UpdateUsersForm.jsp">Edit My Info</a></li>
				<li><a href="index.jsp">My Account</a></li>
			</ul>
		</nav>
		
		<div align="center">
			<table border="1" cellpadding="5">
				<caption><h2>List of Current Animals</h2></caption>
				<tr>
					<th>Name</th>
					<th>Species</th>
					<th>Owner</th>
					<th>Price to Adopt</th>
					<th>Traits</th>
					<th></th>
				</tr>
				<c:forEach var="animal" items="${listAnimals}">
					<tr>
						<td><c:out value="${animal.name}"/></td>
						<td><c:out value="${animal.species}"/></td>
						<td><c:out value="${animal.ownerUsername}"/></td>
						<td>$<c:out value="${animal.adoptionPrice}"/></td>
						<td>
							<c:forEach var="trait" items="${animal.traitsList}">
								<c:out value="${trait}"/>
							</c:forEach>
						</td>
						<td>
							<a href="ReviewForm.jsp?animalID=${animal.animalID}" id="review"/>
							Review this animal
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<h3>
				<a href="BeginPostAnimalProcess">Add New Animal</a>
				&nbsp;&nbsp;&nbsp;
			</h3>
		</div>
	</div>
</body>
</html>


<!-- CSS here for now 🙃 🙃 🙃 -->
<style>
	/*-- Class Selectors --*/
	.text {
		text-align: left;
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
	
	#review {
		color: crimson;
		margin: auto;
		text-decoration: none;
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