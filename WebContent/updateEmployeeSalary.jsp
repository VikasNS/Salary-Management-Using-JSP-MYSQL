<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee Salary</title>
</head>
<body>
	<h1>Processing...!</h1>
</body>
</html>


<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/salaryManagement","","");
	Statement smt = con.createStatement();
	

	String managerEmailID = request.getParameter("managerEmailID");
	String[] emailIDArray = request.getParameterValues("emailID");
	String[] updatedSalaryArray = request.getParameterValues("updatedSalary");
	String emailID="ginger";
	int updatedSalary=0;
	for(int i=0;i<updatedSalaryArray.length;i++) {
		if(!updatedSalaryArray[i].equals("")) {
			emailID = emailIDArray[i];
			updatedSalary = Integer.parseInt(updatedSalaryArray[i]);
			break;
		}
	}
	smt.executeUpdate("Update employeeData SET employeeSalary='"+updatedSalary+"' where employeeEmail='"+emailID+"';");
	out.println("Update employeeData SET employeeSalary='"+updatedSalary+"' where employeeEmail='"+emailID+"';");
	out.println(emailID);
	out.println(updatedSalary);
	response.sendRedirect("manager.jsp?managerEmailID="+managerEmailID);
%>
