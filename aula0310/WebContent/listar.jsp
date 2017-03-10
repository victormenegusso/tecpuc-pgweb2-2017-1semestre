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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>

<table class="table" >
	<tr>
		<th>id</th>
		<th>nome</th>
		<th>preco</th>
		<th>detalhes</th>
	</tr>
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
		<tr>
			<td><%=tabela.getString("id") %></td>
			<td><%=tabela.getString("nome") %></td>
			<td><%=tabela.getDouble("preco") %></td>
			<td><a href="detalhe_produto.jsp">detalhes</a></td>
		</tr>
	<%
	}
	
	// fechar conexao
	con.close();
%>

</table>

</body>
</html>