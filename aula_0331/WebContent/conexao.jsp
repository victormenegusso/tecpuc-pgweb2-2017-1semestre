<%@page import="aula.FabricaConexao"%>
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
	// forma basica de abrir conexao
	String usuario = "root";
	String senha = "admin";
	String url = "jdbc:mysql://localhost:3306/aula";
	Class.forName("com.mysql.jdbc.Driver");

	Connection con;
	con = DriverManager.getConnection(url,usuario,senha);
	// ....
	con.close();

	
	// outra forma
	Connection con2;
	
	// criando o objeto fabrica de conexao
	FabricaConexao fc = new FabricaConexao();
	con2 = fc.obterConexao();
	
	con2.close();
	
	// outra forma
	Connection con3;
	con3 = FabricaConexao.obterConexao2();
	
%>

</body>
</html>






