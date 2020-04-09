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
//			- "ListExtras.jsp" is a bare-bones HTML file. By including it (w/ a JSP include directive)	//
//				within the table cell data (<td>), it exclusively becomes what handles the output in	//
//				the "Extras" column (column 5) of the table.											//
//																										//
//------------------------------------------------------------------------------------------------------%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:8080/4710_TermProject/CSS/stylesheet.css" rel="stylesheet">
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
					<c:if test="${sessionScope.myAdoptions == false}">
						<td><c:out value="${user.password}"/>Extras</td>
					</c:if>
				</tr>
				<c:forEach var="animal" items="${listAnimals}">
					<tr>
						<!-- IF TIME: Make traits output in own file like ListExtras.jsp -->
						<td><c:out value="${animal.name}"/></td>
						<td><c:out value="${animal.species}"/></td>
						<td><c:out value="${animal.ownerUsername}"/></td>
						<td>$<c:out value="${animal.adoptionPrice}"/></td>
						<td>
							<c:forEach var="trait" items="${animal.traitsList}">
								<c:out value="${trait}"/>
							</c:forEach>
						</td>
						<c:if test="${sessionScope.myAdoptions == false}">
							<td>
								<%@ include file='ListExtras.jsp'%>                     <!-- See: Notes -->
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<h3>
				<a href="BeginPostAnimalProcess">Post an Animal</a>
				&nbsp;&nbsp;&nbsp;
			</h3>
		</div>
	</div>
</body>
</html>
