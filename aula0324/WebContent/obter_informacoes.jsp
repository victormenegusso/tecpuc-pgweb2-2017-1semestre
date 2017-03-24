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
		Nome: <input name="nome" /><br /> Idade: <input name="idade" /><br />

		<input name="btn" type="submit" value="guardar" />

	</form>

	<%
		String nome;
		int idade;

		if (request.getParameter("btn") != null) {
			// obtendo os dados do formulario
			nome = request.getParameter("nome");
			idade = Integer.parseInt(request.getParameter("idade"));
			
			// colocar os dados do formulario em sessao
			//request.getSession() -> pega a sessao
			// relacionada a requisicao.
			// se não existir sessão é criada
			
			HttpSession sessao = request.getSession();
			
			sessao.setAttribute("sessao_nome", nome);
			sessao.setAttribute("sessao_idade", idade);
		}
	%>
	
	<a href="obter_dados_sessao.jsp">link</a>






</body>
</html>