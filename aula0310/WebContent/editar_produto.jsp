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
	int id;
	id = Integer.parseInt( request.getParameter("id") );
	out.print(id);
%>

<%
	if(request.getParameter("btn") != null){
		
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		double preco = Double.parseDouble( request.getParameter("preco") );
		
		Connection con2;
		String url2 = "jdbc:mysql://localhost:3306/aula";
		String user2 = "root";
		String password2 = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		con2 = DriverManager.getConnection(url2, user2, password2);
	
		String sql2;
		sql2 = "update produtos set nome=?, descricao=?, preco=? where id = ?";
	
		PreparedStatement ps2;
		ps2 = con2.prepareStatement(sql2);
		
		ps2.setString(1, nome);
		ps2.setString(2, descricao);
		ps2.setDouble(3, preco);
		ps2.setInt(4, id);
		
		ps2.executeUpdate();
		
		// fechar conexao
		con2.close();
	}

%>

<% 
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
	<form method="post">
		Id: <input name="id"
			value="<%= tabela.getInt("id") %>" /> <br/>
		
		Nome: <input name="nome" 
			value="<%= tabela.getString("nome") %>" /><br/>
		
		Descricao: <input name="descricao"
			value="<%= tabela.getString("descricao") %>" /> <br/>
		
		Preco: <input name="preco"
			value="<%= tabela.getDouble("preco") %>" /><br/>
		
		<input type="submit" value="editar" name="btn"/>
	</form>
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