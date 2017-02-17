<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form>
	Nome: <input name="nome"/><br/>
	Endereco: <input name="end"/><br/>
	
	<input name="btn" 
		type="submit" value="enviar" />
</form>

</body>
</html>

<%
	// obtendo dados do formulario
	String nome;
	String endereco;
	
	// verificando se existe o input 'btn' na
	// requisição 
	if( request.getParameter("btn") != null){
		nome = request.getParameter("nome");
		endereco = request.getParameter("end");
		
		out.print( nome );
		out.print("<br/>");
		out.print(endereco);
	}
	
%>