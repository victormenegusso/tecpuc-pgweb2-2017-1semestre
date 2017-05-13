<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	Formulario para cadasto de pessoa.
	action -> URL para onde vou mandar o formulario
	
	method -> POST pois é um cadastro
 	
 	enctype -> multipart/form-data para arquivos
 -->
<form action="cadastrarpessoa" 
	method="post"
	enctype="multipart/form-data">

	CPF: <input name="cpf"/><br/>
	Nome: <input name="nome"/><br/>
	Foto: <input name="foto" type="file"/><br/>

	
	<input type="submit" name="btn" value="cadastrar"/>
	
</form>



</body>
</html>