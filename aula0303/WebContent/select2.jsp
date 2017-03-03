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
	// abrir uma conexao com BD
	Connection con;
	String url = "jdbc:mysql://localhost:3306/aula";
	String user = "root";
	String password = "admin";
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);

	// executar o select 
	String sql;
	sql = "select * from produtos";
	
	PreparedStatement ps;
	ps = con.prepareStatement(sql);

	ResultSet tabela;
	tabela = ps.executeQuery();
	
	// processar o resultado do select
	// imprimir linha a linha
	while( tabela.next() ){
	%>
		<h1> <%= tabela.getString("id") %> </h1>
		<h1> <%= tabela.getString("nome") %> </h1>
		<h1> <%= tabela.getString("descricao") %> </h1>
		<h1> <%= tabela.getDouble("preco") %> </h1>
	<%
	}
	
	// fechar conexao
	con.close();
%>




</body>
</html>