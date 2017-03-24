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
	Login <input name="login"/><br/>
	Senha <input name="senha"/><br/>
	
	<input type="submit" value="logar" name="btn"><br/>
</form>

<%
	String login,senha;
	
	if(request.getParameter("btn") != null){
		login = request.getParameter("login");
		senha = request.getParameter("senha");
		
		// aqui faria um sql no banco de dados
		// para validar o login / senha
		
		request.getSession().setAttribute("login", login);
		
		//enviar para outra página 'index.jsp'
		response.sendRedirect("index.jsp");
	}
%>

</body>
</html>




