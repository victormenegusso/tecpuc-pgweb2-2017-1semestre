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
	String nome;
	String endereco;
	
	nome = request.getParameter("fnome");
	endereco = request.getParameter("fend");
	
	// imprimindo no HTML //
	out.print( nome );
	out.print(endereco);
	
	out.print("<br/>");
	
	// imprimindo no HTML //
	out.println( nome );
	out.println(endereco);
	
	// imprimindo no HTML com BR//
	out.print("<br/>");
	out.print( nome + "<br/>");
	out.print(endereco + "<br/>");
	
	// imprimindo no console //
	System.out.println(nome);
	System.out.println(endereco);
%>

<p><%out.print(nome); %></p><br/>
<p><%= nome %></p><br/>
<!-- obtendo o parametro via EL -->
<!-- param.NAME_INPUT -->
<p>${param.fnome}</p>




</body>
</html>