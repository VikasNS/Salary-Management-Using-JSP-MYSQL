<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Portal</title>
</head>
<body>
	<h1>Manager Portal</h1>
	<hr>
	<h2>Add New Employee</h2>
	<form action="addEmployee.jsp" id="newEmployeeForm">
		Name: <input type="text" name="name"/>
		emailID: <input type="text" name="emailID"/>
		Salary: <input type="text" name="salary"/>
		<input type="submit" value="Add"/>
	</form>
	<hr>
	<br>
	<h2>Existing Employee Details</h2>
</body>
</html>
<script type="text/javascript">
function deleteEmployee(id) {
	var managerEmailID = document.getElementById("managerEmailID").value;
	var url = "deleteEmployee.jsp?emailID="+id+"&managerEmailID="+managerEmailID;
	window.open(url);
}
</script>

<%!
	public class Row {
		public String name;
		public String emailID;
		public String salary;
		
		Row(String emailID, String name, String salary) {
			this.name = name;
			this.emailID = emailID;
			this.salary = salary;
		}
		
		public String getRowHTML() {
			String updateSalaryTextBos = "<input type=\"text\" name=\"updatedSalary\" form=\"updateEmployeeSalary\" />";
			String hiddenEmailIdUpdateSalary = "<input type=\"hidden\" name=\"emailID\" form=\"updateEmployeeSalary\""+"value=\""+emailID+"\""+"/>";
			String updateSalaryButton = "<input type=\"submit\" form=\"updateEmployeeSalary\" value=\"Update\">";
			String deleteEmployeeButton ="<input type=\"submit\" form=\"deleteEmployee\" value=\"Delete\" onclick=\"deleteEmployee('"+emailID+"');\">";
			String hiddenEmailIdDelete = "<input type=\"hidden\" name=\"emailID\" form=\"deleteEmployee\""+"value=\""+emailID+"\""+"/>";
			return " <tr> <th>"+name+"</th> <th>"+emailID+"</th> <th>"+salary+"</th> <th>"+ updateSalaryTextBos +"</th> <th>" + updateSalaryButton + "</th> <th>" +deleteEmployeeButton  + "</th> <th>" + hiddenEmailIdUpdateSalary + "</th> <th>" + hiddenEmailIdUpdateSalary +"</th> </tr>";
		}
	}

%>
	
<%
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/salaryManagement","","");  
	Statement stmt = con.createStatement();
	
	String managerEmailID=request.getParameter("managerEmailID");
	out.println("<input type=\"hidden\" name=\"managerEmailID\" form=\"newEmployeeForm\" value=\""+managerEmailID+"\">");
	out.println("<input type=\"hidden\" name=\"managerEmailID\" form=\"updateEmployeeSalary\" value=\""+managerEmailID+"\">");
	out.println("<form id=\"updateEmployeeSalary\" action=\"updateEmployeeSalary.jsp\"></form>");
	out.println("<form id=\"deleteEmployee\" action=\"deleteEmployee.jsp\"></form>");
	out.println("<table border=\"1\"> <tr> <th>Name</th> <th>Email ID</th> <th>Salary</th> <th>Updated Salary</th> <th>Update button</th> <th>Delete button</th> </tr>");
	out.println("<input type=\"hidden\" id=\"managerEmailID\" value=\""+managerEmailID+"\" />");
	
	ResultSet rs = stmt.executeQuery("select * from employeeData where managerEmail = '"+managerEmailID+"'");
	while(rs.next()) {
		Row r = new Row(rs.getString(1),""+rs.getString(2),""+rs.getInt(3));
		out.println(r.getRowHTML());
	}
	out.println("</table>");
	out.println("<br><hr>");
%>



