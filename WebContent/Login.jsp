<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<title>User Login :: Adoption</title>
</head>
<body>
	<header align="center">
		<h1>Adoption Website Login</h1>
	</header>
	<div id="wrapper">
		<fieldset>
			<legend>Enter your Username and Password</legend>
			<form action="CheckLogin" method="post" id="loginForm" autocomplete="on">
				<label for="username">*Username</label>
				<input name="username" id="username" type="text" autofocus="autofocus" required>
				<br>
				<label for="password">*Password</label>
				<input name="password" id="password" type="password" required>
				<br>
				<input type="submit" value="Login" align="middle">
				<br><br><br>
				<a href="NewUsersForm.jsp" style="font-size: small">
					Don't have an Account? Click Here to Register.
				</a>
			</form>
		</fieldset>
	</div>
</body>
</html>
