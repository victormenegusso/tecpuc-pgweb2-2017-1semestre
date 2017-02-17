<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>

<form method="post" >
	Estado: <input name="estado"/><br/>
	Cidade: <input name="cidade"/><br/>
	<input name="btn" value="enviar"/><br/>
</form>

<%
	String a;
	String b;
	
	a = request.getParameter("estado");
	b = request.getParameter("cidade");

	out.print(a);
	out.print(b);
%>


</body>
</html>