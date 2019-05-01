<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body>
	<h1>Processing...!</h1>
</body>
</html>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/salaryManagement","root","***REMOVED***");
	Statement smt = con.createStatement();
	String emailID = request.getParameter("emailID");
	String managerEmailID = request.getParameter("managerEmailID");
	
	smt.executeUpdate("DELETE FROM employeeData WHERE employeeEmail='"+emailID+"';");
	response.sendRedirect("manager.jsp?managerEmailID="+managerEmailID);
%>