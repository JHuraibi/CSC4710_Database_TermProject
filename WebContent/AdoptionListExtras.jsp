<%@ page import="Database_TermProject.ReviewDAO"%>
<%@ page import="Database_TermProject.Review"%>
<%@ page import="java.util.List"%>
<%@ page import="Database_TermProject.Animal"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#customUL {
			padding: 5px;
			font-size: 1.0em;
			list-style-type: none;
		}
	</style>
</head>
<%
	// [Note: no need to verify user logged in as this is a subsection (so to speak) of AdoptionList.jsp]
	
	// [ MyAdoptions == Animals I Posted ]
	boolean myAdoptions = request.getAttribute("myAdoptions") == "true";        // Intermediate for ease of reading
	
	int animalID;
	ReviewDAO reviewDAO;
	List<Review> allReviews;
	Animal intermediateAnimal;
	
	//animalID = ((Animal) pageContext.getAttribute("animal")).getAnimalID();        // hellspawn of Java, JSTL, and MySQL
	
	intermediateAnimal = (Animal) pageContext.getAttribute("animal");           // Intermediate to breakdown above line o_0
	animalID = intermediateAnimal.getAnimalID();                                // spawn of hellspawn
	
	reviewDAO = new ReviewDAO();
	try {
		allReviews = reviewDAO.getAllReviewsForAnimal(animalID);
	}
	catch (SQLException e) {
		e.printStackTrace();
		allReviews = null;
	}
	
	request.setAttribute("listReviews", allReviews);                        	// So we can use EL testing below
%>

<div>
	<!-- Column 1: All traits for the animal -->
	<td>
		
		<!-- !! Incorporate Bri's code -->
		<c:forEach var="trait" items="${animal.traitsList}">
			<c:out value="${trait}"/>
			<br>
		</c:forEach>
		<!-- !! -->
	
	</td>
	
	<!-- Column 2: Extra Options (e.g. who reviewed my animal (if myAdoptions) or add to crate -->
	<td>
		<c:choose>
			<c:when test="<%=myAdoptions%>">
				<ul id="customUL">
					<c:forEach var="review" items="${listReviews}">
						<!-- CRITICAL CHECK: What are we linking to exactly?? -->
						<li>
							<a href=""><c:out value="${review.author}"/></a>
						</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				<form action="ReviewAnimal">
					<input type="hidden" name="animalID" value="${animal.animalID}">
					<input
							type="image" alt="Post Review"
							src="./Images/rating_arrows.png"
							width="30px" height="30px"
					>
				</form>
				<form action="AddFavAnimal">
					<input type="hidden" name="animalID" value="${animal.animalID}">
					<input
							type="image" value="Add to Favorites"
							src="./Images/fav_star.png"
							width="30px" height="30px"
					>
				</form>
				<form action="AddToCrate" method="post">
					<input type="hidden" name="animalID" value="${animal.animalID}">
					<input
							type="image" alt="Add to Crate"
							src="./Images/add_to_crate.png"
							width="30px" height="30px"
					>
				</form>
				<form action="RemoveFromCrate">
					<input type="hidden" name="animalID" value="${animal.animalID}">
					<input
							type="image" alt="Remove from Crate"
							src="./Images/remove_from_crate.png"
							width="30px" height="30px"
					>
				</form>
			</c:otherwise>
		</c:choose>
	</td>
</div>
</html>