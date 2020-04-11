<html>
<head>
	<meta charset="UTF-8">
</head>
<%
	// AdoptionListExtras used for both "All Adoptions" and "My Adoptions"
	//
	// myAdoptions: Review
	
	
	// [ MyAdoptions == Animals I Posted ]
	boolean myAdoptions = request.getAttribute("myAdoptions") == "true";
%>

<div>
	<!-- Column 1: All traits for the animal -->
	<td width="">
		<c:forEach var="trait" items="${animal.traitsList}">
			<c:out value="${trait}"/>
			<br>
		</c:forEach>
	</td>
	<!-- Column 2: Extra Options (e.g. who reviewed my animal (if myAdoptions) or add to crate -->
	<td>
		<c:choose>
			<c:when test="<%=myAdoptions%>">
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
							type="image" value="Add to Crate"
							src="./Images/add_to_crate.png"
							width="30px" height="30px"
					>
				</form>
				<form action="RemoveFromCrate">
					<input type="hidden" name="animalID" value="${animal.animalID}">
					<input
							type="image" alt="Remove From Crate"
							src="./Images/remove_from_crate.png"
							width="30px" height="30"
					>
				</form>
			</c:otherwise>
		</c:choose>
	</td>
</div>
</html>