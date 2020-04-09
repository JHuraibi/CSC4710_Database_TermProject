<%@ page
		language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#init {
			display: inline-block;
			min-width: 300px;
			min-height: 200px;
		}
	</style>
	<title>Initialize Database</title>
</head>
<body>
	<div id="init">
		<form action="InitializeDB" method="post">
			<input type="submit" value="Initialize Database"/>
		</form>
	</div>
</body>
</html>
