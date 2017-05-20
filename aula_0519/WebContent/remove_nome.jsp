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
	item: <input name="item"/><br/>
	<input type="submit" name="btn" value="remover"/> 
</form>

<%
	if( request.getParameter("btn") != null){
		
		String item;
		item = request.getParameter("item");
		
		ArrayList<String> lista;
		
		// pegando a lista da sessao
		lista = (ArrayList) request.getSession()
					.getAttribute("carrinhoString");
		
		if( lista == null ){
			out.print("item nao encontrado");
		}
		else{
			boolean removeu;
			removeu = lista.remove( item );
			
			if( removeu ){
				out.print("produto removido com sucesso");
			}
			else{
				out.print("item nao encontrado");
			}
		}
		
	}
%>
<a href="addlista.jsp">add</a>
<a href="listar.jsp">lista</a>

</body>
</html>