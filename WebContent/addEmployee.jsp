<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
	<h1>Processing...!</h1>
</body>
</html>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/salaryManagement","","");
	Statement smt = con.createStatement();
	String name = request.getParameter("name");
	String emailID = request.getParameter("emailID");
	int salary = Integer.parseInt(request.getParameter("salary"));
	String managerEmailID = request.getParameter("managerEmailID");
	smt.executeUpdate("insert into EmployeeData (employeeEmail,employeeName,employeeSalary,managerEmail) values('"+emailID+"','"+name+"','"+salary+"','"+managerEmailID+"');");

	response.sendRedirect("manager.jsp?managerEmailID="+managerEmailID);
%>
