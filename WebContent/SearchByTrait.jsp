<%@ page
		language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%@ page import="java.sql.*"%>

<!------------------------------------------------->
<!-- !! !! FORMERLY: DynamicDropSearch.jsp !! !! -->
<!------------------------------------------------->
<!-- move to the java code portions to traithelper or something -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>Search by Trait</title>
</head>
<body>
	<div id="wrapper">
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
		<h1>Search For Adoptable Animals</h1>
		<p>Please select a trait to view all animals with the given trait</p>
		
		<%!String driverName = "com.mysql.cj.jdbc.Driver";%>
		<%!String DB_Location = "jdbc:mysql://127.0.0.1:3306/TermProject?";%>
		<%!String DB_User = "root";%>
		<%!String DB_Password = "admin";%>
		
		<form action="ProcessAnimalTraitSearch">
			<%
				Connection connect = null;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				
				// [ START: try/catch ]
				try {
					Class.forName(driverName);
					connect = DriverManager.getConnection(DB_Location, DB_User, DB_Password);
					
					String SQL_selectDistinctTraits = "SELECT DISTINCT trait FROM traits";
					
					preparedStatement = connect.prepareStatement(SQL_selectDistinctTraits);
					resultSet = preparedStatement.executeQuery();
			%>
			<p>Select Trait :
				<!-- Attribute "required" prevents a null-pointer exception -->
				<select name="traits" required>
					<%
						StringBuilder trait = new StringBuilder(" ");
						while (resultSet.next()) {
							String traitRaw = resultSet.getString("trait");
							char uppercase = Character.toUpperCase(traitRaw.charAt(0));
							trait = new StringBuilder(traitRaw);
							trait.setCharAt(0, uppercase);
							
							// Use StringBuilder.toString() for final output (See below)
					%>
					<option value="<%=trait.toString() %>"><%=trait %>
					</option>
					<%
						}// END while
					%>
				</select>
				<input type="submit" value="Search">
			</p>
			<%
				}
				catch (SQLException sqe) {
					out.println(sqe);
				} // END [ try/catch ]
			
			
			%>
		</form>
	</div>
</body>
</html>