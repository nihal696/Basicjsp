<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!Connection con;
PreparedStatement ps;

public void jspInit(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/learn","root","root");
		ps=con.prepareStatement("insert into student values(?,?,?,?)");
	}catch(Exception e){
		e.printStackTrace();
	}
	
}

public void jspDestroy() {
	try{
		ps.close();	
		con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	
}
%>

<%
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String country=request.getParameter("country");
String city=request.getParameter("city");


ps.setInt(1,id);
ps.setString(2,name);
ps.setString(3,country);
ps.setString(4,city);
ps.executeUpdate();

%>

</body>
</html>