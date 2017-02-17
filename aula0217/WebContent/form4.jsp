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
	numero 1: <input name="n1"/><br/>
	numero 2: <input name="n2"/><br/>
	
	<input name="btn" 
		type="submit" value="somar" />
</form>

<%
	// obtendo dados do formulario
	int n1 = 0;
	int n2 = 0;
	int r;
	// verificando se existe o input 'btn' na
	// requisição 
	if( request.getParameter("btn") != null){
		n1 = Integer.parseInt( request.getParameter("n1") );
		n2 = Integer.parseInt( request.getParameter("n2") );
		
		// soma
		r = n1 + n2;
%>	
		<h1>A soma de <%=n1 %> + <%=n2 %> ></h1>
		<h1><%= r %></h2>
<%
	}
%>


</body>
</html>

