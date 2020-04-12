<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>My Account</title>
</head>
<body>
	<%
		// Verify a user logged in
		if (session == null) {
			response.sendRedirect("login.jsp");
		}
		
		// CRITICAL: Add an extra variable from ControlServlet
		
		// Setting request attribute makes conditional easier to implement (as opposed to EL to Java Object)
		String currentUsername = (String) pageContext.getAttribute("sUsername");    // Doesnt work
		request.setAttribute("currentUsername", currentUsername);
		
		//String testname = (String) pageContext.getAttribute("sUsername");
		//request.setAttribute("currentUsername", testname);
		
		boolean isRootUser = request.getAttribute("isRootUser") == "true";
		String tableCaption = (String) request.getAttribute("tableCaption");	// Sent from ControlServlet
	
	%>
	<div id="wrapper">
		<header>
			<h1>All Breeders</h1>
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
				<caption>
					<h3><c:out value="<%=tableCaption%>"/></h3>					<!-- See: Above -->
				</caption>
				<tr>
					<th>Username</th>
					
					<!-- Show passwords only for Root -->
					<c:if test="<%=isRootUser%>">
						<th>Password</th>
					</c:if>
					
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Extras</th>
				</tr>
				<c:forEach var="user" items="${listBreeders}">
					<tr>
						<c:choose>
							<%-- <c:when test="${user.username eq 'currentUsername'}"> FAILS --%>
							<%-- <c:when test="${user.username eq currentUsername}"> FAILS --%>
							<%-- <c:when test="${user.username == currentUsername}"> FAILS --%>
							<%-- <c:when test="${user.username == 'currentUsername'}"> FAILS --%>
							<%-- <c:when test="${user.username=='currentUsername'}"> FAILS --%>
							<%-- <c:when test="${user.username==currentUsername}"> FAILS --%>
							<%-- <c:when test="${currentUsername==user.username}"> FAILS --%>
							<%-- <c:when test="${currentUsername.equals(user.username)}"> FAILS --%>
							<%-- <c:when test="${user.username.equals(currentUsername)}"> FAILS --%>
							<%-- <c:when test="${user.username eq 'user_1'}"> --%>        <%-- Works, but not what we need :( --%>
							
							<c:when test="${currentUsername==user.username}">
								<td><c:out value="${user.username}"/>(You)</td>
							</c:when>
							<c:otherwise>
								<td><c:out value="${user.username}"/></td>
							</c:otherwise>
						</c:choose>
						
						<c:if test="<%=isRootUser%>">
							<td><c:out value="${user.password}"/></td>
						</c:if>
						
						<td><c:out value="${user.firstName}"/></td>
						<td><c:out value="${user.lastName}"/></td>
						<td><c:out value="${user.email}"/></td>
						<td>
							<c:choose>
								<c:when test="${user.username eq currentUsername}">
									<form action="MyAccount">
										<input
												type="image" alt="My Account"
												title="ME_Test"
												src="./Images/user_icon.png"
												width="30px" height="30px"
										>
									</form>
								
								</c:when>
								<c:otherwise>
									
									<form action="AddFavBreeder">
										<input type="hidden" name="breederUsername" value="${user.username}">
										<input
												type="image" alt="Add Breeder"
												src="./Images/add_breeder.png"
												width="30px" height="30px"
										>
									</form>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</main>
	</div>
</body>
</html>