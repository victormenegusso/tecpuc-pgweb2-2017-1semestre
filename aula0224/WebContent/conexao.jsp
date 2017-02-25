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
	
	// dados da conexao //
	Connection con;
	String url="jdbc:mysql://localhost:3306/aula";
	String user = "root";
	String password = "admin";
	
	// carregando a classe do banco (apenas no tomcat)
	Class.forName("com.mysql.jdbc.Driver");
	
	// obtendo uma conexao
	con = DriverManager.
			getConnection(url, user, password);
	
	
	// fechar a conexao
	con.close();
%>

</body>
</html>