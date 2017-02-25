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

	<form method="post">
		Nome : <input name="fnome"/><br/>
		Descricao : <input name="fdesc"/><br/>
		Preco : <input name="fpreco"/><br/>
		
		<input type="submit" value="salvar" name="btn" />
	</form>
	

	<%
	if( request.getParameter("btn") != null 
		&&
			request.getMethod().equals("POST")){

		// obter os dados do formulario
		String nome = request.getParameter("fnome");
		String desc = request.getParameter("fdesc");
		double preco;
		preco = Double.parseDouble( request.getParameter("fpreco") );
		
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
		
		// montando a sql
		String sql;
		sql = "insert into produtos (nome,descricao,preco) values ";
		sql+= "(?,?,?);";
		
		// executar
		PreparedStatement cmd;
		cmd = con.prepareStatement( sql );
		
		cmd.setString(1,nome);
		cmd.setString(2,desc);
		cmd.setDouble(3, preco);
		
		// executando a sql
		cmd.executeUpdate();
		
		// fechar a conexao
		con.close();
		
		out.print("Cadastrado com sucesso");
	}
	
%>

</body>
</html>