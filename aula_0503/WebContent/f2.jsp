<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="meuservlet2" method="post" >
	Nome: <input name="nome" /><br/>
	<input type="submit" name="btn" value="enviar"/>	
</form>

<%
	if(request.getParameter("nome") != null){
		String nome = request.getParameter("nome");
		out.print(nome + " cadastrado com sucesso");
	}
%>
</body>
</html>




