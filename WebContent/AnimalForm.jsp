<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Add Animal</title>
</head>
<body>
	<%
		if (session == null) {
			System.out.println("index.jsp: USER NULL");
			response.sendRedirect("AnimalForm.jsp");                // No user session established, reroute to login page
		}
	%>
	<div id="wrapper">
		<h1>Put an Animal Up for Adoption</h1>
		<nav>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="UsersForm.jsp">Edit User Information</a></li>
				<li><a href="index.jsp">PLACEHOLDER</a></li>
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
							value="<c:out value='${animal.species}' />"
					></textarea>
					</td>
				</tr>
				<tr>
					<th>Birth Date:</th>
					<td>
						<!-- Checking date w/ JSP: https://bit.ly/2QZbzsy -->
						<input
								type="date" name="birthDate" min="1980-01-01" size="45"
								required value="<c:out value='${animal.birthDate}' />"/>
					</td>
				</tr>
				<tr>
					<th>Adoption Price: $</th>
					<td>
						<input type="number" name="adoptionPrice" min="0" maxlength="5" size="45"
							   required value="<c:out value='${animal.adoptionPrice}' />"
						/>
					</td>
				</tr>
				<tr>
					<th>Traits:</th>
					<td>
						<!-- CHECK: HTML5 removed support of "pattern" attribute -->
						<!-- With "pattern" forces only letters and spaces to be entered -->
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
			
			<input type="hidden" name="animalID" value="${animal.animalID}">
		
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
	
	footer {
		font-size: 0.70em;
		font-style: italic;
		padding: 10px;
		text-align: center;
		background-color: #ffffff;
		margin-left: 170px;
	}

</style>