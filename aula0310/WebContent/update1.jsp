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
	// atualizar o preço de todos os produtos
	
	// 1 - conectar no banco 
	Connection con;
	String user = "root";
	String password = "admin";
	String url = "jdbc:mysql://localhost:3306/aula";
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url,user,password);
	
	// 2 - executar o comando 
	String sql = "update produtos set preco = 100";
	PreparedStatement ps;
	ps = con.prepareStatement(sql);
	
	int numRegistros;
	numRegistros = ps.executeUpdate();
	
	out.print( numRegistros );
	
	// 3 - fechar a conexao 
	con.close();
%>


</body>
</html>