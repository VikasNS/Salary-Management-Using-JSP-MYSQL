<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<meta charset="ISO-8859-1">
<title>Salary Management Portal</title>
</head>
<body>
	<h1>Salary Management System</h1>
	<hr>
	<h2>Registration</h2> <br>
	<form id="registrationForm" action="gateway.jsp">
		Email : <input type="text" name="email"/> <br><br>
		Password : <input type="text" name="password"/> <br><br>
		<input type="submit" value="Register" name="type"/> <br><br>
	</form> 
	<hr>
	<br><h2>Login</h2> <br>
	<form id="loginForm" action="gateway.jsp">
		Email : <input type="text" name="email"/> <br><br>
		Password : <input type="text" name="password"/> <br><br>
		<input type="submit" value="Login" name="type"/> <br><br>
	</form> 
	<hr>	
</body>
</html>