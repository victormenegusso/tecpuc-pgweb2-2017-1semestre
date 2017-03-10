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
	ID: <input name="id"/><br/>
	Preco: <input name="preco"/><br/>
	<input type="submit" name="btn" value="Editar"> 
</form>

<%
	// verificando se o botão foi precionado
	// para poder executar o comando de update
	if( request.getParameter("btn") != null){
		int id;
		double preco;
			
		// pegando os inputs do formulario
		// convertendo eles para o tipo certo
		id = Integer.parseInt( request.getParameter("id") );
		preco = Double.parseDouble( request.getParameter("preco") );
		
		// 1 - conectar no banco 
		Connection con;
		String user = "root";
		String password = "admin";
		String url = "jdbc:mysql://localhost:3306/aula";
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url,user,password);
		
		// 2 - executar o comando 
		String sql = "update produtos set preco = ? where id = ?";
		PreparedStatement ps;
		ps = con.prepareStatement(sql);
		
		ps.setDouble(1, preco);
		ps.setInt(2, id);
		
		int numRegistros;
		numRegistros = ps.executeUpdate();
		
		out.print( numRegistros );
		
		// 3 - fechar a conexao 
		con.close();
	}
%>


</body>
</html>