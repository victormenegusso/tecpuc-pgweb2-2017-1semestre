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
	// verificar se o cara esta logado
	if( request.getSession().getAttribute("login") == null){
		response.sendRedirect("login.jsp");
	}
%>

<%
	String login;

	login = (String)request.getSession().getAttribute("login");
%>
	<h1>Welcome <%=login %></h1>
	
	<a href="logout.jsp">logout</a>
</body>
</html>




