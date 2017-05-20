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

<form method="post">
	
	Item : <input name="item" /><br/>
	
	<input type="submit" name="btn" value="add"/>

</form>
<a href="listar.jsp">lista</a>


<%
	if( request.getParameter("btn") != null ){
		String item;
		
		// pegando o input do form
		item = request.getParameter("item");
		
		// declarando a lista
		ArrayList<String> lista;
		
		// pegar a lista da sessao
		lista = (ArrayList<String>)request.getSession()
						.getAttribute("carrinhoString");
		
		// verificar se a lista existe
		// se nao existir criamos ela
		// e colocamos em sessao
		if( lista == null){ // nao existe
			lista = new ArrayList<>();
			request.getSession()
						.setAttribute("carrinhoString", lista);
		}
		
		// adiciona item na lista
		lista.add(item);
	}

%>


</body>
</html>