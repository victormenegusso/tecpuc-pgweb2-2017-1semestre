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
	String n;
	int i;
	
	HttpSession sessao = request.getSession();
	
	n = (String) sessao.getAttribute("sessao_nome");
	i = (int) sessao.getAttribute("sessao_idade");
%>

<h1>NOME: <%= n %> </h1>
<h1>IDADE: <%= i %>></h1>
</body>
</html>



