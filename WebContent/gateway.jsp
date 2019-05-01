<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gateway</title>
</head>
<body>

</body>
</html>

<%
int userExits;
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/salaryManagement","root","***REMOVED***");  
Statement stmt = con.createStatement();

String emailID = request.getParameter("email");
String password = request.getParameter("password");
String type = request.getParameter("type");

if(type.equals("Register")) {
	userExits = 0;
	ResultSet rs = stmt.executeQuery("select managerPassword from ManagerData where managerEmailID='"+emailID+"'");
	while(rs.next()) {
		userExits=1;
	}
	
	if(userExits==1) {
		out.println("user allready exits");
	} else {
		stmt.executeUpdate("insert into ManagerData(managerEmailID,managerPassword) values('"+emailID+"','"+password+"');");
		response.sendRedirect("manager.jsp?managerEmailID="+emailID);
	}

} else if(type.equals("Login")) {
	String passwordFromDatabase="";
	userExits = 0;
	ResultSet rs = stmt.executeQuery("select managerPassword from ManagerData where managerEmailID='"+emailID+"'");
	while(rs.next()) {
		userExits=1;
		passwordFromDatabase=rs.getString(1);
	}
	
	if(userExits==1) {
		if(passwordFromDatabase.equals(password)) {
			response.sendRedirect("manager.jsp?managerEmailID="+emailID);
		} else {
			out.println("Invalid Password");
		}
		
	} else {
		out.println("User doesnt exit, please register.!");
	}
}
%>