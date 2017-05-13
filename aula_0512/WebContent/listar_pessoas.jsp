<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String usr = "root";
		String pass = "admin";
		String url = "jdbc:mysql://localhost:3306/aula";

		Class.forName("com.mysql.jdbc.Driver"); // apenas no tomcat
		Connection con;
		con = DriverManager.getConnection(url, usr, pass);
		
		String sql;
		sql = "select * from pessoas";
		
		PreparedStatement ps;
		ps = con.prepareStatement(sql);
		
		ResultSet rs;
		rs = ps.executeQuery();
		
		while(rs.next()){
			
	%>
		<!-- isto esta dentro do while -->
		<div>
			<img
				height="100px"
				width="100px" 
				src="carregarimagem?foto=<%= rs.getString("arquivo_foto")%>"><br/>
			<p> <%= rs.getString("cpf") %> </p>
			<p> <%= rs.getString("nome") %> </p>
		</div>
	<%	
		}
	%>


</body>
</html>