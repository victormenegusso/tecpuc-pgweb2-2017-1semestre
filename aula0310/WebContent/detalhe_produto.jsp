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
TESTE

<%
	int id;
	id = Integer.parseInt( request.getParameter("id") );
	out.print(id);
	
	// abrir conexao 
	Connection con;
	String url = "jdbc:mysql://localhost:3306/aula";
	String user = "root";
	String password = "admin";
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	// executar a sql
	String sql;
	sql = "select * from produtos where id = ?";
	
	PreparedStatement ps;
	ps = con.prepareStatement(sql);
	
	ResultSet tabela;
	ps.setInt(1, id);
	tabela = ps.executeQuery();
	
	// mostrar os dados
	if( tabela.next() ){
	%>		
		Id: <%= tabela.getInt("id") %><br/>
		Nome: <%= tabela.getString("nome") %><br/>
		Descricao: <%= tabela.getString("descricao") %><br/>
		Preco: <%= tabela.getDouble("preco") %><br/>
	<%
	}
	else{
		out.print("id nao encontrado");
	}
	
	// fechar conexao 
	con.close();
	
	
	
%>
</body>
</html>