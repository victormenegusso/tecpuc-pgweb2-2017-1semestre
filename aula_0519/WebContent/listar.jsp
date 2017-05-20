<%@page import="java.util.ArrayList"%>
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
	// declarnado a lista
	ArrayList<String> lista;

	// pegar a lista da sessao
	lista = (ArrayList<String>)request.getSession()
		.getAttribute("carrinhoString");
	
	if(lista == null){
		out.print("lista vazia");
	}
	else{
		
		for(String item : lista){
			out.print(item);
			out.print("<br/>");
		}
		
	}
%>
<a href="addlista.jsp">add lista</a>

</body>
</html>